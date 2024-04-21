import 'package:flutter/material.dart';

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
      chefImage: "https://images.unsplash.com/photo-1581299894007-aaa50297cf16?q=80&w=2187&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      chefName: "Anna’s Kitchen",
      date: "20-04-2024", // Changed from price to date
      price: "Price: \$15.00", // Added price
    ),
    FoodItem(
      imageUrl:
      "https://images.unsplash.com/photo-1593504049359-74330189a345?q=80&w=2127&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      name: "Peperoni Special Pizza",
      chefImage: "https://images.unsplash.com/photo-1581299894007-aaa50297cf16?q=80&w=2187&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      chefName: "Anna’s Kitchen",
      date: "20-04-2024", // Changed from price to date
      price: "Price: \$15.00", // Added price
    ),
    FoodItem(
      imageUrl:
      "https://images.unsplash.com/photo-1593504049359-74330189a345?q=80&w=2127&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      name: "Peperoni Special Pizza",
      chefImage: "https://images.unsplash.com/photo-1581299894007-aaa50297cf16?q=80&w=2187&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      chefName: "Anna’s Kitchen",
      date: "20-04-2024", // Changed from price to date
      price: "Price: \$15.00", // Added price
    ),
    FoodItem(
      imageUrl:
      "https://images.unsplash.com/photo-1593504049359-74330189a345?q=80&w=2127&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      name: "Peperoni Special Pizza",
      chefImage: "https://images.unsplash.com/photo-1581299894007-aaa50297cf16?q=80&w=2187&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
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
    return Container(
      width: 355,
      height: 190,
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
        boxShadow: [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 11,
            offset: Offset(0, 2),
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
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  width: 100,
                  height: 105,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        name,
                        style: TextStyle(
                          color: Color(0xFF222222),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(chefImage),
                          radius: 12,
                        ),
                        SizedBox(width: 5),
                        Text(
                          chefName,
                          style: TextStyle(
                            color: Color(0xFF666666),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          date,
                          style: TextStyle(
                            color: Color(0xFF666666),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(width: 75), // Add spacing between date and price
                        Text(
                          price, // Display price
                          style: TextStyle(
                            color: Colors.deepOrange, // Orange color
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                // Add onPressed functionality here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFF6A42),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Container(
                width: double.infinity,
                height: 30,
                alignment: Alignment.center,
                child: Text(
                  'Reorder Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
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
