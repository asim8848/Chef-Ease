// app/controllers/reviewController.js

const reviewService = require('../services/reviewService');

exports.createReview = async (req, res, next) => {
  try {
    if (!req.body.ReviewID || !req.body.OrderID || !req.body.CustomerFirebaseID || !req.body.ChefFirebaseID || !req.body.Rating || !req.body.Time) {
      return res.status(400).json({ message: 'Missing required fields' });
    }
    const review = await reviewService.createReview(req.body);
    res.status(201).json(review);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.getAllReviews = async (req, res, next) => {
  try {
    const reviews = await reviewService.getAllReviews();
    res.json(reviews);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.getReview = async (req, res, next) => {
  try {
    const review = await reviewService.getReview(req.params.id);
    if (!review) {
      return res.status(404).json({ message: 'Review not found' });
    }
    res.json(review);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.updateReview = async (req, res, next) => {
  try {
    if (!req.body.ReviewID || !req.body.OrderID || !req.body.CustomerFirebaseID || !req.body.ChefFirebaseID || !req.body.Rating || !req.body.Time) {
      return res.status(400).json({ message: 'Missing required fields' });
    }
    const review = await reviewService.updateReview(req.params.id, req.body);
    if (!review) {
      return res.status(404).json({ message: 'Review not found' });
    }
    res.json(review);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.deleteReview = async (req, res, next) => {
  try {
    const review = await reviewService.deleteReview(req.params.id);
    if (!review) {
      return res.status(404).json({ message: 'Review not found' });
    }
    res.json(review);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

