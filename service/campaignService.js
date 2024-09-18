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
    const newCotaData = [];
    // Step 2; Sépare chaque supplier en 3 lignes, une pour chaque division et ajout de la source et de l'année de la campagne
    const purchasingOrganisationCodes = [1, 2, 3];
    const erpSources = [
        { data: sap, source: "SAP" },
        { data: syt, source: "SUZHOU" },
        { data: stl, source: "QUERETARO" }
    ];

    for (const erp of erpSources) {
        for (const supplier of erp.data) {
            supplier["source"] = erp.source;
            supplier["year"] = currentCampaignYear;

            purchasingOrganisationCodes.forEach((code) => {
                const supplierCopy = { ...supplier, purchasingorganisationcode: code };
                newCotaData.push(supplierCopy);
            });
        }
    }
    return newCotaData

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
async function syncSuppliers() {
    // Step 1: Obtention des data à jour
    const suppliers = await getMasterSuppliers();
    // Step 2: Ajout de l'année et la source de la données
    await addYearAndSource(suppliers)
    //Step 3: Concaténation des 3 table en 1
    const allSuppliers = [...suppliers.sap, ...suppliers.syt, ...suppliers.stl];
    const split = splitWithTeams(allSuppliers)
    console.log(split);
    return
    const sap = [];
    const stl = [];
    const syt = [];
    // Step 2: Transformation en map
    const sapMap = datastruct.dictionarize(sap, "vendorcode");
    const stlMap = datastruct.dictionarize(stl, "vendorcode");
    const sytMap = datastruct.dictionarize(syt, "vendorcode");
    const cotaMap = new Map();
    // Step 3: A
}

module.exports = {
    getMostRecentCampaign,
    startCampaign,
    syncSuppliers
}