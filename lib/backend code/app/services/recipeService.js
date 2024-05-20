// app/services/recipeService.js

const { Recipe } = require('../models/Entities');

const createRecipe = async (recipeData) => {
  const recipe = new Recipe(recipeData);
  return await recipe.save();
};

const getAllRecipes = async () => {
  return await Recipe.find({});
};

const getRecipeByFirebaseId = async (firebaseId) => {
  return await Recipe.findOne({ ChefFirebaseID: firebaseId });
};

const updateRecipe = async (firebaseId, recipeData) => {
  return await Recipe.findOneAndUpdate({ ChefFirebaseID: firebaseId }, recipeData, { new: true, runValidators: true });
};

const deleteRecipe = async (firebaseId) => {
  const recipe = await Recipe.findOneAndDelete({ ChefFirebaseID: firebaseId });
  if (!recipe) {
    throw new Error('Recipe not found');
  }
  return recipe;
};

module.exports = {
  createRecipe,
  getAllRecipes,
  getRecipeByFirebaseId,
  updateRecipe,
  deleteRecipe
};