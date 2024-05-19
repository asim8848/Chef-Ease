// app/controllers/favoriteController.js

const favoriteService = require('../services/favoriteService');
const { Recipe, Favorite } = require('../models/Entities');

exports.createFavorite = async (req, res, next) => {
  try {
    const favorite = await favoriteService.createFavorite(req.body);
    res.status(201).json(favorite);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.getAllFavorites = async (req, res, next) => {
  try {
    const favorites = await favoriteService.getAllFavorites();
    res.json(favorites);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.getFavorite = async (req, res, next) => {
  try {
    const favorite = await favoriteService.getFavorite(req.params.id);
    if (!favorite) {
      return res.status(404).json({ message: 'Favorite not found' });
    }
    res.json(favorite);
  } catch (error) {
    if (error.message === 'No favorite found with this id') {
      res.status(404).json({ message: error.message });
    } else {
      res.status(500).json({ message: error.message });
    }
  }
};

exports.updateFavorite = async (req, res, next) => {
  try {
    const favorite = await favoriteService.updateFavorite(req.params.id, req.body);
    if (!favorite) {
      return res.status(404).json({ message: 'Favorite not found' });
    }
    res.json(favorite);
  } catch (error) {
    if (error.message === 'No favorite found with this id') {
      res.status(404).json({ message: error.message });
    } else {
      res.status(500).json({ message: error.message });
    }
  }
};

exports.deleteFavorite = async (req, res, next) => {
  try {
    await favoriteService.deleteFavorite(req.params.id);
    res.json({ message: 'Favorite successfully deleted' });
  } catch (error) {
    if (error.message === 'No favorite found with this id') {
      res.status(404).json({ message: error.message });
    } else {
      res.status(500).json({ message: error.message });
    }
  }
};

exports.addFavorite = async (req, res, next) => {
  try {
    // Get the Firebase User ID and recipe ID from the request
    const { firebaseUserId, recipeId } = req.body;

    // Get the recipe
    const recipe = await Recipe.findById(recipeId);
    if (!recipe) {
      return res.status(404).json({ message: 'Recipe not found' });
    }

    // If the recipe exists, add it to favorites
    const newFavorite = new Favorite({
      UserID: firebaseUserId,
      RecipeID: recipeId,
      ChefID: recipe.FirebaseChefID
    });
    const savedFavorite = await newFavorite.save();
    res.json(savedFavorite);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};