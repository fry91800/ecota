const supplierRepository = require("../data/supplierRepository");
async function addComment(orgaid, year, erp, comment)
{
    try {
        return supplierRepository.addComment(orgaid, year, erp, comment);
    } catch (e) {
        console.log("Error adding comment", e)
    }
}

module.exports = {
    addComment
}