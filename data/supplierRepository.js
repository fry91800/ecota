const db = require('../data/database.js');
const commonRepository = require("../data/commonRepository");
const campaignRepository = require("../data/campaignRepository");
const { Op } = require('sequelize');
const { logger, logEnter, logExit } = require('../config/logger');

async function getProdSuppliers(table) {
    const query = { where: { vendortype: { [Op.like]: 'M%' } } }
    return commonRepository.getAll(table, query)
}

async function getPerfoGroupByTeam() {
    const [results, metadata] = await db.sequelize.query(
        `SELECT "VendorCode", purchasingorganisationcode, SUM("Value(EUR)") AS "Value(EUR)"
        FROM td_perfo_synthesis
        GROUP BY "VendorCode", purchasingorganisationcode;`,
        {
            type: db.sequelize.QueryTypes.RAW
        }
    );
    for (const result of results) {
        result["Value(EUR)"] = Number(result["Value(EUR)"])
    }
    return results
}
async function syncSupplierSnapShot(suppliers) {
    try {
        // Step 1: Ajout des suppliers non-existants
        //await commonRepository.insertMany("YearlySupplierSnapShot", suppliers);
        for (const supplier of suppliers) {
            // Tentative d'ajout du supplier
            try {
                await commonRepository.insert("YearlySupplierSnapShot", supplier);
            }
            // Si erreur, la clé est possiblement déjà présente, tentative de changement de nom
            catch (e) {
                const update = { vendorname: supplier.vendorname }
                const where = { where: { year: supplier.year, vendorcode: supplier.vendorcode } }
                await commonRepository.update("YearlySupplierSnapShot", update, where)
            }

        }
    }
    catch (e) {
        console.log(e)
    }
}
async function syncTeamData(teamData) {
    try {
        await commonRepository.insertMany("YearlyTeamCotaData", teamData);
    } catch (error) {

    }
}
async function updatePerfoValues(year, perfo) {
    const update = { "Value(EUR)": perfo["Value(EUR)"] }
    const where = { where: { year: year, vendorcode: perfo["VendorCode"], purchasingorganisationcode: perfo["purchasingorganisationcode"] } }
    await commonRepository.update("YearlyTeamCotaData", update, where)
}
async function getCurrentCampaignTeamData() {
    const campaign = await campaignRepository.getMostRecentCampaign();
    const currentYear = campaign.year
    //const query = { where: { year: currentYear } };
    //return commonRepository.getAll("YearlyTeamCotaData", query);
    const [results, metadata] = await db.sequelize.query(
        `SELECT teamdata.*, teamdata.id AS teamdataid, snapshot.*
        FROM yearly_team_cota_data as teamdata
        LEFT JOIN yearly_supplier_snapshot as snapshot
        ON teamdata.vendorcode = snapshot.vendorcode
        WHERE teamdata.year = ${currentYear}
        AND snapshot.year = ${currentYear}`,
        {
            type: db.sequelize.QueryTypes.RAW
        }
    );
    return results
}
async function getCurrentCampaignTeamDataNoId() {
    const results = await getCurrentCampaignTeamData()
    results.forEach(obj => {
        delete obj.id;
    });
    return results
}

async function getPreviousCampaignResults() {
    const campaign = await campaignRepository.getMostRecentCampaign();
    const previousYear = campaign.year - 1
    const query = { where: { year: previousYear } };
    //return commonRepository.getAll("YearlyTeamCotaData", query);
    //Peut etre simplifié la jointure ne sert à rien
    try {
        const [results, metadata] = await db.sequelize.query(
            `SELECT teamdata.vendorcode, teamdata.purchasingorganisationcode, teamdata.intensity
        FROM yearly_team_cota_data as teamdata
        LEFT JOIN yearly_supplier_snapshot ON teamdata.vendorcode = yearly_supplier_snapshot.vendorcode
        WHERE teamdata.year = ${previousYear}`,
            {
                type: db.sequelize.QueryTypes.RAW
            }
        );
        return results
    }
    catch (e) {
        console.log(e)
    }
}

async function getSelectionTableData() {
    const campaign = await campaignRepository.getMostRecentCampaign();
    const currentYear = campaign.year
    //const query = { where: { year: currentYear } };
    //return commonRepository.getAll("YearlyTeamCotaData", query);
    const [results, metadata] = await db.sequelize.query(
        `SELECT teamdata.*, teamdata.id AS teamdataid, snapshot.*,
        intensity.text as lastsurveillancetext, team.shorttext as teamshorttext
        FROM yearly_team_cota_data as teamdata
        LEFT JOIN yearly_supplier_snapshot as snapshot
        ON teamdata.vendorcode = snapshot.vendorcode
        LEFT JOIN intensity
        ON teamdata.lastsurveillance = intensity.id
        LEFT JOIN team
        ON teamdata.purchasingorganisationcode = team.code        
        WHERE teamdata.year = ${currentYear}
        AND snapshot.year = ${currentYear}`,
        {
            type: db.sequelize.QueryTypes.RAW
        }
    );
    return results
}

async function getAllCotaTableData() {
    const campaign = await campaignRepository.getMostRecentCampaign();
    const currentYear = campaign.year
    //const query = { where: { year: currentYear } };
    //return commonRepository.getAll("YearlyTeamCotaData", query);
    const [results, metadata] = await db.sequelize.query(
        `SELECT teamdata.*, teamdata.id AS teamdataid, snapshot.*,
        intensity.text as lastsurveillancetext, team.shorttext as teamshorttext
        FROM yearly_team_cota_data as teamdata
        LEFT JOIN yearly_supplier_snapshot as snapshot
        ON teamdata.vendorcode = snapshot.vendorcode
        LEFT JOIN intensity
        ON teamdata.lastsurveillance = intensity.id
        LEFT JOIN team
        ON teamdata.purchasingorganisationcode = team.code        
        WHERE teamdata.year = ${currentYear}
        AND snapshot.year = ${currentYear}
        AND (teamdata.perfscope = TRUE OR teamdata.riskscope = TRUE)`,
        {
            type: db.sequelize.QueryTypes.RAW
        }
    );
    return results
}

