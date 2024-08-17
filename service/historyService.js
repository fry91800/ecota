const supplierRepository = require("../data/supplierRepository");
const { logger, logEnter, logExit } = require('../config/logger');
const { Op } = require('sequelize');
async function getSupplierHistory(erp, year)
{
    let where = {erp, year: {[Op.not]: year}}
    let query = {};
    query["where"] = where;
    try {
        return supplierRepository.getSupplierSelection(query);
    } catch (e) {
        logger.error("Error adding comment", e)
    }
}

module.exports = {
    getSupplierHistory
}