// path to this file: app/controllers/donationController.js

const donationService = require('../services/donationService');

exports.createDonationRequest = async (req, res, next) => {
  try {
    const donationRequest = await donationService.createDonationRequest(req.body);
    res.status(201).json(donationRequest);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.getDonationRequestByID = async (req, res, next) => {
  try {
    const donationRequest = await donationService.getDonationRequestByID(req.params.DonationRequestID);
    res.json(donationRequest);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.getAllDonationRequests = async (req, res, next) => {
  try {
    const donationRequests = await donationService.getAllDonationRequests();
    res.json(donationRequests);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.getDonationRequest = async (req, res, next) => {
  try {
    const donationRequest = await donationService.getDonationRequest(req.params.id);
    res.json(donationRequest);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.updateDonationRequest = async (req, res, next) => {
  try {
    const donationRequest = await donationService.updateDonationRequest(req.params.id, req.body);
    res.json(donationRequest);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.deleteDonationRequest = async (req, res, next) => {
  try {
    const donationRequest = await donationService.deleteDonationRequest(req.params.id);
    res.json(donationRequest);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};
