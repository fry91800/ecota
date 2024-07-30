var express = require('express');
var router = express.Router();
const CustomError = require('../error/CustomError');
const userService = require("../service/userService");

/* Page de connexion utilisateur */
router.get('/login', async function(req, res, next) {
  res.render('login');
});

/* Endpoint de connexion utilisateur */
router.post('/auth', async function(req, res, next) {
  try {
    //Erreur en cas de champs non remplis
    if (!req.body.mail || !req.body.pass)
    {
      console.log("no auth")
      CustomError.testError();
    }
    var session = await userService.auth(req.body.mail, req.body.pass);
    //Authentification réussis
    res.cookie('session', session.id, { maxAge: 900000000, httpOnly: true });
    console.log(session.id);
    res.redirect("/");
} catch (e) {
  next(e);
}
});

router.get('/logout', async function(req, res, next) {
  res.clearCookie('session');
  res.redirect("/user/login");
});

router.post('/reset', async function(req, res, next) {
  try {
    console.log(req.body)
    //Erreur en cas de champs non remplis
    if (!req.body.mail)
    {
      console.log("no mail reset")
      CustomError.testError();
    }
    var resetToken = await userService.addResetToken(req.body.mail);
    //Reset réussis
    console.log(resetToken);
    res.redirect("/");
} catch (e) {
  next(e);
}
});
module.exports = router;
