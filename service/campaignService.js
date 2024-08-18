const campaignRepository = require("../data/campaignRepository");
const commonRepository =  require("../data/commonRepository");
const { logger, logEnter, logExit } = require('../config/logger');

async function getMostRecentCampaign() {
    try {
        const query = { order: [["year", "DESC"]] };
        const mostRecentCampaign = await commonRepository.getOne("Campaign",query);
        return mostRecentCampaign;
    } catch (e) {
        logger.error("Error retrieving the most recent campaign", e)
    }
}

module.exports = {
    getMostRecentCampaign
}