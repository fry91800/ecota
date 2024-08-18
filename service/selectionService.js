const CustomError = require('../error/CustomError.js');
const sessionRepository = require("../data/sessionRepository.js");
const db = require('../data/database.js');
const datastruct = require("../utility/datastruct.js");
const { Op } = require('sequelize');
const campaignRepository = require("../data/campaignRepository.js");
const intensityRepository = require("../data/intensityRepository.js");
const supplierRepository = require("../data/supplierRepository.js");
const commonRepository = require("../data/commonRepository.js");
async function shouldSelectErpByRevenue(erp) {
    try {
        // Step 1: Obtention du revenue % de la campagne actuelle
        const query = { order: [["year", "DESC"]] };
        const campaign = await commonRepository.getOne("Campaign", query);
        const campaignRevenue = campaign.revenue;
        // Step 2: Obtention de la team sur laquelle se pencher
        const queryTeam = { attributes: ["team"], where: { erp: erp } }
        const team = await commonRepository.getOne("Supplier1", queryTeam);
        const teamCode = team.team;
        // Step 3: Obtention des data relatives aux CA par divisions
        const queryTeamData = {
            attributes: ["erp", "revenue"],
            where: { team: teamCode },
            order: [['revenue', 'DESC']]
        }
        const teamData = await commonRepository.getAll("Supplier1", queryTeamData);

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
        const query = { order: [["year", "DESC"]] };
        const campaign = await commonRepository.getOne("Campaign", query);
        const campaignIntensity = campaign.intensity;
        // Step 2: Obtention de l'intensité du supplier pour l'année passée
        const lastYear = campaign.year - 1;
        const queryIntensity = {
            attributes: ["erp", "intensity"],
            where: { erp: erp, year: lastYear }
        };
        const supplierIntensity = await commonRepository.getOne("SupplierCotaData", queryIntensity);
        if (!supplierIntensity) {
            return false
        }
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

    const queryRecentCampaign = { order: [["year", "DESC"]] };
    const campaign = await commonRepository.getOne("Campaign", queryRecentCampaign);
    const currentYear = campaign.year;
    const query = {
        attributes: ["reason1", "reason2", "reason3", "reason4", "reason5"],
        where: { erp: erp, year: currentYear }
    }
    const record = await commonRepository.getOne("SupplierSelection", query);
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
        const query = {
            attributes: ["force"],
            where: {erp: erp}
        }
        const supplierForce = await commonRepository.getOne("SupplierSelection", query);
        if (shouldRevenue || shouldIntensity || shouldReason) {
            // Get the current Campaign year
            const queryRecentCampaign = { order: [["year", "DESC"]] };
            const campaign = await commonRepository.getOne("Campaign", queryRecentCampaign);
            const currentYear = campaign.year;
            // Update
            const updateSelect = {selected: true};
            const whereSelect = {where: { erp: erp, year: currentYear }};
            await commonRepository.update("SupplierSelection", updateSelect, whereSelect);
            var selected = supplierForce.force ? supplierForce.force : true;
            return { selected: selected }
        }
        else {
            // Get the current Campaign year
            const queryRecentCampaign = { order: [["year", "DESC"]] };
            const campaign = await commonRepository.getOne("Campaign", queryRecentCampaign);
            const currentYear = campaign.year;
            // Update
            const updateDeselect = {selected: false};
            const whereDeselect = {where: { erp: erp, year: currentYear }};
            await commonRepository.update("SupplierSelection", updateDeselect, whereDeselect);
            var selected = supplierForce.force ? supplierForce.force : false;
            return { selected: false }
        }
    } catch (e) {
        console.error('Could not update selection status: ', e);
    }
}
async function checkReason(orgaid, erp, reason, comment) {
    try {
        await supplierRepository.checkReason(orgaid, erp, reason, comment);
        return updateSelectionStatus(erp);
    }
    catch (e) {
        console.error('Could not select a reason: ', e);
    }
}

async function uncheckReason(orgaid, erp, reason, comment) {
    try {
        await supplierRepository.uncheckReason(orgaid, erp, reason, comment);
        return updateSelectionStatus(erp);
    }
    catch (e) {
        console.error('Could not deselect a reason: ', e);
    }
}

async function getSelectionData(userTeam) {
    const queryRecentCampaign = { order: [["year", "DESC"]] };
    const campaign = await commonRepository.getOne("Campaign", queryRecentCampaign);
    const currentCampaignYear = campaign.year;
    const response = await supplierRepository.getSelectionSupplierData(currentCampaignYear, userTeam);
    // Update les intensity null à 0
    response.forEach(obj => {
        if (obj.intensity === null) {
            obj.intensity = "";
        }
        if (obj.intensityCode === null) {
            obj.intensityCode = 0;
        }
        if (obj.force !== null) {
            obj.selected = obj.force;
        }
    });
    const lastYearIntensities = await supplierRepository.getSelectionSupplierIntensities();

    const mergedData = response.flatMap(resp => {
        // Find the matching intensities for the current ERP
        const matchingIntensities = lastYearIntensities.filter(intensity => intensity.erp === resp.erp);

        if (matchingIntensities.length > 0) {
            // Return all matching intensities
            return matchingIntensities.map(intensity => ({
                ...resp, // Spread all fields from the response object
                intensityCode: intensity.intensityCode,
                intensity: intensity.intensity
            }));
        } else {
            // If no matching intensities, return the response object with null or default values for intensity fields
            return [{
                ...resp,
                intensityCode: 0,
                intensity: ""
            }];
        }
    });
    return mergedData;
}

module.exports = {
    checkReason,
    uncheckReason,
    getSelectionData
}