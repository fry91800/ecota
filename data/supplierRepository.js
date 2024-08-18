const db = require('../data/database.js');
const { Op } = require('sequelize');
const { logger, logEnter, logExit } = require('../config/logger');
async function getSupplierSelectionDataByErp(erp, attributes) {
    const currentYear = new Date().getFullYear();
    return db.SupplierSelection.findOne({
        attributes: attributes,
        where: { erp: erp, year: currentYear },
        raw: true
    })
}
async function getOneMaster(query = {}) {
    query["raw"] = true
    return db.Supplier1.findAll(query);
}
async function getAllMaster(query = {}) {
    query["raw"] = true
    return db.Supplier1.findAll(query);
}

async function getOneSupplierSelection(query = {}) {
    query["raw"] = true
    return db.SupplierSelection.findAll(query);
}
async function getAllSupplierSelection(query = {}) {
    query["raw"] = true
    return db.SupplierSelection.findAll(query);
}
async function insertManySupplierSelection(suppliers) {
    await db.SupplierSelection.bulkCreate(suppliers);
}

async function getMasterData(attributes) {
    return db.Supplier1.findAll({
        attributes: attributes,
        raw: true
    })
}
async function getCurrentCampaignSuppliers(attributes) {
    const currentYear = new Date().getFullYear();
    return db.SupplierSelection.findAll({
        attributes: attributes,
        where: { year: currentYear },
        raw: true
    })
}

async function supplierSelectionDestroy(where) {
    await db.SupplierSelection.destroy({
        where: where
    });
}

async function currentSupplierSelectionUpdateName(erp, name) {
    const currentYear = new Date().getFullYear();
    await db.SupplierSelection.update(
        { name: name },
        { where: { erp: erp, year: currentYear } }
    );
}

async function getRevenueData() {
    return db.Supplier1.findAll(
        {
            attributes: ["erp", "revenue", "team"],
            order: [['revenue', 'DESC']],
            raw: true
        }
    )
}
async function getRevenueDataByTeam(teamCode) {
    return db.Supplier1.findAll(
        {
            attributes: ["erp", "revenue"],
            where: { team: teamCode },
            order: [['revenue', 'DESC']],
            raw: true
        }
    )
}

async function getLastYearIntensities() {
    const lastYear = new Date().getFullYear() - 1;
    return db.SupplierCotaData.findAll(
        {
            attributes: ["erp", "intensity"],
            where: { year: lastYear },
            raw: true
        }
    )
}

async function getLastYearIntensityByErp(erp) {
    const lastYear = new Date().getFullYear() - 1;
    const record = await db.SupplierCotaData.findOne(
        {
            attributes: ["erp", "intensity"],
            where: { erp: erp, year: lastYear },
            raw: true
        }
    )
    if (!record) {
        return null;
    }
    return record.intensity;
}

async function getErpWithReason() {
    const currentYear = new Date().getFullYear();
    const selectedByReasonData = await db.SupplierSelection.findAll({
        attributes: ['erp'],
        where: {
            year: currentYear,
            [Op.or]: [
                { reason1: true },
                { reason2: true },
                { reason3: true },
                { reason4: true },
                { reason5: true },
            ]
        },
        raw: true
    });
    return selectedByReasonData.map(obj => obj.erp)
}

async function getCurrentYearSelectedErps() {
    const currentYear = new Date().getFullYear();
    const selected = await db.SupplierSelection.findAll({
        attributes: ['erp'],
        where: {
            selected: true,
            year: currentYear
        },
        raw: true
    });
    return selected.map(obj => obj.erp);
}

async function selectFromErps(erpsToSelect) {
    await db.SupplierSelection.update(
        { selected: true },
        {
            where: {
                erp: {
                    [Op.in]: erpsToSelect
                }
            }
        }
    );
}
async function deselectFromErps(erpsToDeselect) {
    await db.SupplierSelection.update(
        { selected: false },
        {
            where: {
                erp: {
                    [Op.in]: erpsToDeselect
                }
            }
        }
    );
}
async function getTeamFromErp(erp) {
    const record = await db.Supplier1.findOne({
        attributes: ["team"],
        where: { erp: erp },
        raw: true
    });
    return record.team;
}
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
async function select(erp) {
    try {
        const currentYear = new Date().getFullYear();
        await db.SupplierSelection.update(
            {
                selected: true
            },
            {
                where: { erp: erp, year: currentYear }
            }
        );
    }
    catch (e) {
        console.error("Could not select supplier", e);
    }
}
async function deselect(erp) {
    try {
        const currentYear = new Date().getFullYear();
        await db.SupplierSelection.update(
            {
                selected: false
            },
            {
                where: { erp: erp, year: currentYear }
            }
        );
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

async function getSelectionSupplierData(userTeam) {
    try {
        let whereString = ``;
        if (userTeam) {
            whereString = `WHERE supplier1.team = '${userTeam}'`;
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
    getOneMaster,
    getAllMaster,
    getOneSupplierSelection,
    getAllSupplierSelection,
    getSupplierSelectionDataByErp,
    getMasterData,
    getCurrentCampaignSuppliers,
    insertManySupplierSelection,
    supplierSelectionDestroy,
    currentSupplierSelectionUpdateName,
    getRevenueData,
    getRevenueDataByTeam,
    getLastYearIntensities,
    getLastYearIntensityByErp,
    getErpWithReason,
    getCurrentYearSelectedErps,
    selectFromErps,
    deselectFromErps,
    getTeamFromErp,
    checkReason,
    uncheckReason,
    select,
    deselect,
    addComment,
    forceSelect,
    getSelectionSupplierData,
    getSelectionSupplierIntensities,
    getSupplierSelection
}