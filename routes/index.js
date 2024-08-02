var express = require('express');
var router = express.Router();

/* Redirection*/
router.get('/', function(req, res, next) {
  if (res.locals.session)
  {
    res.redirect("/en/selection");
  }
  else{
    res.redirect("/en/user/login");
  }
});
module.exports = router;