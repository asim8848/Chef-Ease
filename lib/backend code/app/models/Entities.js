const mongoose = require('mongoose');

const ChefSchema = new mongoose.Schema({
  ChefFirebaseID: { type: String, required: true },
  Name: { type: String, required: true, trim: true, maxlength: 50 },
  Username: { type: String, required: true, trim: true, maxlength: 50 },
  Rating: { type: Number },
  Role: { type: String },
  Level: { type: String },
  Experience: { type: String },
  Email: { 
    type: String, 
    required: true, 
    unique: true, 
    trim: true, 
    lowercase: true, 
    match: [/\S+@\S+\.\S+/, 'is invalid'] 
  },
  ProfileImageURL: { type: String },
  PhoneNumber: { type: String },
  Address: { type: String },
  Location: { type: String },
  SkillsAndExpertise: { type: String },
  OrdersCompleted: { type: Number },
  PendingOrders: { type: Number },
  Availability: { type: String },
  Biography: { type: String },
  TotalEarnings: { type: Number },
  OrderSuccessRate: { type: Number },
  GoogleAccount: { type: String },
  FacebookAccount: { type: String }
});

const CustomerSchema = new mongoose.Schema({
  CustomerFirebaseID: { type: String, required: true },
  Name: { type: String, required: true, trim: true, maxlength: 50 },
  Username: { type: String, required: true, trim: true, maxlength: 50 },
  Email: { 
    type: String, 
    required: true, 
    unique: true, 
    trim: true, 
    lowercase: true, 
    match: [/\S+@\S+\.\S+/, 'is invalid'] 
  },
  PhoneNumber: { type: String },
  Role: { type: String },
  GoogleAccount: { type: String },
  FacebookAccount: { type: String },
  ProfileImageURL: { type: String }
});

const RecipeSchema = new mongoose.Schema({
  RecipeID: { type: String, required: true },
  Title: { type: String, required: true },
 RecipeImageURL: { type: String },
  Description: { type: String },
  Ingredients: { type: [String] },
  Size: { type: String },
  Price: { type: Number, required: true },
  ChefFirebaseID: { type: String, required: true },
  Variations: { type: String }
});

const OrderSchema = new mongoose.Schema({
  OrderID: { type: String, required: true },
  CustomerFirebaseID: { type: String, required: true },
  ChefFirebaseID: { type: String, required: true },
  RecipeID: { type: String, required: true },
  NumberOfItems: { type: Number, required: true },
  Address: { type: String, required: true },
  TotalPrice: { type: Number, required: true },
  OrderTime: { type: String, required: true },
  Status: { type: String, required: true },
  PaymentMethod: { type: String, required: true },
  ItemPerPrice: { type: Number, required: true },
  OrderAcceptedAt: { type: String },
  OrderCompletedAt: { type: String }
});

const ReviewSchema = new mongoose.Schema({
  ReviewID: { type: String, required: true },
  OrderID: { type: String, required: true },
  CustomerFirebaseID: { type: String, required: true },
  ChefFirebaseID: { type: String, required: true },
  Rating: { type: Number, required: true },
  Comment: { type: String },
  Time: { type: String, required: true }
});

const ReelSchema = new mongoose.Schema({
  ReelID: { type: String, required: true },
  ChefFirebaseID: { type: String, required: true },
  Description: { type: String },
  Location: { type: String },
  Likes: { type: Number },
  Comments: { type: Number },
  Shares: { type: Number },
  ReelURL: { type: String }
});

const PaymentSchema = new mongoose.Schema({
  PaymentID: { type: String, required: true },
  OrderID: { type: String, required: true },
  CustomerID: { type: String, required: true },
  PaymentMethod: { type: String, required: true },
  PaymentStatus: { type: String, required: true },
  Amount: { type: Number, required: true },
  Timestamp: { type: Date, required: true }
});

const FavoritesSchema = new mongoose.Schema({
  UserID: { type: String, required: true },
  RecipeID: { type: String, required: true },
  ChefID: { type: String, required: true }
});



const Chef = mongoose.model('Chef', ChefSchema);
const Customer = mongoose.model('Customer', CustomerSchema);
const Recipe = mongoose.model('Recipe', RecipeSchema);
const Order = mongoose.model('Order', OrderSchema);
const Review = mongoose.model('Review', ReviewSchema);
const Reel = mongoose.model('Reel', ReelSchema);
const Payment = mongoose.model('Payment', PaymentSchema);
const Favorite = mongoose.model('Favorite', FavoritesSchema);



module.exports = { Chef, Customer,Recipe,Order,Review,Reel,Payment,Favorite };