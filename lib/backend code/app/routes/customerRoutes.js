// app/routes/customerRoutes.js
const express = require('express');
const customerController = require('../controllers/customerController');

const router = express.Router();

router.post('/', customerController.createCustomer);
router.get('/', customerController.getAllCustomers);
router.patch('/firebase/:firebaseId', customerController.updateCustomer);
router.get('/firebase/:firebaseId', customerController.getCustomerByFirebaseId);
router.delete('/firebase/:firebaseId', customerController.deleteCustomer);

module.exports = router;
/*
const express = require('express');
const customerController = require('../controllers/customerController');

const router = express.Router();

router.post('/', customerController.createCustomer);
router.get('/', customerController.getAllCustomers);
router.get('/:id', customerController.getCustomer);
router.put('/:id', customerController.updateCustomer);
router.get('/firebase/:firebaseId', customerController.getCustomerByFirebaseId);
router.delete('/:id', customerController.deleteCustomer);

module.exports = router;*/
