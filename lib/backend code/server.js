// server.js

// Load environment variables from .env file
require('dotenv').config();

// Import necessary modules
const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const mongoSanitize = require('express-mongo-sanitize');
const multer = require('multer');
const chefController = require('./app/controllers/chefController'); // Import chef controller
const customerController = require('./app/controllers/customerController'); // Import customer controller
const recipeController = require('./app/controllers/recipeController'); // Import recipe controller
const reelController = require('./app/controllers/reelController'); // Import reel controller
const indexRoutes = require('./app/routes/index');
const chefRoutes = require('./app/routes/chefRoutes'); // Import chef routes
const customerRoutes = require('./app/routes/customerRoutes'); // Import customer routes
const reviewRoutes = require('./app/routes/reviewRoutes'); // Import review routes
const orderRoutes = require('./app/routes/orderRoutes'); // Import order routes
const recipeRoutes = require('./app/routes/recipeRoutes'); // Import recipe routes
const reelRoutes = require('./app/routes/reelRoutes'); // Import reel routes
const paymentRoutes = require('./app/routes/paymentRoutes'); // Import payment routes
const favoriteRoutes = require('./app/routes/favoriteRoutes'); // Import favorite routes

// Initialize express app
const app = express();

// Enable CORS
app.use(cors());

// Data sanitization against NoSQL query injection
app.use(mongoSanitize());


// Set up multer to store uploaded files in the 'images' directory
const uploadImages = multer({ dest: 'images/' });
const uploadVideos = multer({ dest: 'videos/' });

// Set port from environment variable or default to 3000
const port = process.env.PORT || 3001;

// Connect to MongoDB using the URI provided in the environment variable
mongoose.connect(process.env.MONGO_URI, {
  bufferCommands: false, // Disable mongoose buffering
  serverSelectionTimeoutMS: 5000, // Keep trying to send operations for 5 seconds
  socketTimeoutMS: 45000, // Close sockets after 45 seconds of inactivity
})
.then(() => {
  console.log('MongoDB connected...'); // Log successful connection

  // Enable detailed MongoDB debugging
  mongoose.set('debug', true);
  // Use express.json() middleware to parse JSON bodies
  app.use(express.json());



  // Use the multer middleware for the route that expects a file in the request
app.post('/chef', uploadImages.single('ProfileImageURL'), chefController.createChef);
app.post('/customer', uploadImages.single('ProfileImageURL'), customerController.createCustomer);
app.post('/reel', uploadVideos.single('ReelURL'), reelController.createReel);
app.post('/recipe', uploadImages.single('RecipeImageURL'), recipeController.createRecipe);
app.put('/recipe/:id', uploadImages.single('RecipeImageURL'), recipeController.updateRecipe);
  // Use the imported routes for any requests to the specified paths
  app.use('/', indexRoutes);
  app.use('/chef', chefRoutes); // Use the chef routes for any requests to '/chef'
  app.use('/customer', customerRoutes); // Use the customer routes for any requests to '/customer'
  app.use('/review', reviewRoutes); // Use the review routes for any requests to '/review'
  app.use('/order', orderRoutes); // Use the order routes for any requests to '/order'
  app.use('/recipe', recipeRoutes); // Use the recipe routes for any requests to '/recipe'
  app.use('/reel', reelRoutes); // Use the reel routes for any requests to '/reel'
  app.use('/payment', paymentRoutes); // Use the payment routes for any requests to '/payment'
  app.use('/favorite', favoriteRoutes); // Use the favorite routes for any requests to '/favorite'

  app.use((err, req, res, next) => {
    console.error(err.stack);
    res.status(500).send({ message: 'Something broke!' });
  });

  // Start the server on the specified port
  app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
  });
})
.catch(err => {

  console.log('Error connecting to MongoDB:', err.message); // Log any errors
});

// Handle MongoDB disconnection
mongoose.connection.on('disconnected', () => {
  console.log('MongoDB disconnected...');
});

// Handle MongoDB reconnection
mongoose.connection.on('reconnected', () => {
  console.log('MongoDB reconnected...');
});

// Handle app termination
process.on('SIGINT', function() {
  mongoose.connection.close(function () {
    console.log('Mongoose default connection disconnected through app termination');
    process.exit(0);
  });
});