var express = require('express');
var router = express.Router();

/* Redirection*/
router.get('/:langswitch', function(req, res, next) {
    sessionTime = 10 * 365 * 24 * 60 * 60 * 1000 // 10 years
    res.cookie('lang', req.params.langswitch, { maxAge: sessionTime, httpOnly: true });
    res.redirect("back");
});

module.exports = router;