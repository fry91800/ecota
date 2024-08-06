var express = require('express');
const CustomError = require('../error/CustomError');
const db = require('../data/database');
const selectionService = require('../service/preselectionService')
var router = express.Router();

router.get('/', function(req, res, next) {
    res.render("selection");
  });

  router.post('/preselection', async function(req, res, next) {
    if (!req.body.revenue || !req.body.intensity)
    {
      CustomError.missingFieldError();
    }
    try{
    await selectionService.preselect(Number(req.body.revenue), Number(req.body.intensity));
    res.redirect("/en/selection")
    }
    catch(e) {
      next(e)
    }
  });

module.exports = router;