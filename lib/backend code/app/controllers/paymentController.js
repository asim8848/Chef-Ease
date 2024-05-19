// app/controllers/paymentController.js

const paymentService = require('../services/paymentService');

exports.createPayment = async (req, res, next) => {
  try {
    // Validate request body
    if (!req.body.PaymentID || !req.body.OrderID || !req.body.CustomerID || !req.body.PaymentMethod || !req.body.PaymentStatus || !req.body.Amount || !req.body.Timestamp) {
      return res.status(400).json({ message: 'Missing required fields' });
    }

    const payment = await paymentService.createPayment(req.body);
    res.status(201).json(payment);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.getAllPayments = async (req, res, next) => {
  try {
    const payments = await paymentService.getAllPayments();
    res.json(payments);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.getPayment = async (req, res, next) => {
  try {
    const payment = await paymentService.getPayment(req.params.id);
    if (!payment) {
      return res.status(404).json({ message: 'Payment not found' });
    }
    res.json(payment);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.updatePayment = async (req, res, next) => {
  try {
    // Validate request body
    if (!req.body.PaymentID || !req.body.OrderID || !req.body.CustomerID || !req.body.PaymentMethod || !req.body.PaymentStatus || !req.body.Amount || !req.body.Timestamp) {
      return res.status(400).json({ message: 'Missing required fields' });
    }

    const payment = await paymentService.updatePayment(req.params.id, req.body);
    if (!payment) {
      return res.status(404).json({ message: 'Payment not found' });
    }
    res.json(payment);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.deletePayment = async (req, res, next) => {
  try {
    const payment = await paymentService.deletePayment(req.params.id);
    if (!payment) {
      return res.status(404).json({ message: 'Payment not found' });
    }
    res.json(payment);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};