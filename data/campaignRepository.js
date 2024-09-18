const db = require('../data/database.js');
const commonRepository = require("../data/commonRepository");

async function getMostRecentCampaign() {
  const query = { order: [["year", "DESC"]] };
  return commonRepository.getOne("Campaign", query);
}

async function updateParams(campaignYear, revenue, intensity) {
  const update = { revenue: revenue, intensity: intensity }
  const where = { where: { year: campaignYear } }
  await commonRepository.update("Campaign", update, where)
}

async function startCampaign() {
  const currentYear = new Date().getFullYear();
  await db.Campaign.create({
    year: currentYear,
    revenue: 80
  })
}

module.exports =
{
  getMostRecentCampaign,
  updateParams,
  startCampaign,
}