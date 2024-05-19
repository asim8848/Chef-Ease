// app/services/customerService.js

const { Customer } = require('../models/Entities');

const createCustomer = async (customerData) => {
  const existingCustomer = await Customer.findOne({ Email: customerData.Email });
  if (existingCustomer) {
    throw new Error('A customer with this email already exists');
  }
  const existingCustomerByUsername = await Customer.findOne({ Username: customerData.Username });
  if (existingCustomerByUsername) {
    throw new Error('A customer with this username already exists');
  }
  const customer = new Customer(customerData);
  return await customer.save();
};

const getCustomerByFirebaseId = async (firebaseId) => {
  const customer = await Customer.findOne({ CustomerFirebaseID: firebaseId });
  if (!customer) {
    throw new Error('No customer found with this Firebase ID');
  }
  return customer;
};

const getAllCustomers = async () => {
  return await Customer.find({});
};

const updateCustomer = async (firebaseId, customerData) => {
  console.log('Updating customer with Firebase ID:', firebaseId);
  const customer = await Customer.findOneAndUpdate({ CustomerFirebaseID: firebaseId }, customerData, { new: true, runValidators: true });
  console.log('Update result:', customer);
  if (!customer) {
    throw new Error('No customer found with this Firebase ID');
  }
  return customer;
};

const deleteCustomer = async (firebaseId) => {
  const customer = await Customer.findOneAndDelete({ CustomerFirebaseID: firebaseId });
  if (!customer) {
    throw new Error('No customer found with this Firebase ID');
  }
  return null;
};

module.exports = { createCustomer, getAllCustomers, getCustomerByFirebaseId, updateCustomer, deleteCustomer };


/*
const { Customer } = require('../models/Entities');





const createCustomer = async (customerData) => {
  const existingCustomer = await Customer.findOne({ Email: customerData.Email });
  if (existingCustomer) {
    throw new Error('A customer with this email already exists');
  }
  const existingCustomerByUsername = await Customer.findOne({ Username: customerData.Username });
    if (existingCustomerByUsername) {
      throw new Error('A customer with this username already exists');
    }
  const customer = new Customer(customerData);
  return await customer.save();
};

const getCustomerByFirebaseId = async (firebaseId) => {
  const customer = await Customer.findOne({ CustomerFirebaseID: firebaseId });
  if (!customer) {
    throw new Error('No customer found with this Firebase ID');
  }
  return customer;
};


const getCustomer = async (id) => {
  const customer = await Customer.findById(id);
  if (!customer) {
    throw new Error('No customer found with this id');
  }
  return customer;
};

const getAllCustomers = async () => {
  return await Customer.find({});
};

const updateCustomer = async (id, customerData) => {
  const customer = await Customer.findByIdAndUpdate(id, customerData, { new: true });
  if (!customer) {
    throw new Error('No customer found with this id');
  }
  return customer;
};

const deleteCustomer = async (id) => {
  const customer = await Customer.findByIdAndDelete(id);
  if (!customer) {
    throw new Error('No customer found with this id');
  }
  return null;
};

module.exports = {
  createCustomer,
  getAllCustomers,
  getCustomer,
  updateCustomer,
  deleteCustomer,
  getCustomerByFirebaseId
};*/