async function getSupplierSnapShotByYear(year) {
    query = { where: { year: year } }
    return commonRepository.getAll("YearlySupplierSnapShot", query)
}

async function updateAllSelectionData(data) {
    for (supplier of data) {
        const update = {
            perfscope: supplier.perfscope,
            riskscope: supplier.riskscope,
            lastsurveillance: supplier.lastsurveillance,
            spendscope: supplier.spendscope,
            status: supplier.status,
            hasnewname: supplier.hasnewname
        }
        const where = { where: { year: supplier.year, vendorcode: supplier.vendorcode, purchasingorganisationcode: supplier.purchasingorganisationcode } }
        await commonRepository.update("YearlyTeamCotaData", update, where);
    }
}
async function updateOneSelectionData(row) {
    const update = {
        perfscope: row.perfscope,
        riskscope: row.riskscope,
        status: row.status,
    }
    logger.debug(`Supplier: ${row.vendorcode} Team: ${row.purchasingorganisationcode} update: ${JSON.stringify(update)}`);
    const where = { where: { year: row.year, vendorcode: row.vendorcode, purchasingorganisationcode: row.purchasingorganisationcode } }
    await commonRepository.update("YearlyTeamCotaData", update, where);
}
async function getOneTeamData(year, vendorcode, purchasingorganisationcode) {
    const where = { where: { year: year, vendorcode: vendorcode, purchasingorganisationcode: purchasingorganisationcode } };
    return commonRepository.getOne("YearlyTeamCotaData", where)
}

//TODO reunir les 2 fonctions
async function selectionCheck(year, vendorcode, purchasingorganisationcode, field, bool, comment, orgaid) {
    const updateData = { commenter: orgaid, comment: comment };
    updateData[field] = bool;
    const where = { where: { year: year, vendorcode: vendorcode, purchasingorganisationcode: purchasingorganisationcode } }
    await commonRepository.update("YearlyTeamCotaData", updateData, where)
}

async function answer(vendorcode, purchasingorganisationcode, questioncode, answer) {
    const campaign = await campaignRepository.getMostRecentCampaign();
    const currentYear = campaign.year
    // Step 1: Check if an answer already exists
    const query = { where: { year: currentYear, vendorcode, purchasingorganisationcode, questioncode } };
    const record = await commonRepository.getOne("Answer", query)
    // Step 2: If that's the case change it
    if (record) {
        const updateData = { answer };
        const where = { where: { year: currentYear, vendorcode, purchasingorganisationcode, questioncode } }
        await commonRepository.update("Answer", updateData, where)
    }
    // Step 3: if not create it
    else{
        await commonRepository.insertOne("Answer",{year: currentYear, vendorcode, purchasingorganisationcode, questioncode, answer})
    }
}
async function comment(vendorcode, purchasingorganisationcode, questioncode, comment) {
    const campaign = await campaignRepository.getMostRecentCampaign();
    const currentYear = campaign.year
    // Step 1: Check if an answer already exists
    const query = { where: { year: currentYear, vendorcode, purchasingorganisationcode, questioncode } };
    const record = await commonRepository.getOne("Answer", query)
    // Step 2: If that's the case change it
    if (record) {
        const updateData = { comment };
        const where = { where: { year: currentYear, vendorcode, purchasingorganisationcode, questioncode } }
        await commonRepository.update("Answer", updateData, where)
    }
    // Step 3: if not create it
    else{
        await commonRepository.insertOne("Answer",{year: currentYear, vendorcode, purchasingorganisationcode, questioncode, comment})
    }
}
async function getTeamAnswers(vendorcode, purchasingorganisationcode){
    const campaign = await campaignRepository.getMostRecentCampaign();
    const currentYear = campaign.year
    const query = { where: { year: currentYear,  vendorcode, purchasingorganisationcode} };
    return commonRepository.getAll("Answer", query)
}
async function getAllCurrentCampaignAnswers(){
    const campaign = await campaignRepository.getMostRecentCampaign();
    const currentYear = campaign.year
    const query = { where: { year: currentYear} };
    return commonRepository.getAll("Answer", query)
}
module.exports = {
    getProdSuppliers,
    getPerfoGroupByTeam,
    syncSupplierSnapShot,
    syncTeamData,
    updatePerfoValues,
    getCurrentCampaignTeamData,
    getCurrentCampaignTeamDataNoId,
    getSelectionTableData,
    getPreviousCampaignResults,
    getSupplierSnapShotByYear,
    updateAllSelectionData,
    updateOneSelectionData,
    getOneTeamData,
    selectionCheck,
    getAllCotaTableData,
    answer,
    comment,
    getTeamAnswers,
    getAllCurrentCampaignAnswers
    /*getRevenueData,
    getIntensitiesByYear,
    getSupplierIntensity,
    updateSelection,
    getHasReasonCheckedByYear,
    getSupplierForceByErpAndYear,
    getRecordByErpAndYear,
    getSelectedErpsByYear,
    select,
    deselect,
    checkReason,
    getAllMasterSupplier,
    addComment,
    forceSelect,
    getSelectionSupplierData,
    getSelectionSupplierIntensities,
    getCampaignSuppliers,
    insertSuppliers,
    removeSuppliers,
    updateName,
    getAllRevenueDataByTeam,
    getTeamFromErp,*/
}