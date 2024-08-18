const db = require('../data/database.js');

async function getOne(query = {}) {
  query["raw"] = true;
  return db.Campaign.findOne(query);
}
async function getAll(query = {}) {
  query["raw"] = true;
  return db.Campaign.findAll(query);
}
async function update(update, where)
{
  await db.Campaign.update(update, where)
}
async function getCurrentCampain() {
  const currentYear = new Date().getFullYear();
  return db.Campaign.findOne({
    where: { year: currentYear },
    raw: true
  })
}
async function addCurrentCampaign() {
  const currentYear = new Date().getFullYear();
  await db.Campaign.create({
    year: currentYear
  })
}
async function updateParams(revenue, intensity) {
  const currentYear = new Date().getFullYear();
  await db.Campaign.update(
    {
      revenue: revenue,
      intensity: intensity
    },
    {
      where: { year: currentYear }
    }
  )
}
module.exports =
{
  getOne,
  getAll,
  update,
  getCurrentCampain,
  addCurrentCampaign,
  updateParams
}