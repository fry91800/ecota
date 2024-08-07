const db = require('../data/database.js');
const { v4: uuidv4 } = require('uuid');
async function getOrgaFromMail(mail) {
    return db.Orga.findOne({
        where: { mail: mail },
        raw: true
    })
}

async function addResetToken(mail) {
    var resetToken = uuidv4();
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
        { resetdeadline: tokenExpire },
        {
            where: {
                mail: mail,
            },
        },
    )
    return resetToken;

}

async function findByToken(token) {
    return db.Orga.findOne({
        where: { resettoken: token },
        raw: true
    })
}

async function resetPass(hashedPassword, token)
{
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
    getOrgaFromMail,
    addResetToken,
    findByToken,
    resetPass
}