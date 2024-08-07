const db = require('../data/database.js');
const { Op } = require('sequelize');
async function getSupplierSelectionDataByErp(erp, attributes){
    const currentYear = new Date().getFullYear();
    return db.SupplierSelection.findOne({
        attributes: attributes,
        where: {erp: erp, year: currentYear},
        raw: true
    })
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

async function supplierSelectionBulkCreate(suppliers) {
    await db.SupplierSelection.bulkCreate(suppliers);
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
            where: {team: teamCode},
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
    const record =  await db.SupplierCotaData.findOne(
        {
            attributes: ["erp", "intensity"],
            where: {erp: erp, year: lastYear },
            raw: true
        }
    )
    if (!record)
    {
        return null;
    }
    return record.intensity;
}

async function getErpWithReason()
{
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

async function getCurrentYearSelectedErps()
{
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

async function selectFromErps(erpsToSelect)
{
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
async function deselectFromErps(erpsToDeselect)
{
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
async function getTeamFromErp(erp)
{
    const record = await db.Supplier1.findOne({
        attributes: ["team"],
        where: {erp: erp},
        raw: true
    });
    return record.team;
}
async function checkReason(erp, reason)
{
    try {
        const currentYear = new Date().getFullYear();
        const updateData = {};
        updateData[reason] = true;
        await db.SupplierSelection.update(
            updateData,
            {
                where: {erp: erp, year: currentYear}
            }
        )
    }
    catch(e)
    {
        console.error("Could not select supplier", e);
    }
}
async function uncheckReason(erp, reason)
{
    try {
        const currentYear = new Date().getFullYear();
        const updateData = {};
        updateData[reason] = false;
        await db.SupplierSelection.update(
            updateData,
            {
                where: {erp: erp, year: currentYear}
            }
        )
    }
    catch(e)
    {
        console.error("Could not select supplier", e);
    }
}
async function select(erp)
{
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
    catch(e)
    {
        console.error("Could not select supplier", e);
    }
}
async function deselect(erp)
{
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
    catch(e)
    {
        console.error("Could not select supplier", e);
    }
}

async function addComment(orgaid, year, erp, comment)
{
    try {
        await db.SupplierSelection.update(
            { comment: comment, commenter: orgaid },
            { where: { erp: erp, year: year } }
        );
    } catch (e) {
        console.log("Could not add Comment to the database: ", e)
    }
}
async function forceSelect(orgaid, bool, erp, comment)
{
    try {
        await db.SupplierSelection.update(
            { force: bool, comment: comment, commenter: orgaid },
            { where: { erp: erp} }
        );
    } catch (e) {
        console.log("Could not force selection to the database: ", e)
    }
}
module.exports = {
    getSupplierSelectionDataByErp,
    getMasterData,
    getCurrentCampaignSuppliers,
    supplierSelectionBulkCreate,
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
    forceSelect
}