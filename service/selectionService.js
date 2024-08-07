const CustomError = require('../error/CustomError.js');
const sessionRepository = require("../data/sessionRepository.js");
const db = require('../data/database.js');
const datastruct = require("../utility/datastruct.js");
const { Op } = require('sequelize');
const campaignRepository = require("../data/campaignRepository.js");
const intensityRepository = require("../data/intensityRepository.js");
const supplierRepository = require("../data/supplierRepository.js");
const teamRepository = require("../data/teamRepository.js");
async function shouldSelectErpByRevenue(erp) {
    try {
        // Step 1: Obtention du revenue % de la campagne actuelle
        const campaign = await campaignRepository.getCurrentCampain();
        const campaignRevenue = campaign.revenue;
        // Step 1.5: Obtention de la team sur laquelle se pencher
        const teamCode = await supplierRepository.getTeamFromErp(erp);
        console.log(teamCode);
        // Step 2: Obtention des data relatives aux CA par divisions
        //const suppliersRevenues = await supplierRepository.getRevenueData(); // [ {erp, revenue, team } ... ]
        const teamData = await supplierRepository.getRevenueDataByTeam(teamCode); // [ {erp, revenue } ... ]
        // Step 3: Filtrage des données sur la team courrante
        //const teamData = suppliersRevenues.filter(item => item.team === teamCode);

        // Step 4: Calcul du revenue totale pour la team courrante
        const totalRevenue = teamData.reduce((acc, { revenue }) => acc + revenue, 0);

        // Step 5: Sort la data par revenue descendant
        const sortedTeamData = teamData.sort((a, b) => b.revenue - a.revenue);

        // Step 6: Vérification si l'erp devrait être sélectionné
        let accumulatedRevenue = 0;
        for (const { erp: currentErp, revenue } of sortedTeamData) {
            if (accumulatedRevenue / totalRevenue >= campaignRevenue / 100) break;
            if (currentErp === erp) {
                return true;
            }
            accumulatedRevenue += revenue;
        }

        return false;
    } catch (e) {
        console.error('Error determining if the ERP should be selected by revenue: ', e);
        return false;
    }
}

async function shouldSelectErpByIntensity(erp) {
    try {
        // Step 1: Obtention de l'intensity de la campagne actuelle
        const campaign = await campaignRepository.getCurrentCampain(); // [ { "intensity", * } ]
        const campaignIntensity = campaign.intensity;
        // Step 2: Obtention de l'intensité du supplier pour l'année passée
        const supplierIntensity = await supplierRepository.getLastYearIntensityByErp(erp);
        console.log(supplierIntensity)
        if (!supplierIntensity) {
            return false }
        console.log(supplierIntensity)
        // Step 3 Selection des Erps avec aux moins le niveau d'intensité année-1 requis
        if (supplierIntensity >= campaignIntensity) {
            return true
        }
        return false;
    }
    catch (e) {
        console.error('Error determining if the ERP should be selected by intensity: ', e);
        return false;
    }
}
async function shouldSelectErpByReason(erp) {
    const record = await supplierRepository.getSupplierSelectionDataByErp(erp, ["reason1", "reason2", "reason3", "reason4", "reason5"]);
    if (Object.values(record).includes(true)) {
        return true;
    }
    return false
}
async function updateSelectionStatus(erp) {
    try {
        const shouldRevenue = await shouldSelectErpByRevenue(erp);
        const shouldIntensity = await shouldSelectErpByIntensity(erp);
        const shouldReason = await shouldSelectErpByReason(erp);
        console.log("shouldRevenue: ", shouldRevenue);
        console.log("shouldIntensity: ", shouldIntensity);
        console.log("shouldReason: ", shouldReason);
        if (shouldRevenue || shouldIntensity || shouldReason) {
            await supplierRepository.select(erp);
        }
        else {
            await supplierRepository.deselect(erp);
        }
    } catch (e) {
        console.error('Could not update selection status: ', e);
    }
}
async function checkReason(erp, reason) {
    try {
        await supplierRepository.checkReason(erp, reason);
        await updateSelectionStatus(erp);
    }
    catch (e) {
        console.error('Could not select a reason: ', e);
    }
}

async function uncheckReason(erp, reason) {
    try {
        await supplierRepository.uncheckReason(erp, reason);
        await updateSelectionStatus(erp);
    }
    catch (e) {
        console.error('Could not deselect a reason: ', e);
    }
}

module.exports = {
    checkReason,
    uncheckReason
}