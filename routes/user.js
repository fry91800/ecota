var express = require('express');
var router = express.Router();
const db = require("../data/database.js");
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
    sessionTime = 10 * 365 * 24 * 60 * 60 * 1000 // 10 years
    res.cookie('session', session.id, { maxAge: sessionTime, httpOnly: true });
    res.redirect("/");
} catch (e) {
  next(e);
}
});

/* Endpoint de deconnexion */
router.get('/logout', async function(req, res, next) {
  try {
    console.log()
    var sessionid = res.locals.session.sessionid
    var now = Date();
    await db.Session.update(
      { endtime: now },
      {
        where: {
          id: sessionid,
        },
      },
    );
    res.clearCookie('session');
    res.redirect("/");
  }
  catch(e){
    next(e);
  }
});

router.get('/recovery', async function(req, res, next) {
  res.render('recovery');
});

router.post('/recovery', async function(req, res, next) {
  try {
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
      CustomError.defaultError();
    }
  try{
  await userService.checkResetToken(req.query.token);
  res.locals.token = req.query.token;
  return res.render('passreset');
  }
  catch(e)
  {
    next(e);
  }
});

router.post('/passreset', async function(req, res, next) {
  try {
    //Erreur en cas de champs non remplis
    if (!req.body.pass || !req.body.confirmpass)
    {
      CustomError.missingFieldError();
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
      next(e);
    }
} catch (e) {
  next(e);
}
});
module.exports = router;