const CustomError = require('../error/CustomError.js');
const db = require("../data/database.js");
const { DataTypes } = require('sequelize');
const { v4: uuidv4 } = require('uuid');
const bcrypt = require('bcrypt');
const orgaRepository = require('../data/orgaRepository')
const sessionRepository = require('../data/sessionRepository')
async function auth(mail, pass)
{
    // Step 1: Récupération du record posédant le mail envoyé
    const record = await orgaRepository.getOrgaFromMail(mail); // [{mail, pass, *}]
    // Step 2: Vérification de l'existance du mail dans la base
    if (!record)
    {
        CustomError.mailNoExistError();
    }
    // Step 3: Vérification du mot de passe
    const match = await bcrypt.compare(pass, record.pass);
    if (!match)
    {
        CustomError.wrongPassError();
    }
    //Step 4: Création de la session
    return sessionRepository.newSession(record.id);
}

async function addResetToken(mail)
{
  //Vérification de l'existence du champs "mail"
  if (!mail)
  {
    CustomError.missingFieldError();
  }
  //Récupère le mail et le pass de la base de données
  const record = await orgaRepository.getOrgaFromMail(mail); // [{mail, pass, *}]
  //Vérifie l'existance du mail
  if (!record)
  {
      CustomError.mailNoExistError();
  }
  try{
    return orgaRepository.addResetToken(mail);
  }
  catch(e)
  {
    console.error(e);
  }
}

async function checkResetToken(token)
{
  const record = await orgaRepository.findByToken(token);
  if (!record)
  {
    CustomError.defaultError();
  }
  const now = new Date();
  if(now>record.resetdeadline)
  {
    CustomError.tokenExpiredError();
  }
  return true;
}

async function resetPass(token, plainPassword)
{
  try {
  await checkResetToken(token);
  }
  catch(e){
    console.error(e)
  }
  console.log("newpass: "+plainPassword)
  const saltRounds = 10;
  const salt = await bcrypt.genSalt(saltRounds);
  const hashedPassword = await bcrypt.hash(plainPassword, salt);
  await orgaRepository.resetPass(hashedPassword, token);
}

module.exports = {
    auth,
    addResetToken,
    checkResetToken,
    resetPass
}