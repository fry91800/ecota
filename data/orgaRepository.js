const db = require('../data/database.js');

async function getOne(query = {}) {
    query["raw"] = true;
    return db.Campaign.findOne(query);
}
async function getAll(query = {}) {
    query["raw"] = true;
    return db.Campaign.findAll(query);
}
async function update(update, where) {
    return db.Orga.update(update, where);
}
module.exports = {
    getOne,
    getAll,
    update,
}