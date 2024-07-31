var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
const {CustomError}= require('./error/CustomError');
var indexRouter = require('./routes/index');
var userRouter = require('./routes/user');
const db = require("./data/database.js");
const sessionRepository = require("./data/sessionRepository");
const i18n = require('i18n');
const accepts = require('accepts')

var app = express();

// Configuration de i18n : Package multilangue
i18n.configure({
  locales: ['en', 'fr'],
  directory: __dirname + '/locales',
  defaultLocale: 'en',
});

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');


app.use(i18n.init);


app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
//Définition de la langue
const setLanguage = function(req, res, next) {
  //Vérification de cookie de langue en premier
  var languageCookie = req.cookies.lang;
  if (languageCookie)
  {
    console.log(languageCookie)
    if (req.params.lang !== languageCookie)
    {
      const newUrl = req.originalUrl.replace("/"+req.params.lang+"/", "/"+languageCookie+"/");
      return res.redirect(newUrl);
    }
  }
  //Si aucun cookie, on trouve la langue depuis le language header
  else
  {
    const supportedLanguages = ['en', 'fr']; // Langues supportées
    const accept = accepts(req);
    const bestLang = accept.language(supportedLanguages) || 'en'; // anglais par défaut
    if (req.params.lang !== bestLang)
      {
        const newUrl = req.originalUrl.replace("/"+req.params.lang+"/", "/"+bestLang+"/");
        return res.redirect(newUrl);
      }
  }
  const lang = req.params.lang;
  if (['en', 'fr'].includes(lang)) {
    res.setLocale(lang);
  } else {
    return res.status(404).send('Language not supported');
  }
  next();
};
app.use('/:lang', setLanguage);
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
        console.log(res.locals.session)
  }
  next();
}
)

app.use('/:lang', indexRouter);
indexRouter.use('/user', userRouter);



/* catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});
*/

//error handler
app.use(function(err, req, res, next) {
  /*
  Default error handler
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
  */
 /* Other random way
  if (err.customError) {
    res.status(err.status).json({ error: err.message });
  } else {
    res.status(500).json({ error: 'Internal Server Error' });
  }
    */
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
