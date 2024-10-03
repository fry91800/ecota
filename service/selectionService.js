
const supplierRepository = require("../data/supplierRepository.js");
const campaignRepository = require("../data/campaignRepository.js");
const datastruct = require("../utils/datastruct.js");
const { logger, logEnter, logExit } = require('../config/logger');
const CustomError = require('../error/CustomError.js');
const sessionRepository = require("../data/sessionRepository.js");
const db = require('../data/database.js');
const { Op } = require('sequelize');

async function getSelectionData() {
    return supplierRepository.getSelectionTableData();
    return [
        {
            vendorcode: "1234",
            name: "Aerostar",
            city: "Paris",
            country: "FR",
            mdm: "MDM1234",
            team: "WB",
            perfScope: true,
            riskScope: false,
            spend: 100000,
            lastIntensity: "Tightened",
            reason1: true,
            reason2: false,
            reason3: false,
            reason4: false,
            comment: "good",
        }
    ];
}

async function updateAllSelectionData() {
    try {
        logger.info("Mise à jour des données de selection des teams pour les cotations...")
        // Step 1: Obtention des données brutes
        let data = await supplierRepository.getCurrentCampaignTeamDataNoId();
        // Step 2: Ajout de de l'INT previousIntensity
        data = await addPreviousSurveillance(data);
        // Step 3: Ajout du boolean spendscope (Appartien au % requis de spend)
        data = await computeSpendScope(data);
        // Step 4: Ajout des boolean perfscope et riskscope
        addScopes(data);
        // Step 5: Ajout de la variable de detection de nouveau nom
        await addHasNewName(data);
        // Step 6: Ajout du status, new ou out
        data = await updateStatus(data);

        // Step 7: Enregistrement de la données dans la base
        await supplierRepository.updateAllSelectionData(data);
        logger.info("\x1b[32mMise à jour réussie\x1b[0m");
    }
    catch (e) {
        console.log(e)
    }
}

async function updateOneSelectionData(row)
{
    data = [row]
    addScopes(data);
    data = await updateStatus(data);
    await supplierRepository.updateOneSelectionData(data[0]);
}

async function selectionCheck(year, erp, team, reason, bool, comment, orgaid) {
    // Step 1: Check the reason
    await supplierRepository.selectionCheck(year, erp, team, reason, bool, comment, orgaid)
    // Step 2: Update selection data for the supplier
    const row = await supplierRepository.getOneTeamData(year, erp, team)
    await updateOneSelectionData(row)
}


async function addPreviousSurveillance(suppliers) {
    const previousResults = await supplierRepository.getPreviousCampaignResults();

    // Create a map for quicker lookup of previous intensities based on suppliercode and team
    const previousIntensityMap = new Map();

    previousResults.forEach(item => {
        const key = `${item.vendorcode}-${item.purchasingorganisationcode}`;
        previousIntensityMap.set(key, item.intensity);
    });

    const updatedSuppliers = suppliers.map(item => {
        const key = `${item.vendorcode}-${item.purchasingorganisationcode}`;
        return {
            ...item,
            lastsurveillance: previousIntensityMap.get(key) || null // If no match, set it to null
        };
    });

    return updatedSuppliers;
}

async function computeSpendScope(raw) {
    // Step 1: Obtention du revenue % de la campagne actuelle
    const campaign = await campaignRepository.getMostRecentCampaign();
    const campaignRevenue = campaign.revenue;
    const teamsCodes = ["MB02", "MB03", "GOPE"];
    const data = raw.map(item => {
        return {
            ...item,
            spendscope: false,
            spend: item["Value(EUR)"]
        };
    });
    const result = []

    teamsCodes.forEach(teamsCode => {
        // Step 4.1: Filtrage des données sur la team courrante
        const teamData = data.filter(item => item.purchasingorganisationcode === teamsCode);

        // Step 4.2 Calcul du revenue totale pour la team courrante
        const totalSpend = teamData.reduce((acc, { spend }) => acc + spend, 0);

        // Step 4.3: Sort la data par revenue descendant
        const sortedTeamData = teamData.sort((a, b) => b.spend - a.spend);

        // Step 4.4 Récupération des erps jusqu'au dépassement du seuil (revenue %)
        let accumulatedSpend = 0;
        for (const obj of sortedTeamData) {
            if (accumulatedSpend / totalSpend >= campaignRevenue / 100) {
                result.push(obj);
                break;
            }
            //selectedErps.push(erp);
            //.log("vendorcode: " + obj.vendorcode + ", purchasingorganisationcode: " + obj.purchasingorganisationcode)
            obj.spendscope = true
            accumulatedSpend += obj.spend;
            result.push(obj);
        }
    });
    return result;

}


function addScopes(data) {
    for (const obj of data) {
        if (isForcedPerf(obj)) {
            obj.perfscope = obj.forceperfcota
        }
        else if (obj.spendscope === true || hasReason(obj) || obj.lastsurveillance >= 2) {
            obj.perfscope = true
        }
        else {
            obj.perfscope = false
        }

        if (isForcedRisk(obj)) {
            obj.riskscope = obj.forceriskcota
        }
        //TODO last audit more than 3 years to do
        else if (obj.lastsurveillance >= 3) {
            obj.riskscope = true
        }
        else {
            obj.riskscope = false
        }
    }
}

