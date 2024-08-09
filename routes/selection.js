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
    if (req.params.action === "check") {
      logger.debug("Calling preselection service: revenue: " + revenue + ", intensity: " + intensity);
      await selectionService.checkReason(req.body.erp, req.body.reason);
    }
    else if (req.params.action === "uncheck") {
      await selectionService.uncheckReason(req.body.erp, req.body.reason);
    }
    else {
      CustomError.defaultError();
    }

    res.redirect("/en/selection")
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
  const data = [
    {"selected":true,erp: "erp1", "supplier":"Aerostar", "revenue": 1000000, "intensity": "Intensive", "reason1": false, "reason2": false, "reason3": false, "reason4": false, "comment": null},
    {"selected":true,erp: "erp2", "supplier":"Buckwild", "revenue": 2000000, "intensity": "Tightened", "reason1": false, "reason2": false, "reason3": false, "reason4": false, "comment": null},
    {"selected":true,erp: "erp3", "supplier":"Cmoney", "revenue": 3000000, "intensity": "Nominale", "reason1": false, "reason2": false, "reason3": false, "reason4": false, "comment": null}
  ]
  const { page = 1, selected = false, notSelected = false, supplier = '', sortField = '', sortOrder = 'asc' } = req.query;
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