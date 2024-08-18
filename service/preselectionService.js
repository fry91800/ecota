const CustomError = require('../error/CustomError.js');
const sessionRepository = require("../data/sessionRepository.js");
const db = require('../data/database.js');
const datastruct = require("../utility/datastruct.js");
const { Op } = require('sequelize');
const { logger, logEnter, logExit } = require('../config/logger');
const campaignRepository = require("../data/campaignRepository.js");
const intensityRepository = require("../data/intensityRepository.js");
const supplierRepository = require("../data/supplierRepository.js");
const teamRepository = require("../data/teamRepository.js");

/*
async function addCurrentCampaign() {
  try {
    // Step 1: Check si la campagne de l'année courante existe déjà
    const currentCampaign = await campaignRepository.getCurrentCampain(); // [*]
    // Step 2: Création de la campagne de l'année courrante si non existante
    if (!currentCampaign) {
      await campaignRepository.addCurrentCampaign();
    }
  }
  catch (e) {
    console.error("error trying to add the current campaign: ", e)
  }
}
*/
async function addPreselectionParams(revenue, intensity) {
  try {
    // Step 1: Obtention de la liste des id intensités possible
    const possibleIntensitiesRecords = await intensityRepository.getAll();
    const possibleIntensities = possibleIntensitiesRecords.map(row => row.id) //[1, 2, 3...]
    // Step 2: Check validité intensity
    if (!possibleIntensities.includes(intensity)) {
      CustomError.wrongParam();
    }
    // Step 3: Check validité revenue
    if (revenue < 0 || revenue > 100) {
      CustomError.wrongParam();
    }
    // Step 4: Obtention de la campagne la plus récente
    const query = { order: [["year", "DESC"]] };
    const mostRecentCampaign = await campaignRepository.getOne(query);
    // Step 5: Ajout dans la base de données
    const updateCampaign = {revenue: revenue, intensity: intensity};
    const where = {where: {year: mostRecentCampaign.year}};
    await campaignRepository.update(updateCampaign, where);
  }
  catch (e) {
    console.error('Error adding preselection params:', e)
  }
}
//Synchronise la table supplierSelection par rapport à la table maîtresse de suppliers
async function syncSuppliers() {
  try {
    const queryMaster = {attributes: ["erp", "name"]};
    const suppliers = await supplierRepository.getOneMaster(queryMaster); // [ {erp, name}, ... ]
    // Step 2: Selection des suppliers de la campagne courante
    const queryRecent = { order: [["year", "DESC"]] };
    const mostRecentCampaign = await campaignRepository.getOne(queryRecent);
    const campaignYear = mostRecentCampaign.year
    const querySuppliers = {attributes: ["erp", "name"], where:{year: campaignYear}};
    const currentCampaignSuppliers = await supplierRepository.getAllSupplierSelection(querySuppliers); // [ {erp, name} ... ]
    // Step 3: Transformation en dictionnaire pour un accès rapide
    const suppliersDic = datastruct.dictionarize(suppliers, "erp", ["name"]);
    const campaignDic = datastruct.dictionarize(currentCampaignSuppliers, "erp", ["name"])
    // Step 4: Obtention des listes des erps
    const suppliersErps = new Set(suppliers.map(({ erp }) => erp));
    const campaignErps = new Set(currentCampaignSuppliers.map(({ erp }) => erp));
    // Step 5: Ajout des suppliers manquants
    const suppliersToAdd = Array.from(suppliersErps).filter(erp => !campaignErps.has(erp));
    if (suppliersToAdd.length > 0) {
      const currentYear = new Date().getFullYear();
      const newSuppliers = suppliersToAdd.map(erp => ({
        year: currentYear,
        erp,
        name: suppliersDic[erp].name
      }));
      await supplierRepository.supplierSelectionBulkCreate(newSuppliers);
    }
    // Step 6: Suppression des suppliers en trop
    const suppliersToDelete = Array.from(campaignErps).filter(erp => !suppliersErps.has(erp));
    if (suppliersToDelete.length > 0) {
      await supplierRepository.supplierSelectionDestroy({ erp: suppliersToDelete, year: currentYear })
    }

    // Step 7: Synchronisation des noms
    for (const erp of campaignErps) {
      if (suppliersDic[erp] && campaignDic[erp].name !== suppliersDic[erp].name) {
        await supplierRepository.currentSupplierSelectionUpdateName(erp, suppliersDic[erp].name);
      }
    }
  }

  catch (e) {
    console.error('Error synchronizing suppliers:', e);
  }
}

