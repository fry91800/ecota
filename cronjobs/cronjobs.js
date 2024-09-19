const { logger, logEnter, logExit } = require('../config/logger');
const campaignService = require("../service/campaignService");
async function startCampaign() {
    try {
        logger.info("Lancement automatique de la création d'une campagne pour l'année courante")
        // Step 1: Vérification de l'existence d'une campagne pour l'année courante
        const currentYear = new Date().getFullYear();
        const mostRecentCampaign = await campaignService.getMostRecentCampaign();
        // Step 2: Création de la campaggne si non existante
        if (mostRecentCampaign && mostRecentCampaign.year === currentYear) {
            logger.info("La campagne pour l'année courante existe déjà");
        }
        else{
            logger.info("Création de la campagne pour l'année courrante");
            await campaignService.startCampaign();
        }
        // Step 3: Synchronisation des supplier
        await syncSuppliers();
    }
    catch(e){
        console.error('Error in startCampaign:', e);
    }
}
async function syncSuppliers() {
    logger.info("Synchonisation des suppliers");
    await campaignService.syncSuppliers();

}

module.exports =
{
    startCampaign,
    syncSuppliers
}