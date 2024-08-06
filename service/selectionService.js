const CustomError = require('../error/CustomError.js');
const sessionRepository = require("../data/sessionRepository.js");
const db = require('../data/database.js');

async function addCurrentCampaign(){
  // Step 1: Check si la campagne de l'année courante existe déjà
  var currentYear = new Date().getFullYear();
  var currentCampaign = await db.Campaign.findOne({
    where: {year: currentYear},
    raw: true
  })
  // Step 2: Si la campagne n'existe pas, on la crée
  if (!currentCampaign)
  {
    await db.Campaign.create({
      year: currentYear
    })
  }
}

async function addPreselectionParams(revenue, intensity){
  try{
    // Step 1: Obtiens la liste des intensités possible depuis la bdd
    var intensities = await db.Intensity.findAll({
      attributes: ['id'],
      raw: true
    })
    var possibleIntensities = []
    for (var elt of intensities)
    {
      possibleIntensities.push(elt.id)
    }
    // Step 2: Check validité intensity
    if (!possibleIntensities.includes(intensity))
    {
      CustomError.wrongParam();
    }
    // Step 3: Check validité revenue
    if (revenue<0 || revenue>100)
    {
      CustomError.wrongParam();
    }
    // Step 4: Ajout dans la base de données
    await db.Campaign.update(
      {
      revenue: revenue,
      intensity: intensity
      },
      {
      where: {year: new Date().getFullYear()}
      }
    )
  }
  catch(e)
  {
    console.error(e)
  }
}
//Synchronise la table supplierSelection par rapport à la table maîtresse de suppliers
async function syncSuppliers()
{
  try{
    // Step 1: Selection des suppliers de la table supplier principale
    const suppliers = await db.Supplier1.findAll({
      attributes: ["erp", "name"],
      raw: true
    })
    // Step 2: Selection des suppliers de la table maîtresse
    const currentCampaignSuppliers = await db.SupplierSelection.findAll({
      attributes: ["erp", "name"],
      raw: true
    })
    // Step 3: Transformation en dictionnaire pour un accès rapide
    const suppliersDic = suppliers.reduce((acc, supplier) => {
      acc[supplier.erp] = {
        name: supplier.name,
      };
      return acc;
    }, {});
    const campaignDic = currentCampaignSuppliers.reduce((acc, supplier) => {
      acc[supplier.erp] = {
        name: supplier.name,
      };
      return acc;
    }, {});
    // Step 4: Obtention des listes des erps
    const suppliersErps = new Set(suppliers.map(({ erp }) => erp));
    const campaignErps = new Set(currentCampaignSuppliers.map(({ erp }) => erp));
    /*
    // Step 5: Ajout des suppliers manquants
    for (var erp of suppliersErps)
    {
      if (!campaignErps.includes(erp))
      {
        await db.SupplierSelection.create({
          year: new Date().getFullYear(),
          erp: erp,
          name: suppliersDic[erp].name
        })
      }
    }
    // Step 6: Suppression des suppliers en trop
    for (var erp of campaignErps)
      {
        if (!suppliersErps.includes(erp))
        {
          await db.SupplierSelection.destroy({
            where: {
            erp: erp,
          }
          })
        }
      }
      // Step 7: Synchronisation des noms
      for (var erp of campaignErps)
        {
          if (campaignDic[erp].name !== suppliersDic[erp].name)
          {
            await db.SupplierSelection.update({
              name: suppliersDic[erp].name,
            },
            {
              where: { erp: erp}
            })
          }
        }
  */
     // Step 5: Ajout des suppliers manquants
     const suppliersToAdd = Array.from(suppliersErps).filter(erp => !campaignErps.has(erp));
     if (suppliersToAdd.length > 0) {
       const newSuppliers = suppliersToAdd.map(erp => ({
         year: new Date().getFullYear(),
         erp,
         name: suppliersDic[erp].name
       }));
       console.log(newSuppliers);
       await db.SupplierSelection.bulkCreate(newSuppliers);
     }
 
     // Step 6: Suppression des suppliers en trop
     const suppliersToDelete = Array.from(campaignErps).filter(erp => !suppliersErps.has(erp));
     if (suppliersToDelete.length > 0) {
       await db.SupplierSelection.destroy({
         where: {
           erp: suppliersToDelete
         }
       });
     }
 
     // Step 7: Synchronisation des noms
     for (const erp of campaignErps) {
       if (suppliersDic[erp] && campaignDic[erp].name !== suppliersDic[erp].name) {
         await db.SupplierSelection.update(
           { name: suppliersDic[erp].name },
           { where: { erp } }
         );
       }
     }
  }

  catch(e){
    console.error(e);
  }
}
async function getSelectedByRevenue()
{
  var campaign = await db.Campaign.findOne(
    {
      where: {year: new Date().getFullYear()}
    } 
  );
  revenue = campaign.revenue;
  var teams = await db.Team.findAll({
    attributes: ["code"],
    raw: true
  });
  var teamsCode = teams.map(obj => obj.code)
  var suppliersRevenues = await db.Supplier1.findAll(
    {
      attributes: ["erp", "revenue", "team"],
      order: [['revenue', 'DESC']],
      raw: true
    }
  )
  var teamsTotalRevenue = {};
  for (var teamCode of teamsCode)
  {
    var totalRevenue = suppliersRevenues
    .filter(item => item.team === teamCode) // Filtre par team
    .reduce((sum, item) => sum + item.revenue, 0); // somme les revenue
    teamsTotalRevenue.push({teamCode: totalRevenue});
  }
  console.log(teamsTotalRevenue)
  var selectedErp = [];
  for (var teamCode of teamsCode)
  {
    var sum = 0;
    var suppliersRevenuesOfTeam = suppliersRevenues
    .filter(item => item.team === teamCode) // Filtre par team
    for (elt of suppliersRevenuesOfTeam)
    {

    }
  }
}
async function autoCheckRevenue()
{

  var selection = getSelectedByRevenue()

}
async function autoCheckIntensity()
{
}
async function autoCheck()
{
  await autoCheckRevenue();
  await autoCheckIntensity();
}
async function preselect(revenuePercentage, intensity)
{
  try{
    //Ajoute la campagne de l'année courrante dans la base de données
    await addCurrentCampaign();
    //Ajoute les parametres revenue et intensity dans la table campaign
    await addPreselectionParams(revenuePercentage, intensity)
    //Synchronise la liste des suppliers avec la liste de selection
    await syncSuppliers();
    //await autoCheck();
  }
  catch(e)
  {
    console.error(e);
  }
}

module.exports = {
  preselect
}