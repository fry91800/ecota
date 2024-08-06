const CustomError = require('../error/CustomError.js');
const sessionRepository = require("../data/sessionRepository.js");
const db = require('../data/database.js');
const datastruct = require("../utility/datastruct.js");
const { Op } = require('sequelize');

async function addCurrentCampaign() {
  try {
    // Step 1: Check si la campagne de l'année courante existe déjà
    const currentYear = new Date().getFullYear();
    const currentCampaign = await db.Campaign.findOne({
      where: { year: currentYear },
      raw: true
    })
    // Step 2: Si la campagne n'existe pas, on la crée
    if (!currentCampaign) {
      await db.Campaign.create({
        year: currentYear
      })
    }
  }
  catch (e) {
    console.error("error trying to add the current campaign: ", e)
  }
}

async function addPreselectionParams(revenue, intensity) {
  try {
    // Step 1: Obtention de la liste des id intensités possible
    const intensities = await db.Intensity.findAll({
      attributes: ['id'],
      raw: true
    })
    const possibleIntensities = intensities.map(elt => elt.id);
    // Step 2: Check validité intensity
    if (!possibleIntensities.includes(intensity)) {
      CustomError.wrongParam();
    }
    // Step 3: Check validité revenue
    if (revenue < 0 || revenue > 100) {
      CustomError.wrongParam();
    }
    // Step 4: Ajout dans la base de données
    await db.Campaign.update(
      {
        revenue: revenue,
        intensity: intensity
      },
      {
        where: { year: new Date().getFullYear() }
      }
    )
  }
  catch (e) {
    console.error('Error adding preselection params:', e)
  }
}
//Synchronise la table supplierSelection par rapport à la table maîtresse de suppliers
async function syncSuppliers() {
  try {
    // Step 1: Selection des suppliers de la table supplier principale
    const suppliers = await db.Supplier1.findAll({
      attributes: ["erp", "name"],
      raw: true
    })
    // Step 2: Selection des suppliers de la table maîtresse
    const currentYear = new Date().getFullYear();
    const currentCampaignSuppliers = await db.SupplierSelection.findAll({
      attributes: ["erp", "name"],
      where: { year: currentYear },
      raw: true
    })
    // Step 3: Transformation en dictionnaire pour un accès rapide
    const suppliersDic = datastruct.dictionarize(suppliers, "erp", ["name"]);
    const campaignDic = datastruct.dictionarize(currentCampaignSuppliers, "erp", ["name"])
    // Step 4: Obtention des listes des erps
    const suppliersErps = new Set(suppliers.map(({ erp }) => erp));
    const campaignErps = new Set(currentCampaignSuppliers.map(({ erp }) => erp));
    // Step 5: Ajout des suppliers manquants
    const suppliersToAdd = Array.from(suppliersErps).filter(erp => !campaignErps.has(erp));
    if (suppliersToAdd.length > 0) {
      const newSuppliers = suppliersToAdd.map(erp => ({
        year: currentYear,
        erp,
        name: suppliersDic[erp].name
      }));
      await db.SupplierSelection.bulkCreate(newSuppliers);
    }
    // Step 6: Suppression des suppliers en trop
    const suppliersToDelete = Array.from(campaignErps).filter(erp => !suppliersErps.has(erp));
    if (suppliersToDelete.length > 0) {
      await db.SupplierSelection.destroy({
        where: {
          erp: suppliersToDelete,
          year: currentYear
        }
      });
    }

    // Step 7: Synchronisation des noms
    for (const erp of campaignErps) {
      if (suppliersDic[erp] && campaignDic[erp].name !== suppliersDic[erp].name) {
        await db.SupplierSelection.update(
          { name: suppliersDic[erp].name },
          { where: { erp, year: currentYear } }
        );
      }
    }
  }

  catch (e) {
    console.error('Error synchronizing suppliers:', e);
  }
}

