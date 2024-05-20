// app/services/chefService.js

const { Chef } = require('../models/Entities');
const { uploadImageToAzure } = require('../controllers/chefController');
const createChef = async (chefData) => {
  // Validate email format
  const emailRegex = /^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$/;
  if (!emailRegex.test(chefData.Email)) {
    throw new Error('Invalid email format');
  }

  // Check if username is not empty
  if (!chefData.Username) {
    throw new Error('Username is required');
  }

  // Check if username already exists
  const existingChefByUsername = await Chef.findOne({ Username: chefData.Username });
  if (existingChefByUsername) {
    throw new Error('Username already exists');
  }

  // Check if email already exists
  const existingChefByEmail = await Chef.findOne({ Email: chefData.Email });
  if (existingChefByEmail) {
    throw new Error('Email already exists');
  }

  const chef = new Chef(chefData);
  return await chef.save();
};

const getChefByFirebaseId = async (firebaseId) => {
  return await Chef.findOne({ ChefFirebaseID: firebaseId });
};

const updateChef = async (firebaseId, chefData) => {
  // Validate email format if provided
  if (chefData.Email) {
    const emailRegex = /^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$/;
    if (!emailRegex.test(chefData.Email)) {
      throw new Error('Invalid email format');
    }
  }

  // Check if username is not empty if provided
  if (chefData.Username && !chefData.Username) {
    throw new Error('Username is required');
  }

  // Check if username already exists in other documents if provided
  if (chefData.Username) {
    const existingChefByUsername = await Chef.findOne({ Username: chefData.Username, ChefFirebaseID: { $ne: firebaseId } });
    if (existingChefByUsername) {
      throw new Error('Username already exists');
    }
  }

  // Check if email already exists in other documents if provided
  if (chefData.Email) {
    const existingChefByEmail = await Chef.findOne({ Email: chefData.Email, ChefFirebaseID: { $ne: firebaseId } });
    if (existingChefByEmail) {
      throw new Error('Email already exists');
    }
  }

  const chef = await Chef.findOneAndUpdate({ ChefFirebaseID: firebaseId }, chefData, { new: true,runValidators: true });
  if (!chef) {
    throw new Error('Chef not found');
  }
  return chef;
};

const deleteChef = async (firebaseId) => {
  const chef = await Chef.findOneAndDelete({ ChefFirebaseID: firebaseId });
  if (!chef) {
    throw new Error('Chef not found');
  }
  return chef;
};

const getAllChefs = async () => {
  return await Chef.find({});
};

module.exports = {
  createChef,
  getChefByFirebaseId,
  updateChef,
  getAllChefs,
  deleteChef
};




/*

const { Chef } = require('../models/Entities');

const createChef = async (chefData) => {
  // Validate email format
  const emailRegex = /^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$/;
  if (!emailRegex.test(chefData.Email)) {
    throw new Error('Invalid email format');
  }

  // Check if username is not empty
  if (!chefData.Username) {
    throw new Error('Username is required');
  }

  // Check if username already exists
  const existingChefByUsername = await Chef.findOne({ Username: chefData.Username });
  if (existingChefByUsername) {
    throw new Error('Username already exists');
  }

  // Check if email already exists
  const existingChefByEmail = await Chef.findOne({ Email: chefData.Email });
  if (existingChefByEmail) {
    throw new Error('Email already exists');
  }

  const chef = new Chef(chefData);
  return await chef.save();
};

const getAllChefs = async () => {
  return await Chef.find({});
};

const getChef = async (id) => {
  const chef = await Chef.findById(id);
  if (!chef) {
    throw new Error('Chef not found');
  }
  return chef;
};

const getChefByFirebaseId = async (firebaseId) => {
  return await Chef.findOne({ ChefFirebaseID: firebaseId });
};

// app/services/chefService.js

const updateChef = async (id, chefData) => {
  // Validate email format if provided
  if (chefData.Email) {
    const emailRegex = /^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$/;
    if (!emailRegex.test(chefData.Email)) {
      throw new Error('Invalid email format');
    }
  }

  // Check if username is not empty if provided
  if (chefData.Username && !chefData.Username) {
    throw new Error('Username is required');
  }

  // Check if username already exists in other documents if provided
  if (chefData.Username) {
    const existingChefByUsername = await Chef.findOne({ Username: chefData.Username, _id: { $ne: id } });
    if (existingChefByUsername) {
      throw new Error('Username already exists');
    }
  }

  // Check if email already exists in other documents if provided
  if (chefData.Email) {
    const existingChefByEmail = await Chef.findOne({ Email: chefData.Email, _id: { $ne: id } });
    if (existingChefByEmail && String(existingChefByEmail._id) !== String(id)) {
      throw new Error('Email already exists');
    }
  }

  const chef = await Chef.findByIdAndUpdate(id, chefData, { new: true });
  if (!chef) {
    throw new Error('Chef not found');
  }
  return chef;
};

const deleteChef = async (id) => {
  const chef = await Chef.findByIdAndDelete(id);
  if (!chef) {
    throw new Error('Chef not found');
  }
  return chef;
};

module.exports = {
  createChef,
  getAllChefs,
  getChef,
  updateChef,
  deleteChef,
  getChefByFirebaseId
};*/
