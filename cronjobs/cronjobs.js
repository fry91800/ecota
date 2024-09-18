const { logger, logEnter, logExit } = require('../config/logger');
const campaignService = require("../service/campaignService");
async function startCampaign() {
    try {
        logger.info("Lancement automatique de la création d'une campagne pour l'année courante")
        // Step 1: Vérification de l'existence d'une campagne pour l'année courante
        const currentYear = new Date().getFullYear();
        const mostRecentCampaign = await campaignService.getMostRecentCampaign();
        if (mostRecentCampaign && mostRecentCampaign.year === currentYear) {
            logger.info("La campagne pour l'année courante existe déjà");
            await campaignService.syncSuppliers();
            return
        }
        // Step 2: Création de la campaggne
        logger.info("Création de la campagne pour l'année courrante");
        await campaignService.startCampaign();
        // Step 3: Synchronisation des supplier
        await campaignService.syncSuppliers();
    }
    catch(e){
        console.error('Error in startCampaign:', e);
    }
}

module.exports =
{
    startCampaign
}