async function getSelectedByRevenue() {
  try {
    // Step 1: Obtention du revenue % de la campagne actuelle
    const campaign = await db.Campaign.findOne(
      {
        where: { year: new Date().getFullYear() }
      }
    );
    const campaignRevenue = campaign.revenue;
    // Step 2: Obtention de la liste des teams
    const teams = await db.Team.findAll({
      attributes: ["code"],
      raw: true
    });
    const teamsCode = teams.map(obj => obj.code)
    // Step 3: Obtention des data relatives aux CA par divisions
    const suppliersRevenues = await db.Supplier1.findAll(
      {
        attributes: ["erp", "revenue", "team"],
        order: [['revenue', 'DESC']],
        raw: true
      }
    )
    const selectedErps = [];
    // Step 4: Filtrage des erps
    teamsCode.forEach(teamsCode => {
      // Step 4.1: Filtrage des données sur la team courrante
      const teamData = suppliersRevenues.filter(item => item.team === teamsCode);

      // Step 4.2 Calcul du revenue totale pour la team courrante
      const totalRevenue = teamData.reduce((acc, { revenue }) => acc + revenue, 0);

      // Step 4.3: Sort de la data par revenue descendant
      const sortedTeamData = teamData.sort((a, b) => b.revenue - a.revenue);

      // Step 4.4 Récupération des erps jusqu'au dépassement du seuil (revenue %)
      let accumulatedRevenue = 0;
      for (const { erp, revenue } of sortedTeamData) {
        if (accumulatedRevenue / totalRevenue >= campaignRevenue / 100) break;
        selectedErps.push(erp);
        accumulatedRevenue += revenue;
      }
    });

    return selectedErps;
  }
  catch (e) {
    console.error('Error retrieving the selected erps (by revenue): ', e);
  }
}

async function getSelectedByIntensity() {
  try {
    // Step 1: Obtention de l'intensity de la campagne actuelle
    const currentYear = new Date().getFullYear();
    const campaign = await db.Campaign.findOne(
      {
        where: { year: currentYear }
      }
    );
    const campaignIntensity = campaign.intensity;
    // Step 2: Obtention de la liste des id intensités possible
    const intensities = await db.Intensity.findAll({
      attributes: ['id'],
      raw: true
    })
    const possibleIntensities = intensities.map(elt => elt.id);
    // Step 3: Obtention des data relatives aux intensité des suppliers de l'année passée
    const lastYear = currentYear - 1;
    const suppliersIntensities = await db.SupplierCotaData.findAll(
      {
        attributes: ["erp", "intensity"],
        where: { year: lastYear },
        raw: true
      }
    )
    const selectedErps = [];
    // Step 4 Selection des Erps avec aux moins le niveau d'intensité année-1 requis
    for (const { erp, intensity } of suppliersIntensities) {
      if (intensity >= campaignIntensity) {
        selectedErps.push(erp);
      }
    }
    return selectedErps;
  }
  catch (e) {
    console.error('Error retrieving the selected erps (by intensity): ', e);
  }
}

async function getSelectedByReason()
{
  try {
  const currentYear = new Date().getFullYear();
  const selectedByReasonData = await db.SupplierSelection.findAll({
    attributes: ['erp'], // Select only the "erp" field
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
    raw: true // This ensures the result is a plain JavaScript object
  });
  return selectedByReasonData.map(data => data.erp);
}
catch(e)
{
  console.error("Error getting erps with reasons selected: ", e)
}
}
async function autoCheck() {
  try {
    // Step 1: Obtention de la liste des erps devant être sélectionnés
    const selectedByRevenue = await getSelectedByRevenue();
    const selectedByIntensity = await getSelectedByIntensity();
    const selectedByReasons = await getSelectedByReason();
    const should = [...new Set([...selectedByRevenue, ...selectedByIntensity, ...selectedByReasons])];
    // Step 2: Obtention de la liste des erps sélectionnés cette année
    const currentYear = new Date().getFullYear();
    const currentData = await db.SupplierSelection.findAll({
      attributes: ['erp'], // Select only the "erp" field
      where: {
        selected: true,
        year: currentYear
      },
      raw: true // This ensures the result is a plain JavaScript object
    });
    const current = currentData.map(data => data.erp);
    // Step 3: Selection des manquants
    const erpsToSelect = should.filter(erp => !current.includes(erp));
    if (erpsToSelect.length > 0) {
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
    // Step 4: Désélection des suppliers en trop
    const erpsToDeselect = current.filter(erp => !should.includes(erp));
    if (erpsToDeselect.length > 0) {
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
  }
  catch (e) {
    console.error("Error updating selected field: ", e)
  }
}
async function preselect(revenuePercentage, intensity) {
  try {
    await addCurrentCampaign();
    await addPreselectionParams(revenuePercentage, intensity)
    await syncSuppliers();
    await autoCheck();
  }
  catch (e) {
    console.error(e);
  }
}

module.exports = {
  preselect
}