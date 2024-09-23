const campaignRepository = require("../data/campaignRepository");
const supplierRepository = require("../data/supplierRepository");
const datastruct = require("../utils/datastruct.js");
const { logger, logEnter, logExit } = require('../config/logger');

async function getMostRecentCampaign() {

    return campaignRepository.getMostRecentCampaign();
}

async function startCampaign() {
        logger.info("Création d'une campagne...");
        // Step 1: Vérification de l'existence d'une campagne pour l'année courante
        const currentYear = new Date().getFullYear();
        const mostRecentCampaign = await campaignService.getMostRecentCampaign();
        // Step 2: Création de la campagne si non existante
        if (mostRecentCampaign && mostRecentCampaign.year === currentYear) {
            logger.info("\x1b[32mCampagne déjà existante\x1b[0m");
        }
        else {
            await campaignRepository.startCampaign();
            logger.info("\x1b[32mCampagne créée\x1b[0m");
        }
        // Step 3: Synchronisation des supplier
        await syncSuppliers();
}
async function syncSuppliers() {
        logger.info("Synchronisation des suppliers...");
        // Step 1: Obtention des data à jour en format snapshot
        const supplierSnapShot = await getSupplierDataSnapShot();
        // Step 2: Split en 3 pour chaque division
        const teamData = splitWithTeams(supplierSnapShot);
        // Step 3: Ajout des données dans la base (Ajout simple, la plupart ne devrait pas être ajouté car unicité des champs)
        await Promise.all([
            supplierRepository.syncSupplierSnapShot(supplierSnapShot),
            supplierRepository.syncTeamData(teamData)
        ]);
        // Step 4: Ajout de la data de perfo (Value etc)
        await updatePerfoValues();
        logger.info("\x1b[32mSynchonisation réussie\x1b[0m");
}
/*
async function startCampaign() {
    return campaignRepository.startCampaign();
}*/

async function getMasterSuppliers() {
    // Step 1: Obtention des données suppliers
    const [sap, stl, syt] = await Promise.all([
        supplierRepository.getProdSuppliers("VendorSap"),
        supplierRepository.getProdSuppliers("VendorStl"),
        supplierRepository.getProdSuppliers("VendorSyt")
    ]);
    return { sap, stl, syt }
}

async function getSupplierDataSnapShot() {
    // Step 1: Obtention des data à jour
    const suppliers = await getMasterSuppliers();
    // Step 2: Ajout de l'année et la source de la données
    await addYearAndSource(suppliers)
    // Step 3: Concaténation des 3 table en 1
    const supplierSnapShot = [...suppliers.sap, ...suppliers.syt, ...suppliers.stl];
    return supplierSnapShot
}
async function addYearAndSource(suppliers) {
    const mostRecentCampaign = await getMostRecentCampaign();
    const currentCampaignYear = mostRecentCampaign.year;
    const erpSources = [
        { data: suppliers.sap, source: "SAP" },
        { data: suppliers.syt, source: "SUZHOU" },
        { data: suppliers.stl, source: "QUERETARO" }
    ];
    for (const erp of erpSources) {
        for (const supplier of erp.data) {
            supplier["source"] = erp.source;
            supplier["year"] = currentCampaignYear;
        }
    }
}
function splitWithTeams(suppliers) {
    const result = [];
    const purchasingOrganisationCodes = ["MB02", "MB03", "GOPE"];
    for (const supplier of suppliers) {
        purchasingOrganisationCodes.forEach((code) => {
            const supplierCopy = { ...supplier, purchasingorganisationcode: code };
            result.push(supplierCopy);
        });
    }
    return result
}
async function updatePerfoValues() {
    const mostRecentCampaign = await getMostRecentCampaign();
    const currentCampaignYear = mostRecentCampaign.year;
    const perfo = await supplierRepository.getPerfoGroupByTeam();
    for (const elt of perfo) {
        await supplierRepository.updatePerfoValues(currentCampaignYear, elt);
    }
}


async function updateRevenue(revenue) {
    // Step 1: Check validité revenue
    if (revenue < 0 || revenue > 100) {
        CustomError.wrongParam();
    }
    // Step 2: Obtention de l'années de la campagne courante
    const mostRecentCampaign = await campaignRepository.getMostRecentCampaign();
    const campaignYear = mostRecentCampaign.year
    // Step 3: Ajout dans la base de données
    await campaignRepository.updateRevenue(campaignYear, revenue)
}

module.exports = {
    getMostRecentCampaign,
    startCampaign,
    syncSuppliers,
    updateRevenue
}