// app/services/favoriteService.js

const { Favorite } = require('../models/Entities');

const createFavorite = async (favoriteData) => {
  const favorite = new Favorite(favoriteData);
  return await favorite.save();
};

const getAllFavorites = async () => {
  return await Favorite.find({});
};

const getFavorite = async (id) => {
  const favorite = await Favorite.findById(id);
  if (!favorite) {
    throw new Error('No favorite found with this id');
  }
  return favorite;
};

const updateFavorite = async (id, favoriteData) => {
  const favorite = await Favorite.findByIdAndUpdate(id, favoriteData, { new: true });
  if (!favorite) {
    throw new Error('No favorite found with this id');
  }
  return favorite;
};

const deleteFavorite = async (id) => {
  const favorite = await Favorite.findByIdAndDelete(id);
  if (!favorite) {
    throw new Error('No favorite found with this id');
  }
  return null;
};

module.exports = {
  createFavorite,
  getAllFavorites,
  getFavorite,
  updateFavorite,
  deleteFavorite
};