import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../api/recipe_api.dart';
import '../chef_add_menu/AddRecipeScreen.dart';

class UserProfileMenu extends StatefulWidget {
  final String chefId;

  const UserProfileMenu({Key? key, required this.chefId}) : super(key: key);

  @override
  State<UserProfileMenu> createState() => _UserProfileMenuState();
}

class _UserProfileMenuState extends State<UserProfileMenu> {
  List<FoodItem> foodItems = [];

  @override
  void initState() {
    super.initState();
    _fetchChefData();
  }

  Future<void> _fetchChefData() async {
    // Use widget.chefId to fetch the chef's recipes from the API
    // Assume getChefRecipes is a method in your API class that fetches the recipes of a chef
    final recipes = await RecipeApi().getChefRecipes(widget.chefId);
    setState(() {
      foodItems = recipes.map((recipe) => FoodItem.fromMap(recipe)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: foodItems.length,
      itemBuilder: (context, index) {
        final foodItem = foodItems[index];
        return FoodItemCard(
          imageUrl: foodItem.imageUrl,
          name: foodItem.name,
          description: foodItem.description,
          price: foodItem.price,
          chefId: widget.chefId, // Add this line
        );
      },
    );
  }
}

class FoodItem {
  final String imageUrl;
  final String name;
  final String description;
  final String price;

  const FoodItem({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.price,
  });

  static FoodItem fromMap(Map<String, dynamic> map) {
    var imageUrl = map['RecipeImageURL'];
    if (imageUrl == null || !Uri.parse(imageUrl).isAbsolute) {
      imageUrl =
          ''; // Provide a default value if imageUrl is null or not a valid URL
    }

    return FoodItem(
      imageUrl: imageUrl,
      name: map['Title'] ?? '', // Use 'Title' property from the JSON
      description:
          map['Description'] ?? '', // Use 'Description' property from the JSON
      price: map['Price'].toString() ??
          '', // Use 'Price' property from the JSON and convert it to string
    );
  }
}

class FoodItemCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String description;
  final String price;
  final String chefId; // Add this line

  const FoodItemCard({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.price,
    required this.chefId, // And this line
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 355,
      height: 150,
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
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              width: 96,
              height: 111,
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
                SizedBox(height: 5),
                Text(
                  description,
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      price,
                      style: TextStyle(
                        color: Color(0xFF444444),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 50),
                    ElevatedButton(
                      onPressed: FirebaseAuth.instance.currentUser!.uid ==
                              chefId
                          ? () {
                              // Navigate to AddRecipeScreen.dart
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddRecipeScreen()),
                              );
                            }
                          : () {
                              // Add onPressed functionality here
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFF6A42),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Container(
                        width: 80,
                        height: 30,
                        alignment: Alignment.center,
                        child: Text(
                          FirebaseAuth.instance.currentUser!.uid == chefId
                              ? 'Update'
                              : 'Order',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
