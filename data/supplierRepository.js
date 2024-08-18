const db = require('../data/database.js');
const { Op } = require('sequelize');
const { logger, logEnter, logExit } = require('../config/logger');

async function checkReason(orgaid, erp, reason, comment) {
    try {
        const currentYear = new Date().getFullYear();
        const updateData = { commenter: orgaid, comment: comment };
        updateData[reason] = true;
        await db.SupplierSelection.update(
            updateData,
            {
                where: { erp: erp, year: currentYear }
            }
        )
    }
    catch (e) {
        console.error("Could not select supplier", e);
    }
}
async function uncheckReason(orgaid, erp, reason, comment) {
    try {
        const currentYear = new Date().getFullYear();
        const updateData = { commenter: orgaid, comment: comment };
        updateData[reason] = false;
        await db.SupplierSelection.update(
            updateData,
            {
                where: { erp: erp, year: currentYear }
            }
        )
    }
    catch (e) {
        console.error("Could not select supplier", e);
    }
}

async function addComment(orgaid, year, erp, comment) {
    try {
        await db.SupplierSelection.update(
            { comment: comment, commenter: orgaid },
            { where: { erp: erp, year: year } }
        );
        return { status: 200 };
    } catch (e) {
        logger.error("Could not add Comment to the database: "+e)
    }
}
async function forceSelect(orgaid, bool, erp, comment) {
    try {
        await db.SupplierSelection.update(
            { force: bool, comment: comment, commenter: orgaid },
            { where: { erp: erp } }
        );
        return { status: 200 };
    } catch (e) {
        logger.error("Could not force selection to the database: "+e)
    }
}

async function getSelectionSupplierData(currentCampaignYear, userTeam) {
    try {
        let whereString = `WHERE supplierselection.year = '${currentCampaignYear}'`;
        if (userTeam) {
            whereString = whereString + ` AND supplier1.team = '${userTeam}'`;
        }
        const [results, metadata] = await db.sequelize.query(
            `SELECT supplierselection.force as force, supplierselection.selected as selected, supplierselection.erp as erp,
            supplierselection.name as supplier, supplier1.revenue as revenue, supplierselection.reason1 as reason1,
            supplierselection.reason2 as reason2, supplierselection.reason3 as reason3, supplierselection.reason4 as reason4,
            supplierselection.comment as comment
            FROM supplierselection
            LEFT JOIN supplier1 on supplierselection.erp = supplier1.erp
            ${whereString}`,
            {
                type: db.sequelize.QueryTypes.RAW
            }
        );
        return results
    } catch (e) {
        logger.error("Could not get supplier data for selection: "+e)
    }
}
async function getSupplierSelection(query)
{
    query["raw"] = true;
    return db.SupplierSelection.findAll(query);
}

async function getSelectionSupplierIntensities() {
    try {
        const [results, metadata] = await db.sequelize.query(
            `SELECT suppliercotadata.erp as erp, intensity.id as "intensityCode", intensity.desc as intensity
            FROM suppliercotadata
            JOIN intensity on suppliercotadata.intensity = intensity.id`,
            {
                type: db.sequelize.QueryTypes.RAW
            }
        );
        return results
    } catch (e) {
        logger.error("Could not get supplier intensities for selection table: "+e)
    }
}
module.exports = {
    checkReason,
    uncheckReason,
    addComment,
    forceSelect,
    getSelectionSupplierData,
    getSelectionSupplierIntensities,
    getSupplierSelection
}