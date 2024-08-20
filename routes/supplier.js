var express = require('express');
var router = express.Router();
const statsService = require("../service/statsService");

/* Redirection*/
router.get('/:erp', async function (req, res, next) {
    try {
        res.send("Supplier page");
    }
    catch (e) {
        next(e);
    }
});
module.exports = router;