// app/controllers/customerController.js
const customerService = require('../services/customerService');
const { BlobServiceClient } = require('@azure/storage-blob');
const multer = require('multer');
const upload = multer({ dest: 'uploads/' });
const fs = require('fs');

const AZURE_STORAGE_CONNECTION_STRING = process.env.AZURE_STORAGE_CONNECTION_STRING;

const uploadImageToAzure = async (imageFile, username) => {
  const blobServiceClient = BlobServiceClient.fromConnectionString(AZURE_STORAGE_CONNECTION_STRING);
  const containerClient = blobServiceClient.getContainerClient('customer-images');
  const blobName = `${username}-profilepic.${imageFile.originalname.split('.').pop()}`;
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

exports.createCustomer = async (req, res, next) => {
  try {
    const profileImage = req.file;
    if (profileImage) {
      const profileImageURL = await uploadImageToAzure(profileImage, req.body.Username);
      req.body.ProfileImageURL = profileImageURL;
    }
    const customer = await customerService.createCustomer(req.body);
    res.status(201).json(customer);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.updateCustomer = async (req, res, next) => {
  try {
    const profileImage = req.file;
    if (profileImage) {
      const profileImageURL = await uploadImageToAzure(profileImage, req.body.Username);
      req.body.ProfileImageURL = profileImageURL;
    }
    const customer = await customerService.updateCustomer(req.params.firebaseId, req.body);
    res.json(customer);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.getCustomerByFirebaseId = async (req, res, next) => {
  try {
    const customer = await customerService.getCustomerByFirebaseId(req.params.firebaseId);
    res.json(customer);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.getAllCustomers = async (req, res, next) => {
  try {
    const customers = await customerService.getAllCustomers();
    res.json(customers);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.deleteCustomer = async (req, res, next) => {
  try {
    const customer = await customerService.deleteCustomer(req.params.firebaseId);
    res.json(customer);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};


/*
const customerService = require('../services/customerService');
const { BlobServiceClient } = require('@azure/storage-blob');
const multer = require('multer');
const upload = multer({ dest: 'uploads/' });
const fs = require('fs');

const AZURE_STORAGE_CONNECTION_STRING = process.env.AZURE_STORAGE_CONNECTION_STRING;

// Function to upload image to Azure Blob Storage and return the URL
const uploadImageToAzure = async (imageFile, username) => {
  // Create a BlobServiceClient object
  const blobServiceClient = BlobServiceClient.fromConnectionString(AZURE_STORAGE_CONNECTION_STRING);

  // Get a reference to a container
  const containerClient = blobServiceClient.getContainerClient('customer-images');

  // Append the username to the image filename
  const blobName = `${username}-profilepic.${imageFile.originalname.split('.').pop()}`;

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

exports.createCustomer = async (req, res, next) => {
  try {
    // Get the image file from the request
    const profileImage = req.file;

    // If the image file is provided in the request, upload it to Azure Blob Storage
    if (profileImage) {
      const profileImageURL = await uploadImageToAzure(profileImage, req.body.Username);
      req.body.ProfileImageURL = profileImageURL;
    }

    const customer = await customerService.createCustomer(req.body);
    res.status(201).json(customer);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.updateCustomer = async (req, res, next) => {
  try {
    // Get the image file from the request
    const profileImage = req.file;

    // If the image file is provided in the request, upload it to Azure Blob Storage
    if (profileImage) {
      const profileImageURL = await uploadImageToAzure(profileImage, req.body.Username);
      req.body.ProfileImageURL = profileImageURL;
    }

    const customer = await customerService.updateCustomer(req.params.id, req.body);
    res.json(customer);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.getCustomerByFirebaseId = async (req, res, next) => {
  try {
    const customer = await customerService.getCustomerByFirebaseId(req.params.firebaseId);
    res.json(customer);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.getAllCustomers = async (req, res, next) => {
  try {
    const customers = await customerService.getAllCustomers();
    res.json(customers);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.getCustomer = async (req, res, next) => {
  try {
    const customer = await customerService.getCustomer(req.params.id);
    res.json(customer);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};


exports.deleteCustomer = async (req, res, next) => {
  try {
    const customer = await customerService.deleteCustomer(req.params.id);
    res.json(customer);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.placeOrder = async (req, res, next) => {
  try {
    // Get the Firebase User ID and recipe ID from the request
    const { firebaseUserId, recipeId } = req.body;

    // Authenticate the user
    const customer = await customerService.getCustomerByFirebaseId(firebaseUserId);
    if (!customer) {
      return res.status(403).json({ message: 'Authentication failed' });
    }

    // Get the recipe
    const recipe = await Recipe.findById(recipeId);
    if (!recipe) {
      return res.status(404).json({ message: 'Recipe not found' });
    }

    // Authorize the user
    if (customer.CustomerFirebaseID !== firebaseUserId) {
      return res.status(403).json({ message: 'Authorization failed' });
    }

    // If authentication and authorization succeed, place the order
    const newOrder = new Order({
      CustomerFirebaseID: firebaseUserId,
      RecipeID: recipeId,
      // Add other necessary fields for an order
    });
    const savedOrder = await newOrder.save();
    res.json(savedOrder);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};*/
