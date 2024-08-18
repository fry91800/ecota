const db = require('./database.js');

async function getOne(table, query = {}) {
    query["raw"] = true;
    return db[table].findOne(query);
}
async function getAll(table, query = {}) {
    query["raw"] = true;
    return db[table].findAll(query);
}
async function update(table, update, where) {
    await db[table].update(update, where)
}

async function insertOne(table, object) {
    return db[table].create(object);
}
async function insertMany(table, objects) {
    return db[table].bulkCreate(objects);
}

module.exports = {
    getOne,
    getAll,
    update,
    insertOne,
    insertMany
}