const CustomError = require('../error/CustomError.js');
const db = require("../data/database.js");
const { DataTypes } = require('sequelize');
const { v4: uuidv4 } = require('uuid');
const bcrypt = require('bcrypt');
async function auth(mail, pass)
{
    //Récupère le mail et le pass de la base de données
    var record = await db.Orga.findOne({
        where: { mail: mail },
        raw: true
      })
      .catch(err => {
        console.error(err)
      });
    //Vérifie l'existance du mail
    if (!record)
    {
        CustomError.mailNoExistError();
    }
    //Vérifie le mot de passe
    const match = await bcrypt.compare(pass, record.pass);
    if (!match)
    {
        CustomError.wrongPassError();
    }
    //Tout est ok, Création de la session
    var session = await db.Session.create({orgaid: record.id}).catch(err => {
      console.error(err)
      });
    return session;
}

async function addResetToken(mail)
{
  //Vérification de l'existence du champs "mail"
  if (!mail)
  {
    CustomError.missingFieldError();
  }
  //Récupère le mail et le pass de la base de données
  var record = await db.Orga.findOne({
    where: { mail: mail },
    raw: true
  })
  .catch(err => {
    console.error(err)
  });
  //Vérifie l'existance du mail
  if (!record)
  {
      CustomError.mailNoExistError();
  }
  var resetToken = uuidv4();
  try{
  await db.Orga.update(
    { resettoken: resetToken },
    {
      where: {
        mail: mail,
      },
    },
  )
  var tokenExpire = new Date();
  tokenExpire.setMinutes(tokenExpire.getMinutes() + 15);
  await db.Orga.update(
    { resetdeadline: tokenExpire},
    {
      where: {
        mail: mail,
      },
    },
  )
  return resetToken;
  }
  catch(e)
  {
    console.error(e);
  }
}

async function checkResetToken(token)
{
  var record = await db.Orga.findOne({
    where: { resettoken: token },
    raw: true
  })
  if (!record)
  {
    CustomError.defaultError();
  }
  var now = new Date();
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
  await db.Orga.update(
    { pass: hashedPassword },
    {
      where: {
        resettoken: token,
      },
    },
  );
}

module.exports = {
    auth,
    addResetToken,
    checkResetToken,
    resetPass
}