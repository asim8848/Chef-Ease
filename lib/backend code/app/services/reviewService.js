// app/services/reviewService.js

const { Review } = require('../models/Entities');

const createReview = async (reviewData) => {
  const review = new Review(reviewData);
  return await review.save();
};

const getAllReviews = async () => {
  return await Review.find({});
};

const getReview = async (id) => {
  return await Review.findById(id);
};

const updateReview = async (id, reviewData) => {
  return await Review.findByIdAndUpdate(id, reviewData, { new: true });
};

async function deleteReview(reviewId) {
  const result = await Review.findByIdAndDelete(reviewId);
  return result ? null : new Error('Review not found');
}
module.exports = {
  createReview,
  getAllReviews,
  getReview,
  updateReview,
  deleteReview
};