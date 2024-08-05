const CustomError = require('../error/CustomError.js');
const sessionRepository = require("../data/sessionRepository.js");
const db = require('../data/database.js');

async function addCurrentCampaign(){
  var currentYear = new Date().getFullYear();
  var currentCampaign = await db.Campaign.findOne({
    where: {year: currentYear},
    raw: true
  })
  if (!currentCampaign)
  {
    await db.Campaign.create({
      year: currentYear
    })
  }
}
async function addPreselectionParams(revenue, intensity){
  try{
        //Check des parametres de preselection
        var intensities = await db.Intensity.findAll({
          attributes: ['id'],
          raw: true
        })
        var possibleIntensities = []
        for (var elt of intensities)
        {
          possibleIntensities.push(elt.id)
        }
        if (!possibleIntensities.includes(intensity) || revenue<0 || revenue>100)
        {
          console.log(possibleIntensities.includes(intensity))
          CustomError.wrongParam();
        }
        //Ajout des parametres dans la base de données
        await db.Campaign.update(
          {revenue: revenue,
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
//Ajoute les supplier de la liste courante dans la campagne courrante
async function syncSuppliers()
{
  try{
    var suppliers = await db.Supplier1.findAll({
      attributes: ["erp", "name"],
      raw: true
    })
    var currentCampaignSuppliers = await db.SupplierSelection.findAll({
      attributes: ["erp", "name"],
      raw: true
    })
    var suppliersDic = suppliers.reduce((acc, supplier) => {
      acc[supplier.erp] = {
        name: supplier.name,
      };
      return acc;
    }, {});
    var campaignDic = currentCampaignSuppliers.reduce((acc, supplier) => {
      acc[supplier.erp] = {
        name: supplier.name,
      };
      return acc;
    }, {});
    var suppliersErps = suppliers.map(obj => obj.erp);
    var campaignErps = currentCampaignSuppliers.map(obj => obj.erp);
    console.log(suppliersErps)
    console.log(campaignErps)
    //Ajoute les manquants
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
    //Supprime ceux en trop
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
      //Synchronise les noms
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
    await addCurrentCampaign();
    //Ajoute les parametres de preselection dans la table campaign
    await addPreselectionParams(revenuePercentage, intensity)
    //Synchronise la liste des suppliers avec la liste de selection
    await syncSuppliers();
    await autoCheck();
  }
  catch(e)
  {
    console.error(e);
  }
}

module.exports = {
  preselect
}