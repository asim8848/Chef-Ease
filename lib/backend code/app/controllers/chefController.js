
// app/controllers/chefController.js git 2.1
const chefService = require('../services/chefService');
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
  const containerClient = blobServiceClient.getContainerClient('chef-images');

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
exports.uploadImageToAzure = uploadImageToAzure;

exports.createChef = async (req, res, next) => {
  try {
    // Validate request body
    if (!req.body.ChefFirebaseID || !req.body.Name || !req.body.Username || !req.body.Email) {
      return res.status(400).json({ message: 'Missing required fields' });
    }

    // Get the image file from the request
    const profileImage = req.file;

    // If the image file is provided in the request, upload it to Azure Blob Storage
    if (profileImage) {
      const profileImageURL = await uploadImageToAzure(profileImage, req.body.Username);
      req.body.ProfileImageURL = profileImageURL;
    }

    const chef = await chefService.createChef(req.body);
    res.status(201).json(chef);
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
};

exports.getChefByFirebaseId = async (req, res, next) => {
  try {
    const chef = await chefService.getChefByFirebaseId(req.params.firebaseId);
    if (!chef) {
      return res.status(404).json({ message: 'Chef not found' });
    }
    res.json(chef);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.updateChef = async (req, res, next) => {
  try {


    // Get the image file from the request
    const profileImage = req.file;

    // If the image file is provided in the request, upload it to Azure Blob Storage
    if (profileImage) {
      const profileImageURL = await uploadImageToAzure(profileImage, req.body.Username);
      req.body.ProfileImageURL = profileImageURL;
    }

    const chef = await chefService.updateChef(req.params.firebaseId, req.body);

    res.json(chef);
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
};

exports.deleteChef = async (req, res, next) => {
  try {
    const chef = await chefService.deleteChef(req.params.firebaseId);
    if (!chef) {
      return res.status(404).json({ message: 'Chef not found' });
    }
    res.json(chef);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.getAllChefs = async (req, res, next) => {
  try {
    const chefs = await chefService.getAllChefs();
    res.json(chefs);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};


/*
const chefService = require('../services/chefService');
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
  const containerClient = blobServiceClient.getContainerClient('chef-images');

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

exports.createChef = async (req, res, next) => {
  try {
    // Validate request body
    if (!req.body.ChefFirebaseID || !req.body.Name || !req.body.Username || !req.body.Email) {
      return res.status(400).json({ message: 'Missing required fields' });
    }

    // Get the image file from the request
    const profileImage = req.file;

    // If the image file is provided in the request, upload it to Azure Blob Storage
    if (profileImage) {
      const profileImageURL = await uploadImageToAzure(profileImage, req.body.Username);
      req.body.ProfileImageURL = profileImageURL;
    }

    const chef = await chefService.createChef(req.body);
    res.status(201).json(chef);
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
};

exports.getAllChefs = async (req, res, next) => {
  try {
    const chefs = await chefService.getAllChefs();
    res.json(chefs);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.getChef = async (req, res, next) => {
  try {
    const chef = await chefService.getChef(req.params.id);
    if (!chef) {
      return res.status(404).json({ message: 'Chef not found' });
    }
    res.json(chef);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.updateChef = async (req, res, next) => {
  try {
    // Validate request body
    if (!req.body.ChefFirebaseID || !req.body.Name || !req.body.Username || !req.body.Email) {
      return res.status(400).json({ message: 'Missing required fields' });
    }

    // Get the image file from the request
    const profileImage = req.file;

    // If the image file is provided in the request, upload it to Azure Blob Storage
    if (profileImage) {
      const profileImageURL = await uploadImageToAzure(profileImage, req.body.Username);
      req.body.ProfileImageURL = profileImageURL;
    }

    const chef = await chefService.updateChef(req.params.id, req.body);
    if (!chef) {
      return res.status(404).json({ message: 'Chef not found' });
    }
    res.json(chef);
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
};

exports.deleteChef = async (req, res, next) => {
  try {
    const chef = await chefService.getChef(req.params.id);
    if (!chef) {
      return res.status(404).json({ message: 'Chef not found' });
    }

    // Create a BlobServiceClient object
    const blobServiceClient = BlobServiceClient.fromConnectionString(AZURE_STORAGE_CONNECTION_STRING);

    // Get a reference to a container
    const containerClient = blobServiceClient.getContainerClient('chef-images');

    // Get the blob name from the chef's ProfileImageURL
    const blobName = chef.ProfileImageURL.split('/').pop();

    // Get a block blob client
    const blockBlobClient = containerClient.getBlockBlobClient(blobName);

    // Delete the blob
    await blockBlobClient.delete();

    const deletedChef = await chefService.deleteChef(req.params.id);
    res.json(deletedChef);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};*/
