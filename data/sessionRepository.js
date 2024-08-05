//const db = require("./database")
const db = require("./database")

async function getSessionData(sessionId)
{
    console.log("id: "+sessionId)
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

async function getSessionStats()
{
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
    getSessionData,
    getSessionStats
}