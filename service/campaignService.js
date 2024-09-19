const campaignRepository = require("../data/campaignRepository");
const supplierRepository = require("../data/supplierRepository");
const datastruct = require("../utils/datastruct.js");
const { logger, logEnter, logExit } = require('../config/logger');

async function startCampaign() {
    return campaignRepository.startCampaign();
}

async function getMostRecentCampaign() {

    return campaignRepository.getMostRecentCampaign();
}

async function getMasterSuppliers() {
    // Step 1: Obtention des données suppliers
    const [sap, stl, syt] = await Promise.all([
        supplierRepository.getProdSuppliers("VendorSap"),
        supplierRepository.getProdSuppliers("VendorStl"),
        supplierRepository.getProdSuppliers("VendorSyt")
    ]);
    return { sap, stl, syt }
}

async function getSupplierDataSnapShot()
{
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
async function updatePerfoValues(){
    const mostRecentCampaign = await getMostRecentCampaign();
    const currentCampaignYear = mostRecentCampaign.year;
    const perfo = await supplierRepository.getPerfoGroupByTeam();
    for (const elt of perfo) {
        await supplierRepository.updatePerfoValues(currentCampaignYear, elt);
    }
}
async function syncSuppliers() {
    // Step 1: Obtention des data à jour en format snapshot
    const supplierSnapShot = await getSupplierDataSnapShot();
    // Step 2: Split en 3 pour chaque division
    const teamData = splitWithTeams(supplierSnapShot);
    // Step 3: Ajout des données dans la base (Ajout simple, la plupart ne devrait pas être ajouté car unicité des champs)
    await Promise.all([
        supplierRepository.addSupplierSnapShot(supplierSnapShot),
        supplierRepository.addTeamData(teamData)
    ]);
    // Step 4: Ajout de la data de perfo (Value etc)
    await updatePerfoValues();
}

async function updateRevenue(revenue, intensity) {
    // Step 1: Check validité revenue
    if (revenue < 0 || revenue > 100) {
      CustomError.wrongParam();
    }
    // Step 2: Obtention de la campagne la plus récente
    const mostRecentCampaign = await campaignRepository.getMostRecentCampaign();
    // Step 3: Ajout dans la base de données
    const campaignYear = mostRecentCampaign.year
    await campaignRepository.updateRevenue(campaignYear, revenue)
  }

module.exports = {
    getMostRecentCampaign,
    startCampaign,
    syncSuppliers,
    updateRevenue
}