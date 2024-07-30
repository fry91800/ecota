const CustomError = require('../error/CustomError.js');
const db = require("../data/database.js");
const { DataTypes } = require('sequelize');
const { v4: uuidv4 } = require('uuid');
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
    if (record.pass !== pass)
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
  console.log(resetToken)
  console.log(mail)
  await db.Orga.update(
    { resettoken: resetToken },
    {
      where: {
        mail: mail,
      },
    },
  );
}

module.exports = {
    auth,
    addResetToken
}