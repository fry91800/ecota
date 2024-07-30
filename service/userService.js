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
        console.log("pas de record");
        CustomError.testError();
    }
    //Vérifie le mot de passe
    const match = await bcrypt.compare(pass, record.pass);
    if (!match)
    {
        console.log(record);
        console.log("mauvais pass");
        CustomError.testError();
    }
    //Tout est ok, Création de la session
    var session = await db.Session.create({orgaid: record.id}).catch(err => {
        console.error(err)
      });
    return session;
}

async function addResetToken(mail)
{
  var resetToken = uuidv4();
  console.log("http://localhost:3000/user/passreset?token="+resetToken)
  await db.Orga.update(
    { resettoken: resetToken },
    {
      where: {
        mail: mail,
      },
    },
  );
}

async function checkResetToken(token)
{
  var record = await db.Orga.findOne({
    where: { resettoken: token },
    raw: true
  })
  if (!record)
  {
    CustomError.testError();
  }
  /*
  var datetime = new Date();
  if (datetime>record.resetdeadline)
  {
    return false
  }
  */
  return true;
}

async function resetPass(token, plainPassword)
{
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