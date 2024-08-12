const supplierRepository = require("../data/supplierRepository");
async function forceSelect(orgaid, bool, erp, comment)
{
    try {
        return supplierRepository.forceSelect(orgaid, bool, erp, comment);
    } catch (e) {
        console.log("Error adding comment", e)
    }
}

module.exports = {
    forceSelect
}