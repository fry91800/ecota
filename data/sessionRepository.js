//const db = require("./database")
const db = require("./database")

const { logger, logEnter, logExit } = require('../config/logger');

async function insertOne(object){
  return db.Session.create(object);
}

async function update(update, where){
  return db.Session.update(update, {where: where});
}

async function getSessionData(sessionId) {
  try{
  const [results, metadata] = await db.sequelize.query(
    `SELECT session.id as sessionid, orga.id as orgaid, orga.mail as mail, orga.role as role
    FROM session
    JOIN orga on session.orgaid = orga.id
    WHERE session.id = :var
    AND session.endtime IS NULL`,
    {
      replacements: { var: sessionId },
      type: db.sequelize.QueryTypes.SELECT
    }
  );
  return results
}
catch(e){
  logger.error(e);
}
}

async function getSessionStats() {
  const [results, metadata] = await db.sequelize.query(
    `SELECT session.id as sessionid, orga.id as orgaid, orga.mail as mail, orga.role as role
    FROM session
    JOIN orga on session.orgaid = orga.id`,
    {
      type: db.sequelize.QueryTypes.RAW
    }
  );
  return results
}
module.exports = {
  insertOne,
  update,
  getSessionData,
  getSessionStats
}