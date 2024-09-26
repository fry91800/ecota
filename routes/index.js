var express = require('express');
var router = express.Router();

// Redirection depuis la racine
router.get('/', function (req, res, next) {
  /*
  if (res.locals.session && res.locals.session.orgaid < 3)
  {
    res.redirect("/en/selection");
  }
  else if(res.locals.session)
  {
    res.redirect(`/${res.currentLang}/cota/${res.locals.session.orgaid}`);
  }
    */
  if (res.locals.session) {
    res.redirect(`/${res.currentLang}/selection`);
  }
  else {
    res.redirect(`/${res.currentLang}/user/login`);
  }
});
module.exports = router;