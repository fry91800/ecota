var express = require('express');
const CustomError = require('../error/CustomError');
const { logger, logEnter, logExit } = require('../config/logger');
const preselectionService = require('../service/preselectionService');
const selectionService = require('../service/selectionService');
const commentService = require('../service/commentService');
const forceSelectionService = require('../service/forceSelectionService');
var router = express.Router();

router.get('/', function (req, res, next) {
  res.render("selection");
});

router.post('/preselection', async function (req, res, next) {
  try {
    const revenue = Number(req.body.revenue);
    const intensity = Number(req.body.intensity);
    if (isNaN(revenue) || isNaN(intensity)) {
      CustomError.wrongParam();
    }
    logger.debug("Calling Selection service preselect: revenue: " + revenue + ", intensity: " + intensity);
    await preselectionService.preselect(revenue, intensity);
    res.redirect("/en/selection")
  }
  catch (e) {
    next(e)
  }
});

router.post('/reason/:action', async function (req, res, next) {
  if (!req.body.erp || !req.body.reason) {
    CustomError.missingFieldError();
  }
  try {
    let response = {selected: false};
    if (req.params.action === "check") {
      response = await selectionService.checkReason(req.body.erp, req.body.reason);
    }
    else if (req.params.action === "uncheck") {
      response = await selectionService.uncheckReason(req.body.erp, req.body.reason);
    }
    else {
      CustomError.defaultError();
    }
    console.log(response)
    res.json(response);
    //res.redirect("/en/selection")
  }
  catch (e) {
    next(e)
  }
});

router.post('/comment', async function (req, res, next) {
  if (!req.body.orgaid || !req.body.erp || !req.body.comment) {
    CustomError.missingFieldError();
  }
  const year = req.body.year ?? new Date().getFullYear();
  try {
    await commentService.addComment(req.body.orgaid, year, req.body.erp, req.body.comment);
    res.redirect("/en/selection")
  }
  catch (e) {
    next(e)
  }
});

router.post('/force', async function (req, res, next) {
  if (!req.body.orgaid || !req.body.erp || !req.body.comment) {
    CustomError.missingFieldError();
  }
  try {
    await forceSelectionService.forceSelect(req.body.orgaid, req.body.bool, req.body.erp, req.body.comment);
    res.redirect("/en/selection")
  }
  catch (e) {
    next(e)
  }
});


