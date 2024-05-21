// app/routes/recipeRoutes.js

const express = require('express');
const recipeController = require('../controllers/recipeController');
const multer = require('multer');
const upload = multer({ dest: 'uploads/' });
const router = express.Router();

router.post('/', upload.single('RecipeImageURL'), recipeController.createRecipe);
router.get('/', recipeController.getAllRecipes);
router.get('/firebase/:firebaseId', recipeController.getRecipeByFirebaseId);
router.get('/chef/:chefId', recipeController.getRecipesByChefId);
router.get('/:recipeId', recipeController.getRecipeByRecipeId); // Added this line
router.patch('/firebase/:firebaseId', upload.single('RecipeImageURL'), recipeController.updateRecipe);
router.delete('/firebase/:firebaseId', recipeController.deleteRecipe);

module.exports = router;
