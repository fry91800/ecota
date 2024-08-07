var express = require('express');
const CustomError = require('../error/CustomError');
const db = require('../data/database');
const preselectionService = require('../service/preselectionService');
const selectionService = require('../service/selectionService');
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
    await preselectionService.preselect(Number(req.body.revenue), Number(req.body.intensity));
    res.redirect("/en/selection")
    }
    catch(e) {
      next(e)
    }
  });

  router.post('/reason/:action', async function(req, res, next) {
    if (!req.body.erp || !req.body.reason)
    {
      CustomError.missingFieldError();
    }
    try{
      if (req.params.action === "check")
      {
        await selectionService.checkReason(req.body.erp , req.body.reason);
      }
      else if (req.params.action === "uncheck")
      {
        await selectionService.uncheckReason(req.body.erp , req.body.reason);
      }
      else{
        CustomError.defaultError();
      }
    
    res.redirect("/en/selection")
    }
    catch(e) {
      next(e)
    }
  });


module.exports = router;