// path of this file: lib/screens/customer/food_order/OrderHistory.dart
import 'package:flutter/material.dart';

import '../../../constants/responsive.dart';
import '../../chef/tabs/ChefMenuTab.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  final List<FoodItem> foodItems = [
    FoodItem(
      imageUrl:
          "https://images.unsplash.com/photo-1593504049359-74330189a345?q=80&w=2127&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      name: "Peperoni Special Pizza",
      chefImage:
          "https://images.unsplash.com/photo-1581299894007-aaa50297cf16?q=80&w=2187&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      chefName: "Anna’s Kitchen",
      date: "20-04-2024", // Changed from price to date
      price: "Price: \$15.00", // Added price
    ),
    FoodItem(
      imageUrl:
          "https://images.unsplash.com/photo-1593504049359-74330189a345?q=80&w=2127&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      name: "Peperoni Special Pizza",
      chefImage:
          "https://images.unsplash.com/photo-1581299894007-aaa50297cf16?q=80&w=2187&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      chefName: "Anna’s Kitchen",
      date: "20-04-2024", // Changed from price to date
      price: "Price: \$15.00", // Added price
    ),
    FoodItem(
      imageUrl:
          "https://images.unsplash.com/photo-1593504049359-74330189a345?q=80&w=2127&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      name: "Peperoni Special Pizza",
      chefImage:
          "https://images.unsplash.com/photo-1581299894007-aaa50297cf16?q=80&w=2187&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      chefName: "Anna’s Kitchen",
      date: "20-04-2024", // Changed from price to date
      price: "Price: \$15.00", // Added price
    ),
    FoodItem(
      imageUrl:
          "https://images.unsplash.com/photo-1593504049359-74330189a345?q=80&w=2127&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      name: "Peperoni Special Pizza",
      chefImage:
          "https://images.unsplash.com/photo-1581299894007-aaa50297cf16?q=80&w=2187&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      chefName: "Anna’s Kitchen",
      date: "20-04-2024", // Changed from price to date
      price: "Price: \$15.00", // Added price
    ),
    // Add more food items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: foodItems.length,
      itemBuilder: (context, index) {
        final foodItem = foodItems[index];
        return FoodItemCard(
          imageUrl: foodItem.imageUrl,
          name: foodItem.name,
          chefImage: foodItem.chefImage,
          chefName: foodItem.chefName,
          date: foodItem.date,
          price: foodItem.price, // Pass the price
        );
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

  const FoodItemCard({
    required this.imageUrl,
    required this.name,
    required this.chefImage,
    required this.chefName,
    required this.date,
    required this.price,
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
                          date,
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
                // Add onPressed functionality here
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
