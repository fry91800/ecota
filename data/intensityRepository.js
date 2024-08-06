const db = require('../data/database.js');
async function getIntensityLevels() {
    const intensities = await db.Intensity.findAll({
        attributes: ['id'],
        raw: true
    })
    return intensities.map(elt => elt.id);
}

module.exports = {
    getIntensityLevels
}