// TEST
router.get('/test', (req, res) => {
  res.render("test");
});
router.get('/data', (req, res) => {
  res.locals.formatNumber = (number) => {
    return new Intl.NumberFormat().format(number);
  };
  const data = [
    { "selected": true, erp: "erp1", "supplier": "Aerostar", "revenue": 1000000, "intensity": "Intensive", "intensityCode": 4, "reason1": false, "reason2": false, "reason3": false, "reason4": false, "comment": null, history: true},
    { "selected": true, erp: "erp2", "supplier": "Buckwild", "revenue": 2000000, "intensity": "Tightened", "intensityCode": 3, "reason1": false, "reason2": false, "reason3": false, "reason4": false, "comment": null, history: true },
    { "selected": false, erp: "erp3", "supplier": "Cmoney", "revenue": 3000000, "intensity": "Nominal", "intensityCode": 2, "reason1": false, "reason2": false, "reason3": false, "reason4": false, "comment": "Supplier particulièrement efficace durant l'hivers et pendant les jours de pluie", history: true },
    /*{ "selected": true, erp: "erp1", "supplier": "Quantum Synergy", "revenue": 1600000, "intensity": "Intensive", "intensityCode": 4, "reason1": false, "reason2": false, "reason3": false, "reason4": false, "comment": null, history: true},
    { "selected": true, erp: "erp2", "supplier": "NexGen Innovations", "revenue": 4600000, "intensity": "Tightened", "intensityCode": 3, "reason1": false, "reason2": false, "reason3": false, "reason4": false, "comment": null, history: true },
    { "selected": true, erp: "erp1", "supplier": "Pinnacle Dynamics", "revenue": 1200000, "intensity": "Intensive", "intensityCode": 4, "reason1": false, "reason2": false, "reason3": false, "reason4": false, "comment": null, history: true},
    { "selected": false, erp: "erp2", "supplier": "Eclipse Enterprises", "revenue": 2700000, "intensity": "Nominal", "intensityCode": 2, "reason1": false, "reason2": false, "reason3": false, "reason4": false, "comment": null, history: true },
    { "selected": true, erp: "erp1", "supplier": "Vertex Solutions", "revenue": 1800000, "intensity": "Intensive", "intensityCode": 4, "reason1": false, "reason2": false, "reason3": false, "reason4": false, "comment": null, history: true},
    { "selected": true, erp: "erp2", "supplier": "EchoWave Technologies", "revenue": 2900000, "intensity": "Tightened", "intensityCode": 3, "reason1": false, "reason2": false, "reason3": false, "reason4": false, "comment": null, history: true },
    { "selected": true, erp: "erp1", "supplier": "Zenith Ventures", "revenue": 1600000, "intensity": "Intensive", "intensityCode": 4, "reason1": false, "reason2": false, "reason3": false, "reason4": false, "comment": null, history: true},
    { "selected": true, erp: "erp2", "supplier": "Fusion Labs", "revenue": 12300000, "intensity": "Tightened", "intensityCode": 3, "reason1": false, "reason2": false, "reason3": false, "reason4": false, "comment": null, history: true },
    { "selected": true, erp: "erp1", "supplier": "Vanguard Horizons", "revenue": 1300000, "intensity": "Intensive", "intensityCode": 4, "reason1": false, "reason2": false, "reason3": false, "reason4": false, "comment": null, history: true},
    { "selected": false, erp: "erp2", "supplier": "Celestial Solutions", "revenue": 2400000, "intensity": "Nominal", "intensityCode": 2, "reason1": false, "reason2": false, "reason3": false, "reason4": false, "comment": null, history: true },
    { "selected": true, erp: "erp1", "supplier": "Titanium Strategies", "revenue": 4500000, "intensity": "Intensive", "intensityCode": 4, "reason1": false, "reason2": false, "reason3": false, "reason4": false, "comment": null, history: true},
    { "selected": true, erp: "erp2", "supplier": "Apex Creations", "revenue": 7600000, "intensity": "Tightened", "intensityCode": 3, "reason1": false, "reason2": false, "reason3": false, "reason4": false, "comment": null, history: true },
    { "selected": true, erp: "erp1", "supplier": "NovaLink Systems", "revenue": 5600000, "intensity": "Intensive", "intensityCode": 4, "reason1": false, "reason2": false, "reason3": false, "reason4": false, "comment": null, history: true},
    { "selected": true, erp: "erp2", "supplier": "Luminary Networks", "revenue": 4400000, "intensity": "Tightened", "intensityCode": 3, "reason1": false, "reason2": false, "reason3": false, "reason4": false, "comment": null, history: true },
    { "selected": false, erp: "erp1", "supplier": "Stellar Solutions", "revenue": 3400000, "intensity": "Nominal", "intensityCode": 2, "reason1": false, "reason2": false, "reason3": false, "reason4": false, "comment": null, history: true},
    { "selected": true, erp: "erp2", "supplier": "OmniTech Innovations", "revenue": 2300000, "intensity": "Tightened", "intensityCode": 3, "reason1": false, "reason2": false, "reason3": false, "reason4": false, "comment": null, history: true },
    { "selected": true, erp: "erp1", "supplier": "Infinity Dynamics", "revenue": 9800000, "intensity": "Intensive", "intensityCode": 4, "reason1": false, "reason2": false, "reason3": false, "reason4": false, "comment": null, history: true},
    { "selected": false, erp: "erp2", "supplier": "PrimePulse Technologies", "revenue": 7200000, "intensity": "Reduce", "intensityCode": 1, "reason1": false, "reason2": false, "reason3": false, "reason4": false, "comment": null, history: true },
    { "selected": true, erp: "erp1", "supplier": "Elevate Enterprises", "revenue": 6500000, "intensity": "Intensive", "intensityCode": 4, "reason1": false, "reason2": false, "reason3": false, "reason4": false, "comment": null, history: true},
    { "selected": true, erp: "erp2", "supplier": "Radiant Edge", "revenue": 4300000, "intensity": "Tightened", "intensityCode": 3, "reason1": false, "reason2": false, "reason3": false, "reason4": false, "comment": null, history: true },
    { "selected": true, erp: "erp1", "supplier": "Stratosphere Solutions", "revenue": 2100000, "intensity": "Intensive", "intensityCode": 4, "reason1": false, "reason2": false, "reason3": false, "reason4": false, "comment": null, history: true},
    { "selected": false, erp: "erp2", "supplier": "Catalyst Creations", "revenue": 5400000, "intensity": "Reduce", "intensityCode": 1, "reason1": false, "reason2": false, "reason3": false, "reason4": false, "comment": null, history: true },
    { "selected": true, erp: "erp1", "supplier": "Horizon Nexus", "revenue": 6600000, "intensity": "Intensive", "intensityCode": 4, "reason1": false, "reason2": false, "reason3": false, "reason4": false, "comment": null, history: true},
    { "selected": true, erp: "erp2", "supplier": "Ascend Technologies", "revenue": 4300000, "intensity": "Tightened", "intensityCode": 3, "reason1": false, "reason2": false, "reason3": false, "reason4": false, "comment": null, history: true },
    { "selected": true, erp: "erp1", "supplier": "Zenova Systems", "revenue": 1000000, "intensity": "Intensive", "intensityCode": 4, "reason1": false, "reason2": false, "reason3": false, "reason4": false, "comment": null, history: true},
    { "selected": true, erp: "erp2", "supplier": "PulsePoint Ventures", "revenue": 2200000, "intensity": "Tightened", "intensityCode": 3, "reason1": false, "reason2": false, "reason3": false, "reason4": false, "comment": null, history: true },
*/
  ]
  const { page = 1, selected = false, notSelected = false, supplier = '',
    revenueSign = ">", revenue = 0, intensity1 = false, intensity2 = false, intensity3 = false, intensity4 = false,
    reason1Selected = false, reason1NotSelected = false, reason2Selected = false, reason2NotSelected = false,
    reason3Selected = false, reason3NotSelected = false, reason4Selected = false, reason4NotSelected = false,
    sortField = '', sortOrder = 'asc' } = req.query;
  const limit = 20;
  const offset = (page - 1) * limit;

  let filteredData = data;

  if (supplier) {
    filteredData = filteredData.filter(entry => entry.supplier.toLowerCase().includes(supplier.toLowerCase()));
  }
  if (selected === 'true') {
    filteredData = filteredData.filter(entry => entry.selected === true);
  }
  if (notSelected === 'true') {
    filteredData = filteredData.filter(entry => entry.selected === false);
  }
  if (revenueSign === ">") {
    filteredData = filteredData.filter(entry => entry.revenue > revenue);
  }
  if (revenueSign === "<") {
    filteredData = filteredData.filter(entry => entry.revenue < revenue);
  }
  if (intensity1 === 'true' || intensity2 === 'true' || intensity3 === 'true' || intensity4 === 'true')
  {
    if (intensity1 === 'false') {
      filteredData = filteredData.filter(entry => entry.intensityCode !== 1);
    }
    if (intensity2 === 'false') {
      filteredData = filteredData.filter(entry => entry.intensityCode !== 2);
    }
    if (intensity3 === 'false') {
      filteredData = filteredData.filter(entry => entry.intensityCode !== 3);
    }
    if (intensity4 === 'false') {
      filteredData = filteredData.filter(entry => entry.intensityCode !== 4);
    }
  }
  /*
  if (intensity1 === 'true') {
    filteredData = filteredData.filter(entry => entry.intensityCode === 1);
  }
  if (intensity2 === 'true') {
    filteredData = filteredData.filter(entry => entry.intensityCode === 2);
  }
  if (intensity3 === 'true') {
    filteredData = filteredData.filter(entry => entry.intensityCode === 3);
  }
  if (intensity4 === 'true') {
    filteredData = filteredData.filter(entry => entry.intensityCode === 4);
  }
    */
  if (reason1Selected === 'true') {
    filteredData = filteredData.filter(entry => entry.reason1 === true);
  }
  if (reason1NotSelected === 'true') {
    filteredData = filteredData.filter(entry => entry.reason1 === false);
  }
  if (reason2Selected === 'true') {
    filteredData = filteredData.filter(entry => entry.reason2 === true);
  }
  if (reason2NotSelected === 'true') {
    filteredData = filteredData.filter(entry => entry.reason2 === false);
  }
  if (reason3Selected === 'true') {
    filteredData = filteredData.filter(entry => entry.reason3 === true);
  }
  if (reason3NotSelected === 'true') {
    filteredData = filteredData.filter(entry => entry.reason3 === false);
  }
  if (reason4Selected === 'true') {
    filteredData = filteredData.filter(entry => entry.reason4 === true);
  }
  if (reason4NotSelected === 'true') {
    filteredData = filteredData.filter(entry => entry.reason4 === false);
  }

  /*if (city) {
    filteredData = filteredData.filter(entry => entry.city.toLowerCase().includes(city.toLowerCase()));
  }*/
  function customCompare(a, b, sortField, sortOrder) {
    const valueA = a[sortField];
    const valueB = b[sortField];

    if (typeof valueA === 'string' && typeof valueB === 'string') {
      return sortOrder === 'asc' ? valueA.localeCompare(valueB) : valueB.localeCompare(valueA);
    } else if (typeof valueA === 'number' && typeof valueB === 'number') {
      return sortOrder === 'asc' ? valueA - valueB : valueB - valueA;
    } else {
      // Handle cases where the values are of different types or other types
      // This is optional and can be customized based on your requirements
      return 0;
    }
  }
  if (sortField) {
    filteredData.sort((a, b) => customCompare(a, b, sortField, sortOrder));
  }

  const paginatedData = filteredData.slice(offset, offset + limit);

  res.json(paginatedData);
});

module.exports = router;