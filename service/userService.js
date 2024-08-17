const CustomError = require('../error/CustomError.js');
const db = require("../data/database.js");
const { DataTypes } = require('sequelize');
const { v4: uuidv4 } = require('uuid');
const bcrypt = require('bcrypt');
const orgaRepository = require('../data/orgaRepository')
const sessionRepository = require('../data/sessionRepository')
const { logger, logEnter, logExit } = require('../config/logger');

async function login(mail, pass) {
  logger.debug(`Log in: Mail: ${mail}, Pass: ${pass}`);
  // Step 1: Récupération du record posédant le mail envoyé
  const query = { where: { mail: mail } };
  const record = await orgaRepository.getOne(query); // [{mail, pass, *}]
  // Step 2: Vérification de l'existance du mail dans la base
  if (!record) {
    CustomError.mailNoExistError();
  }
  // Step 3: Vérification du mot de passe
  const match = await bcrypt.compare(pass, record.pass);
  if (!match) {
    CustomError.wrongPassError();
  }
  // Step 4: Création de la session
  const object = { orgaid: record.id };
  logger.debug(`Log in: Inserting new session for user: ${record.id}`);
  return sessionRepository.insertOne(object);
}

async function startResetPassSession(mail) {
  try {
    // Step 1: Generation d'un token (uuid)
    var resetToken = uuidv4();
    // Step 2: Insertion du token dans la base de donnée
    const updateToken = { resettoken: resetToken }
    const whereMail = { where: { mail: mail } }
    logger.debug("Adding reset token: " + resetToken + " for user: " + mail);
    await orgaRepository.update(updateToken, whereMail);
    // Step 3: Ajout de la date d'expiration pour la session de récupération de pass
    const tokenExpirationDate = new Date();
    tokenExpirationDate.setMinutes(tokenExpirationDate.getMinutes() + 15);
    const updateResetDeadLine = { resetdeadline: tokenExpirationDate }
    logger.debug("Adding token expiration date: " + tokenExpirationDate + " for user: " + mail);
    await orgaRepository.update(updateResetDeadLine, whereMail)
    return resetToken;
  }
  catch (e) {
    console.error(e);
  }
}

async function checkResetToken(token) {
  // Step 1: Vérification de l'existence du token
  const query = { where: { resettoken: token } };
  const record = await orgaRepository.getOne(query);
  if (!record) {
    CustomError.defaultError();
  }
  // Step 2: Vérification de la validité du token
  const now = new Date();
  if (now > record.resetdeadline) {
    CustomError.tokenExpiredError();
  }
  return true;
}

async function resetPass(token, plainPassword) {
  try {
    // Step 1: Vérification de la validité du token de changement de pass
    await checkResetToken(token);
    // Step 2: Ajout de couche de sécurité
    const saltRounds = 10;
    const salt = await bcrypt.genSalt(saltRounds);
    const hashedPassword = await bcrypt.hash(plainPassword, salt);
    // Step 2: Modification du pass
    logger.debug("Updating password for token: "+token)
    const updatePass = {pass: hashedPassword};
    const whereToken = { where: { resettoken: token} }
    await orgaRepository.update(updatePass, whereToken);
  }
  catch (e) {
    console.error(e)
  }
}

module.exports = {
  login,
  startResetPassSession,
  checkResetToken,
  resetPass
}