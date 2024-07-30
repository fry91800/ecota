var express = require('express');
var router = express.Router();
const CustomError = require('../error/CustomError');
const userService = require("../service/userService");

/* Page de connexion utilisateur */
router.get('/login', async function(req, res, next) {
  res.render('login');
});

/* Endpoint de connexion utilisateur */
router.post('/login', async function(req, res, next) {
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

router.get('/recovery', async function(req, res, next) {
  res.render('recovery');
});

router.post('/recovery', async function(req, res, next) {
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
    res.redirect("/");
} catch (e) {
  next(e);
}
});

router.get('/passreset', async function(req, res, next) {
  if (!req.query.token)
    {
      console.log("no reset token")
      //CustomError.testError();
      res.send('The password recovery session has expired');
    }
  try{
  var resetTokenValid = await userService.checkResetToken(req.query.token)
  }
  catch(e)
  {
    console.log(e);
    res.send(e.message);
  }

  res.locals.token = req.query.token;
  return res.render('passreset');
  res.send('The password recovery session has expired');
});

router.post('/passreset', async function(req, res, next) {
  try {
    //Erreur en cas de champs non remplis
    if (!req.body.pass || !req.body.confirmpass)
    {
      console.log("missing pass")
      CustomError.testError();
    }
    if (req.body.pass !== req.body.confirmpass)
      {
        console.log("different pass")
        CustomError.testError();
      }
    try
    {
    await userService.resetPass(req.query.token, req.body.pass);
    res.redirect("/user/login");
    }
    catch(e)
    {
      res.render(e.message);
    }
} catch (e) {
  next(e);
}
});
module.exports = router;
