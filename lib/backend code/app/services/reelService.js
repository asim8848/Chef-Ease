// app/services/reelService.js

const { Reel } = require('../models/Entities');

const createReel = async (reelData) => {
  const reel = new Reel(reelData);
  return await reel.save();
};

const getAllReels = async () => {
  return await Reel.find({});
};

const getReelByFirebaseId = async (firebaseId) => {
  return await Reel.findOne({ ChefFirebaseID: firebaseId });
};

const updateReel = async (firebaseId, reelData) => {
  return await Reel.findOneAndUpdate({ ChefFirebaseID: firebaseId }, reelData, { new: true });
};


async function deleteReel(reelId) {
  const result = await Reel.findByIdAndDelete(reelId);
  return result ? null : new Error('Reel not found');
}
module.exports = {
  createReel,
  getAllReels,
  getReelByFirebaseId,
  updateReel,
  deleteReel
};