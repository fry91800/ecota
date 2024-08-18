const campaignRepository = require("../data/campaignRepository");
const { logger, logEnter, logExit } = require('../config/logger');

async function getMostRecentCampaign() {
    try {
        const query = { order: [["year", "DESC"]] };
        const mostRecentCampaign = await campaignRepository.getOne(query);
        return mostRecentCampaign;
    } catch (e) {
        logger.error("Error retrieving the most recent campaign", e)
    }
}

module.exports = {
    getMostRecentCampaign
}