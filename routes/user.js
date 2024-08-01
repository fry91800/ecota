var express = require('express');
var router = express.Router();
const CustomError = require('../error/CustomError');
const userService = require("../service/userService");

/*
Page de connexion utilisateur 
Renvoie vers la racine si l'utilisateur est connecté
*/
router.get('/login', async function(req, res, next) {
  if (res.locals.session)
  {
    return res.redirect("/");
  }
  res.render('login');
});

/* Endpoint de connexion utilisateur */
router.post('/login', async function(req, res, next) {
  try {
    //Erreur en cas de champs non remplis
    if (!req.body.mail || !req.body.pass)
    {
      CustomError.missingFieldError();
    }
    var session = await userService.auth(req.body.mail, req.body.pass);
    //Authentification réussis
    sessionTime = 365 * 10 * 24 * 60 * 60 * 1000 // 10 years
    res.cookie('session', session.id, { maxAge: sessionTime, httpOnly: true });
    res.redirect("/");
} catch (e) {
  next(e);
}
});

/* Endpoint de deconnexion */
router.get('/logout', async function(req, res, next) {
  res.clearCookie('session');
  res.redirect("/");
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
      CustomError.missingFieldError();
    }
    var resetToken = await userService.addResetToken(req.body.mail);
    console.log("http://localhost:3000/fr/user/passreset?token="+resetToken)
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
    res.redirect("/");
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
