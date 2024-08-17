const db = require('../data/database.js');
const { v4: uuidv4 } = require('uuid');

async function getOne(query) {
    query["raw"] = true
    return db.Orga.findOne(query);
}

async function update(update, where) {
    return db.Orga.update(update, where);
}
module.exports = {
    getOne,
    update,
}