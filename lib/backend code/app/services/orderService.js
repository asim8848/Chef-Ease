// app/services/orderService.js

const { Order } = require('../models/Entities');

async function createOrder(orderData) {
  console.log('Input OrderID:', orderData.OrderID); // Log the input OrderID
  const order = new Order(orderData);
  const savedOrder = await order.save();
  console.log('Saved OrderID:', savedOrder.OrderID); // Log the saved OrderID
  return savedOrder;
}

const getAllOrders = async () => {
  return await Order.find({});
};

const getOrder = async (id) => {
  const order = await Order.findById(id);
  if (!order) {
    throw new Error('Order not found');
  }
  return order;
};

const updateOrder = async (id, orderData) => {
  const order = await Order.findById(id);
  if (!order) {
    throw new Error('Order not found');
  }
  Object.assign(order, orderData);
  return await order.save();
};

const deleteOrder = async (id) => {
  const order = await Order.findByIdAndDelete(id);
  if (!order) {
    throw new Error('No order found with this id');
  }
  return null;
};

module.exports = {
  createOrder,
  getAllOrders,
  getOrder,
  updateOrder,
  deleteOrder
};