var express = require('express');
var router = express.Router();
const cotaService = require("../service/cotaService");

/* Redirection*/
router.get('/list/:orgaid', async function (req, res, next) {
    try {
        res.render("cota");
    }
    catch (e) {
        next(e);
    }
});

// Function to filter data based on searches
function search(data, searches) {
    return data.filter(item => {
        return Object.keys(searches).every(key => {
            if (searches[key] === "") {
                // If the search term is an empty string, don't filter by this field
                return true;
            }
            // If the field exists in the data and matches the search term, filter it
            return item[key] && item[key].toLowerCase().includes(searches[key].toLowerCase());
        });
    });
  }
  router.get('/getcotadata', async (req, res) => {
    try{
    const limit = 20;
    const page = req.query.page
    const offset = (page  - 1) * limit;
    // Step 1: Obtention des données
    const data = await cotaService.getAllCotaData();
    // Step 2: Application des recherches
    const searches = req.query.searches
    let filteredData = data;
    if(searches)
    {
      filteredData = search(data, searches);
    }
    // Step 3: Application des filtres
    // Step 4: Pagination
    const paginatedData = filteredData.slice(offset, offset + limit);
    //console.log(paginatedData)
    res.json(paginatedData);
    }
    catch(e)
    {
     console.log(e)
    }
  });
  router.get('/answers', async (req, res) => {
    try{
    const data = await cotaService.getTeamAnswers(req.query.vendorcode, req.query.purchasingorganisationcode);
    res.json(data);
    }
    catch(e)
    {
     console.log(e)
    }
  });
  router.post('/answer', async function (req, res, next) {
    try {
      // Step 1: TODO Vérification des parametres
      // Step 2: Ajouts de la data dans la base
      await cotaService.answer(req.body.vendorcode, req.body.purchasingorganisationcode, req.body.questioncode, req.body.answer);
      //res.redirect("/en/selection")
    }
    catch (e) {
      next(e)
    }
  });
  router.post('/comment', async function (req, res, next) {
    try {
      // Step 1: TODO Vérification des parametres
      // Step 2: Ajouts de la data dans la base
      await cotaService.comment(req.body.vendorcode, req.body.purchasingorganisationcode, req.body.questioncode, req.body.comment);
      //res.redirect("/en/selection")
    }
    catch (e) {
      next(e)
    }
  });
module.exports = router;