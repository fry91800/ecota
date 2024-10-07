const supplierRepository = require("../data/supplierRepository.js");
async function getAllCotaData(){
    return supplierRepository.getAllCotaTableData();
}

async function answer(vendorcode, purchasingorganisationcode, questioncode, answer){
    return supplierRepository.answer(vendorcode, purchasingorganisationcode, questioncode, answer);
}
async function comment(vendorcode, purchasingorganisationcode, questioncode, comment){
    return supplierRepository.comment(vendorcode, purchasingorganisationcode, questioncode, comment);
}
async function getTeamAnswers(vendorcode, purchasingorganisationcode){
    return supplierRepository.getTeamAnswers(vendorcode, purchasingorganisationcode);
}
async function getAllCurrentCampaignAnswers(){
    return supplierRepository.getAllCurrentCampaignAnswers();
}
module.exports = {
    getAllCotaData,
    answer,
    getTeamAnswers,
    getAllCurrentCampaignAnswers,
    comment
}