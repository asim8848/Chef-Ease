// path of this file: lib/screens/customer/food_order/OrderHistory.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../api/chef_api.dart';
import '../../../api/order_api.dart';
import '../../../api/recipe_api.dart';
import '../../../constants/responsive.dart';
import '../../chef/tabs/ChefMenuTab.dart';
import 'OrderDetailsScreen.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  late Future<List<dynamic>> ordersFuture;

  @override
  void initState() {
    super.initState();
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser == null) {
      ordersFuture = Future.error('Please log in first.');
    } else {
      String customerFirebaseId = firebaseUser.uid;
      ordersFuture = OrderApi().fetchOrdersByCustomer(customerFirebaseId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: ordersFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No orders yet.'));
        } else {
          final orders = snapshot.data!;
          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              return FutureBuilder<List<Map<String, dynamic>>>(
                future: Future.wait([
                  ChefApi().getChef(order['ChefFirebaseID']),
                  RecipeApi().fetchRecipeDetails(order['RecipeID']),
                ]),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    final chef = snapshot.data![0];
                    final recipe = snapshot.data![1];
                    return FoodItemCard(
                      imageUrl: recipe['RecipeImageURL'],
                      name: recipe['Title'],
                      chefImage: chef['ProfileImageURL'],
                      chefName: chef['Name'],
                      date: order['OrderTime'],
                      price: 'RS. ${order['TotalPrice'].toStringAsFixed(2)}',
                      recipeId: order['RecipeID'],
                    );
                  }
                },
              );
            },
          );
        }
      },
    );
  }
}

class FoodItem {
  final String imageUrl;
  final String name;
  final String chefImage; // Added chefImage
  final String chefName; // Added chefName
  final String date; // Changed from price to date
  final String price; // Added price

  const FoodItem({
    required this.imageUrl,
    required this.name,
    required this.chefImage,
    required this.chefName,
    required this.date,
    required this.price,
  });
}

class FoodItemCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String chefImage; // Added chefImage
  final String chefName; // Added chefName
  final String date; // Changed from price to date
  final String price; // Added price
  final String recipeId; // Added recipeId

  const FoodItemCard({
    required this.imageUrl,
    required this.name,
    required this.chefImage,
    required this.chefName,
    required this.date,
    required this.price,
    required this.recipeId, // Added recipeId
  });

  @override
  Widget build(BuildContext context) {
    double _screenheight = Responsive.screenHeight(context);
    double _screenwidth = Responsive.screenWidth(context);
    return Container(
      width: _screenwidth * 0.8875, // 88.75% of screen width
      height: _screenheight * 0.2375, // 23.75% of screen height
      margin: EdgeInsets.symmetric(
          vertical: _screenheight * 0.00625,
          horizontal: _screenwidth *
              0.05), // 0.625% of screen height and 5% of screen width
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
            _screenwidth * 0.0225), // 2.25% of screen width
        boxShadow: [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: _screenwidth * 0.0275, // 2.75% of screen width
            offset: Offset(0, _screenheight * 0.0025), // 0.25% of screen height
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: _screenwidth * 0.05), // 5% of screen width
                child: Container(
                  width: _screenwidth * 0.25, // 25% of screen width
                  height: _screenheight * 0.13125, // 13.125% of screen height
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(
                        _screenwidth * 0.0225), // 2.25% of screen width
                  ),
                ),
              ),
              SizedBox(width: _screenwidth * 0.0375), // 3.75% of screen width
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top:
                              _screenheight * 0.0125), // 1.25% of screen height
                      child: Text(
                        name,
                        style: TextStyle(
                          color: Color(0xFF222222),
                          fontSize: _screenwidth * 0.04, // 4% of screen width
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                        height:
                            _screenheight * 0.0125), // 1.25% of screen height
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(chefImage),
                          radius: _screenwidth * 0.03, // 3% of screen width
                        ),
                        SizedBox(
                            width:
                                _screenwidth * 0.0125), // 1.25% of screen width
                        Text(
                          chefName,
                          style: TextStyle(
                            color: Color(0xFF666666),
                            fontSize: _screenwidth * 0.03, // 3% of screen width
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                        height: _screenheight * 0.025), // 2.5% of screen height
                    Row(
                      children: [
                        Text(
                          DateFormat('yyyy-MM-dd').format(DateTime.parse(date)),
                          style: TextStyle(
                            color: Color(0xFF666666),
                            fontSize: _screenwidth * 0.03, // 3% of screen width
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(
                            width:
                                _screenwidth * 0.099), // 18.75% of screen width
                        Text(
                          price, // Display price
                          style: TextStyle(
                            color: Colors.deepOrange, // Orange color
                            fontSize:
                                _screenwidth * 0.035, // 3.5% of screen width
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                        height: _screenheight * 0.025), // 2.5% of screen height
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: _screenheight * 0.00625), // 0.625% of screen height
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: _screenwidth * 0.05), // 5% of screen width
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderDetails(
                        recipeId:
                            recipeId), // Pass the recipeId to the OrderDetails screen
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFF6A42),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      _screenwidth * 0.0125), // 1.25% of screen width
                ),
              ),
              child: Container(
                width: double.infinity,
                height: _screenheight * 0.0375, // 3.75% of screen height
                alignment: Alignment.center,
                child: Text(
                  'Reorder Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: _screenwidth * 0.035, // 3.5% of screen width
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
