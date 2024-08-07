require('dotenv').config();
const createError = require('http-errors');
const express = require('express');
const path = require('path');
const cookieParser = require('cookie-parser');
//const logger = require('morgan'); unused
const logger = require('./config/logger');
const {CustomError}= require('./error/CustomError');
const db = require("./data/database.js");
const sessionRepository = require("./data/sessionRepository");
const i18n = require('i18n');
const accepts = require('accepts');

logger.info("let's go !");
logger.debug("let's go !");

//Getting the routers
var indexRouter = require('./routes/index');
var userRouter = require('./routes/user');
var selectionRouter = require('./routes/selection');
var langswitchRouter = require('./routes/langswitch');
var statsRouter = require('./routes/stats');

var app = express();

//Définition de la liste des langues
const supportedLanguages = ['en', 'fr'];

// Configuration de i18n : Package pour le multilangue
i18n.configure({
  locales: supportedLanguages,
  directory: __dirname + '/locales',
  defaultLocale: 'en',
});

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

//Middlewares
app.use(i18n.init);
//app.use(logger('dev')); unused
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));



//Language middleware
app.use('/:lang', function(req, res, next) {
  //Vérification de cookie de langue en premier
  var languageCookie = req.cookies.lang;
  if (languageCookie)
  {
    if (req.params.lang !== languageCookie)
    {
      const newUrl = req.originalUrl.replace("/"+req.params.lang+"/", "/"+languageCookie+"/");
      return res.redirect(newUrl);
    }
  }
  //Si aucun cookie, on trouve la langue depuis le language header
  else
  {
    //const supportedLanguages = supportedLanguages; // Langues supportées
    const accept = accepts(req);
    const bestLang = accept.language(supportedLanguages) || 'en'; // anglais par défaut
    if (req.params.lang !== bestLang)
      {
        const newUrl = req.originalUrl.replace("/"+req.params.lang+"/", "/"+bestLang+"/");
        return res.redirect(newUrl);
      }
  }
  const lang = req.params.lang;
  if (supportedLanguages.includes(lang)) {
    res.setLocale(lang);
    res.locals.lang = lang;
  } else {
    return res.status(404).send('Language not supported');
  }
  next();
});

//Auth middleware
app.use(async function(req, res, next) {
  var sessionid = req.cookies.session
  if (sessionid)
  {
    var session = await sessionRepository.getSessionData(sessionid)
      if (session)
        {
          res.locals.session = session
        }
  }
  next();
}
)


app.use('/', indexRouter);
app.use('/:lang/user', userRouter);
app.use('/:lang/selection', selectionRouter);
app.use('/:lang/langswitch', langswitchRouter);
app.use('/:lang/stats', statsRouter);



/* catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});
*/

//error handler
app.use(function(err, req, res, next) {
  if (err instanceof CustomError) {
    console.log("customError detected")
    res.status(err.status).json({ error: err.message });
  } else {
    console.log("other error detected")
    console.log(err)
  res.status(500).json({ error: 'Internal Server Error' });
}
});

module.exports = app;
