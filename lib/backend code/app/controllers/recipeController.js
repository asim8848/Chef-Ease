// app/controllers/recipeController.js

const recipeService = require('../services/recipeService');
const { BlobServiceClient } = require('@azure/storage-blob');
const multer = require('multer');
const upload = multer({ dest: 'uploads/' });
const fs = require('fs');

const AZURE_STORAGE_CONNECTION_STRING = process.env.AZURE_STORAGE_CONNECTION_STRING;

const uploadImageToAzure = async (imageFile, recipeId) => {
  const blobServiceClient = BlobServiceClient.fromConnectionString(AZURE_STORAGE_CONNECTION_STRING);
  const containerClient = blobServiceClient.getContainerClient('recipe-images');
  const blobName = `${recipeId}-recipeimage.${imageFile.originalname.split('.').pop()}`;
  const blockBlobClient = containerClient.getBlockBlobClient(blobName);
  const uploadBlobResponse = await blockBlobClient.uploadFile(imageFile.path);

  if (!uploadBlobResponse._response.status === 201) {
    throw new Error('Image upload failed');
  }

  fs.unlink(imageFile.path, (err) => {
    if (err) {
      console.error('Error deleting local file:', err);
    }
  });

  return blockBlobClient.url;
};

exports.createRecipe = async (req, res, next) => {
  try {
    const recipeImage = req.file;

    if (recipeImage) {
      const recipeImageURL = await uploadImageToAzure(recipeImage, req.body.RecipeID);
      req.body.RecipeImageURL = recipeImageURL;
    }

    const recipe = await recipeService.createRecipe(req.body);
    res.status(201).json(recipe);
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
};

exports.getRecipesByChefId = async (req, res, next) => {
  try {
    const recipes = await recipeService.getRecipesByChefId(req.params.chefId);
    res.json(recipes);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.getAllRecipes = async (req, res, next) => {
  try {
    const recipes = await recipeService.getAllRecipes();
    res.json(recipes);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.getRecipeByFirebaseId = async (req, res, next) => {
  try {
    const recipe = await recipeService.getRecipeByFirebaseId(req.params.firebaseId);
    if (!recipe) {
      return res.status(404).json({ message: 'Recipe not found' });
    }
    res.json(recipe);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.getRecipeByRecipeId = async (req, res, next) => {
  try {
    const recipe = await recipeService.getRecipeByRecipeId(req.params.recipeId);
    if (!recipe) {
      return res.status(404).json({ message: 'Recipe not found' });
    }
    res.json(recipe);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.updateRecipe = async (req, res, next) => {
  try {
    const recipeImage = req.file;

    if (recipeImage) {
      const recipeImageURL = await uploadImageToAzure(recipeImage, req.body.RecipeID);
      req.body.RecipeImageURL = recipeImageURL;
    }

    const recipe = await recipeService.updateRecipe(req.params.firebaseId, req.body);
    res.json(recipe);
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
};

exports.deleteRecipe = async (req, res, next) => {
  try {
    const recipe = await recipeService.deleteRecipe(req.params.firebaseId);
    if (!recipe) {
      return res.status(404).json({ message: 'Recipe not found' });
    }
    res.json(recipe);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};