async function getSelectedByRevenue() {
  try {
    // Step 1: Obtention du revenue % de la campagne actuelle
    const campaign = await campaignRepository.getCurrentCampain();
    const campaignRevenue = campaign.revenue;
    // Step 2: Obtention de la liste des teams
    const teamsCodes = await teamRepository.getCodes(); // [ "MB02", "MB03" ... ]
    // Step 3: Obtention des data relatives aux CA par divisions
    const suppliersRevenues = await supplierRepository.getRevenueData() // [ {erp, revenue, team } ... ]
    const selectedErps = [];
    // Step 4: Filtrage des erps
    teamsCodes.forEach(teamsCode => {
      // Step 4.1: Filtrage des données sur la team courrante
      const teamData = suppliersRevenues.filter(item => item.team === teamsCode);

      // Step 4.2 Calcul du revenue totale pour la team courrante
      const totalRevenue = teamData.reduce((acc, { revenue }) => acc + revenue, 0);

      // Step 4.3: Sort la data par revenue descendant
      const sortedTeamData = teamData.sort((a, b) => b.revenue - a.revenue);

      // Step 4.4 Récupération des erps jusqu'au dépassement du seuil (revenue %)
      let accumulatedRevenue = 0;
      for (const { erp, revenue } of sortedTeamData) {
        if (accumulatedRevenue / totalRevenue >= campaignRevenue / 100) break;
        selectedErps.push(erp);
        accumulatedRevenue += revenue;
      }
    });

    return selectedErps;
  }
  catch (e) {
    console.error('Error retrieving the selected erps (by revenue): ', e);
  }
}

async function getSelectedByIntensity() {
  try {
    // Step 1: Obtention de l'intensity de la campagne actuelle
    const campaign = await campaignRepository.getCurrentCampain(); // [ { "intensity", * } ]
    const campaignIntensity = campaign.intensity;
    // Step 2: Obtention des data relatives aux intensité des suppliers de l'année passée
    const suppliersIntensities = await supplierRepository.getLastYearIntensities(); // [ {erp, intensity}, ...]
    const selectedErps = [];
    // Step 3 Selection des Erps avec aux moins le niveau d'intensité année-1 requis
    for (const { erp, intensity } of suppliersIntensities) {
      if (intensity >= campaignIntensity) {
        selectedErps.push(erp);
      }
    }
    return selectedErps;
  }
  catch (e) {
    console.error('Error retrieving the selected erps (by intensity): ', e);
  }
}

async function getSelectedByReason() {
  try {
    return supplierRepository.getErpWithReason(); // ["erp1", "erp2", ...]
  }
  catch (e) {
    console.error("Error getting erps with reasons selected: ", e)
  }
}
async function autoCheck() {
  try {
    // Step 1: Obtention de la liste des erps devant être sélectionnés
    const selectedByRevenue = await getSelectedByRevenue();
    const selectedByIntensity = await getSelectedByIntensity();
    const selectedByReasons = await getSelectedByReason();
    const should = [...new Set([...selectedByRevenue, ...selectedByIntensity, ...selectedByReasons])]; // ["erp1","erp2", ...]
    // Step 2: Obtention de la liste des erps sélectionnés cette année
    const current = await supplierRepository.getCurrentYearSelectedErps() // ["erp1","erp2", ...]
    // Step 3: Selection des manquants
    const erpsToSelect = should.filter(erp => !current.includes(erp));
    if (erpsToSelect.length > 0) {
      await supplierRepository.selectFromErps(erpsToSelect);
    }
    // Step 4: Désélection des suppliers en trop
    const erpsToDeselect = current.filter(erp => !should.includes(erp));
    if (erpsToDeselect.length > 0) {
      await supplierRepository.deselectFromErps(erpsToDeselect);
    }
  }
  catch (e) {
    console.error("Error updating selected field: ", e)
  }
}
async function preselect(revenuePercentage, intensity) {
  try {
    logEnter();
    //logger.debug("Adding the campaign of "+ new Date().getFullYear());
    //await addCurrentCampaign();
    logger.debug("Adding the preselection params");
    await addPreselectionParams(revenuePercentage, intensity)
    logger.debug("Sync suppliers");
    await syncSuppliers();
    logger.debug("AutoCheck suppliers");
    await autoCheck();
    logExit();
  }
  catch (e) {
    console.error(e);
  }
}

module.exports = {
  preselect
}