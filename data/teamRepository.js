const db = require('../data/database.js');
async function getCodes()
{
    const teams = await db.Team.findAll({
        attributes: ["code"],
        raw: true
      });
      return teams.map(obj => obj.code);
}

module.exports = {
    getCodes
}