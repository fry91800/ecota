
const supplierRepository = require("../data/supplierRepository.js");
const campaignRepository = require("../data/campaignRepository.js");
const datastruct = require("../utils/datastruct.js");
const { logger, logEnter, logExit } = require('../config/logger');

async function getSelectionData() {

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
    await supplierRepository.updateOneSelectionData(data);
}

module.exports = {
    getSelectionData,
    updateAllSelectionData,
    updateOneSelectionData,
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
    return obj.forceperfcota === true;
}
function isForcedRisk(obj) {
    return obj.forceriskcota === true;
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