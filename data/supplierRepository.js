const db = require('../data/database.js');
const { Op } = require('sequelize');
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
module.exports = {
    getMasterData,
    getCurrentCampaignSuppliers,
    supplierSelectionBulkCreate,
    supplierSelectionDestroy,
    currentSupplierSelectionUpdateName,
    getRevenueData,
    getLastYearIntensities,
    getErpWithReason,
    getCurrentYearSelectedErps,
    selectFromErps,
    deselectFromErps
}