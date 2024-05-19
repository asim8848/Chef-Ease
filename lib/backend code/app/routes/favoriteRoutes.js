// app/routes/favoriteRoutes.js

const express = require('express');
const favoriteController = require('../controllers/favoriteController');

const router = express.Router();

router.post('/', favoriteController.createFavorite);
router.get('/', favoriteController.getAllFavorites);
router.get('/:id', favoriteController.getFavorite);
router.put('/:id', favoriteController.updateFavorite);
router.delete('/:id', favoriteController.deleteFavorite);

module.exports = router;