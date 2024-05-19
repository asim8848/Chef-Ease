// app/controllers/recipeController.js

const recipeService = require('../services/recipeService');
const { BlobServiceClient } = require('@azure/storage-blob');
const multer = require('multer');
const upload = multer({ dest: 'uploads/' });
const fs = require('fs');

const AZURE_STORAGE_CONNECTION_STRING = process.env.AZURE_STORAGE_CONNECTION_STRING;

// Function to upload image to Azure Blob Storage and return the URL
const uploadImageToAzure = async (imageFile, recipeId) => {
  // Create a BlobServiceClient object
  const blobServiceClient = BlobServiceClient.fromConnectionString(AZURE_STORAGE_CONNECTION_STRING);

  // Get a reference to a container
  const containerClient = blobServiceClient.getContainerClient('recipe-images');

  // Append the recipeId to the image filename
  const blobName = `${recipeId}-recipeimage.${imageFile.originalname.split('.').pop()}`;

  // Get a block blob client
  const blockBlobClient = containerClient.getBlockBlobClient(blobName);

  // Upload data to the blob
  const uploadBlobResponse = await blockBlobClient.uploadFile(imageFile.path);

  // If the image upload fails, throw an error
  if (!uploadBlobResponse._response.status === 201) {
    throw new Error('Image upload failed');
  }

  // Delete the local file
  fs.unlink(imageFile.path, (err) => {
    if (err) {
      console.error('Error deleting local file:', err);
    }
  });

  // Return the URL of the uploaded image
  return blockBlobClient.url;
};

exports.createRecipe = async (req, res, next) => {
  try {
    // Get the image file from the request
    const recipeImage = req.file;

    // If the image file is provided in the request, upload it to Azure Blob Storage
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

exports.updateRecipe = async (req, res, next) => {
  try {
    // Get the image file from the request
    const recipeImage = req.file;

    // If the image file is provided in the request, upload it to Azure Blob Storage
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