function isForcedPerf(obj) {
    return obj.forceperfcota === true || obj.forceperfcota === false;
}
function isForcedRisk(obj) {
    return obj.forceriskcota === true || obj.forceriskcota === false;
}

function hasReason(obj) {
    return obj.reason1 === true || obj.reason2 === true || obj.reason3 === true || obj.reason4 === true
}

async function addHasNewName(data) {
    const campaign = await campaignRepository.getMostRecentCampaign();
    const previousYear = campaign.year - 1;
    // Step 1: Retrouve le snapshot de l'année passée
    const snapShot = await supplierRepository.getSupplierSnapShotByYear(previousYear);
    const snapMap = datastruct.dictionarize(snapShot, "vendorcode")
    data.forEach(item => {
        item.hasnewname = false
        oldRecord = snapMap[item.vendorcode]
        if (oldRecord && oldRecord.vendorname !== item.vendorname) {
            item.hasnewname = true
        }
    });
}

function getStatus(currentPerfScope, PreviousPerfScope)
{
    if (currentPerfScope === true && (!PreviousPerfScope || PreviousPerfScope === false))
    {
        return "new"
    }
    else if (currentPerfScope === false && (PreviousPerfScope === true))
    {
        return "out"
    }
    return null
}
async function updateStatus(suppliers){
    const previousResults = await supplierRepository.getPreviousCampaignResults();

    // Create a map for quicker lookup of previous intensities based on suppliercode and team
    const previousPerfScopeMap = new Map();

    previousResults.forEach(item => {
        const key = `${item.vendorcode}-${item.purchasingorganisationcode}`;
        previousPerfScopeMap.set(key, item.perfscope);
    });

    const updatedSuppliers = suppliers.map(item => {
        const key = `${item.vendorcode}-${item.purchasingorganisationcode}`;
        const status = getStatus(item.perfscope, previousPerfScopeMap.get(key))
        return {
            ...item,
            status: status // If no match, set it to null
        };
    });

    return updatedSuppliers;
}


module.exports = {
    getSelectionData,
    updateAllSelectionData,
    updateOneSelectionData,
    selectionCheck,
}
/*
async function shouldSelectErpByRevenue(erp) {
    // Step 1: Obtention du revenue % de la campagne actuelle
    const campaign = await campaignRepository.getMostRecentCampaign();
    const campaignRevenue = campaign.revenue;
    // Step 2: Obtention de la team sur laquelle se pencher
    const teamCode = await supplierRepository.getTeamFromErp(erp);
    // Step 3: Obtention des data relatives aux CA par divisions
    const teamData = await supplierRepository.getAllRevenueDataByTeam(teamCode);

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
}

async function shouldSelectErpByIntensity(erp) {
    // Step 1: Obtention de l'intensity de la campagne actuelle
    const campaign = await campaignRepository.getMostRecentCampaign();
    const campaignIntensity = campaign.intensity;
    console.log("Intensity requise: " + campaignIntensity)
    // Step 2: Obtention de l'intensité du supplier pour l'année passée
    const lastYear = campaign.year - 1;
    const supplierIntensity = await supplierRepository.getSupplierIntensity(erp, lastYear);
    if (!supplierIntensity) {
        return false
    }
    // Step 3 Selection des Erps avec aux moins le niveau d'intensité année-1 requis
    if (supplierIntensity >= campaignIntensity) {
        return true
    }
    return false;
}
async function shouldSelectErpByReason(erp) {
    const campaign = await campaignRepository.getMostRecentCampaign();
    const currentYear = campaign.year;
    const record = await supplierRepository.getRecordByErpAndYear(erp, currentYear);
    if (Object.values(record).includes(true)) {
        return true;
    }
    return false
}
async function updateSelectionStatus(erp) {
    // Get the current Campaign year
    const campaign = await campaignRepository.getMostRecentCampaign();
    const currentYear = campaign.year;
    const shouldRevenue = await shouldSelectErpByRevenue(erp);
    const shouldIntensity = await shouldSelectErpByIntensity(erp);
    const shouldReason = await shouldSelectErpByReason(erp);
    const supplierForce = await supplierRepository.getSupplierForceByErpAndYear(erp, currentYear);
    if (shouldRevenue || shouldIntensity || shouldReason) {
        // Update
        await supplierRepository.updateSelection(true, erp, currentYear);
        var selected = supplierForce ? supplierForce : true;
        return { selected: selected }
    }
    else {
        // Update
        await supplierRepository.updateSelection(false, erp, currentYear);
        var selected = supplierForce ? supplierForce : false;
        return { selected: false }
    }
}
async function checkReason(bool, orgaid, erp, reason, comment) {
    const campaign = await campaignRepository.getMostRecentCampaign();
    const currentYear = campaign.year;
    await supplierRepository.checkReason(bool, orgaid, erp, reason, comment, currentYear);
    return updateSelectionStatus(erp);
}

/*async function uncheckReason(orgaid, erp, reason, comment) {
    const campaign = await campaignRepository.getMostRecentCampaign();
    const currentYear = campaign.year;
    await supplierRepository.checkReason(bool, orgaid, erp, reason, comment, currentYear);
    return updateSelectionStatus(erp);
}*/

/*
async function getSelectionData(userTeam) {
    const campaign = await campaignRepository.getMostRecentCampaign();
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
    */