//const db = require("./database")
const {sequelize} = require("./database")

async function getSessionData(sessionId)
{
    console.log("id: "+sessionId)
  const [results, metadata] = await sequelize.query(
    `SELECT session.id as sessionid, orga.id as orgaid, orga.mail as mail, orga.role as role
    FROM session
    JOIN orga on session.orgaid = orga.id
    WHERE session.id = :var
    AND session.endtime IS NULL`,
    {
        replacements: { var: sessionId },
        type: sequelize.QueryTypes.SELECT
    }
  );
  return results
}

module.exports = {
    getSessionData
}