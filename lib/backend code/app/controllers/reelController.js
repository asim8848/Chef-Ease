// app/controllers/reelController.js

const reelService = require('../services/reelService');
const { BlobServiceClient } = require('@azure/storage-blob');
const fs = require('fs');
const AZURE_STORAGE_CONNECTION_STRING = process.env.AZURE_STORAGE_CONNECTION_STRING;

async function uploadMediaToAzure(mediaFile, reelId) {
  const blobServiceClient = BlobServiceClient.fromConnectionString(AZURE_STORAGE_CONNECTION_STRING);
  const containerClient = blobServiceClient.getContainerClient('reel-videos');
  const fileExtension = mediaFile.originalname.split('.').pop();
  const blobName = `${reelId}.${fileExtension}`;
  const blockBlobClient = containerClient.getBlockBlobClient(blobName);
  const uploadBlobResponse = await blockBlobClient.uploadFile(mediaFile.path);

  if (!uploadBlobResponse._response.status === 201) {
    throw new Error('Media upload failed');
  }

  fs.unlink(mediaFile.path, (err) => {
    if (err) {
      console.error('Error deleting local file:', err);
    }
  });

  return blockBlobClient.url;
}

exports.createReel = async (req, res, next) => {
  try {
    if (!req.body.ReelID || !req.body.ChefFirebaseID) {
      return res.status(400).json({ message: 'Missing required fields' });
    }

    const video = req.file;

    if (video) {
      const videoURL = await uploadMediaToAzure(video, req.body.ReelID);
      req.body.ReelURL = videoURL;
    }

    const reel = await reelService.createReel(req.body);
    res.status(201).json(reel);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.getAllReels = async (req, res, next) => {
  try {
    const reels = await reelService.getAllReels();
    res.json(reels);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.getReelByFirebaseId = async (req, res, next) => {
  try {
    const reel = await reelService.getReelByFirebaseId(req.params.firebaseId);
    if (!reel) {
      return res.status(404).json({ message: 'Reel not found' });
    }
    res.json(reel);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.updateReel = async (req, res, next) => {
  try {


    const video = req.file;

    if (video) {
      const videoURL = await uploadMediaToAzure(video, req.body.ReelID);
      req.body.ReelURL = videoURL;
    }

    const reel = await reelService.updateReel(req.params.firebaseId, req.body);
    if (!reel) {
      return res.status(404).json({ message: 'Reel not found' });
    }
    res.json(reel);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.deleteReel = async (req, res, next) => {
  try {
    const reel = await reelService.deleteReel(req.params.id);
    if (!reel) {
      return res.status(404).json({ message: 'Reel not found' });
    }
    res.json(reel);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};