var express = require('express');
const CustomError = require('../error/CustomError');
const db = require('../data/database');
const preselectionService = require('../service/preselectionService');
const selectionService = require('../service/selectionService');
const commentService = require('../service/commentService');
const forceSelectionService = require('../service/forceSelectionService');
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

  router.post('/comment', async function(req, res, next) {
    if (!req.body.orgaid || !req.body.erp || !req.body.comment)
    {
      CustomError.missingFieldError();
    }
    const year = req.body.year ?? new Date().getFullYear();
    try{
        await commentService.addComment(req.body.orgaid, year, req.body.erp, req.body.comment);
    res.redirect("/en/selection")
    }
    catch(e) {
      next(e)
    }
  });

  router.post('/force', async function(req, res, next) {
    if (!req.body.orgaid || !req.body.erp || !req.body.comment)
    {
      CustomError.missingFieldError();
    }
    try{
        await forceSelectionService.forceSelect(req.body.orgaid, req.body.bool, req.body.erp, req.body.comment);
    res.redirect("/en/selection")
    }
    catch(e) {
      next(e)
    }
  });


module.exports = router;