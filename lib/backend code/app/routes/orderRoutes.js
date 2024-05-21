// app/routes/orderRoutes.js

const express = require('express');
const orderController = require('../controllers/orderController');

const router = express.Router();

router.post('/', orderController.createOrder);
router.get('/', orderController.getAllOrders);
router.get('/:id', orderController.getOrder);
router.patch('/:id', orderController.updateOrder);
router.delete('/:id', orderController.deleteOrder);
router.get('/customer/:customerId', orderController.getOrdersByCustomer);
router.get('/chef/:chefId', orderController.getOrdersByChef);

module.exports = router;