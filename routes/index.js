var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  //Authorisation d'acceder à l'index
  var session = res.locals.session
  console.log("-- session"+session)
  if (session && (session.role === 1 || session.role === 2))
  {
    return res.render('index');
  }
  res.send('Unauthorized')
});

/* GET home page. */
router.get('/:lang/test', function(req, res, next) {
      res.locals.supertest = "test";
      res.render('langtest');
});

module.exports = router;