// path to this file: app/services/donationService.js

const { DonationRequest } = require('../models/Entities');

async function createDonationRequest(donationData) {
  const donationRequest = new DonationRequest(donationData);
  return await donationRequest.save();
}

const getAllDonationRequests = async () => {
  return await DonationRequest.find({});
};
const getDonationRequestByID = async (DonationRequestID) => {
  const donationRequest = await DonationRequest.findOne({ DonationRequestID: DonationRequestID });
  if (!donationRequest) {
    throw new Error('Donation request not found');
  }
  return donationRequest;
};
const getDonationRequest = async (id) => {
  const donationRequest = await DonationRequest.findById(id);
  if (!donationRequest) {
    throw new Error('Donation request not found');
  }
  return donationRequest;
};

const updateDonationRequest = async (id, donationData) => {
  const donationRequest = await DonationRequest.findById(id);
  if (!donationRequest) {
    throw new Error('Donation request not found');
  }
  Object.assign(donationRequest, donationData);
  return await donationRequest.save();
};

const deleteDonationRequest = async (id) => {
  const donationRequest = await DonationRequest.findByIdAndDelete(id);
  if (!donationRequest) {
    throw new Error('No donation request found with this id');
  }
  return null;
};

module.exports = {
  createDonationRequest,
  getAllDonationRequests,
  getDonationRequest,
  getDonationRequestByID,
  updateDonationRequest,
  deleteDonationRequest
};
