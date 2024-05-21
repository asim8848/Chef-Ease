// path to this file: app/routes/donationRoutes.js

const express = require('express');
const donationController = require('../controllers/donationController');

const router = express.Router();

router.post('/', donationController.createDonationRequest);
router.get('/', donationController.getAllDonationRequests);
router.get('/:id', donationController.getDonationRequest);
router.put('/:id', donationController.updateDonationRequest);
router.delete('/:id', donationController.deleteDonationRequest);
router.get('/:DonationRequestID', donationController.getDonationRequestByID);

module.exports = router;
