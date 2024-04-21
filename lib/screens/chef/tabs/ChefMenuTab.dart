import 'package:flutter/material.dart';

class UserProfileMenu extends StatefulWidget {
  const UserProfileMenu({Key? key}) : super(key: key);

  @override
  State<UserProfileMenu> createState() => _UserProfileMenuState();
}

class _UserProfileMenuState extends State<UserProfileMenu> {
  final List<FoodItem> foodItems = [
    FoodItem(
      imageUrl: "https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1200",
      name: "Chicken handi",
      description:
      "Yorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc",
      price: "Price: 1500",
    ),
    FoodItem(
      imageUrl: "https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&w=1200",
      name: "Chicken handi",
      description:
      "Yorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc",
      price: "Price: 1500",
    ),
    FoodItem(
      imageUrl: "https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1200",
      name: "Chicken handi",
      description:
      "Yorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc",
      price: "Price: 1500",
    ),
    FoodItem(
      imageUrl: "https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&w=1200",
      name: "Chicken handi",
      description:
      "Yorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc",
      price: "Price: 1500",
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
          description: foodItem.description,
          price: foodItem.price,
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
}

class FoodItemCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String description;
  final String price;

  const FoodItemCard({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.price,
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
                        width: 80,
                        height: 30,
                        alignment: Alignment.center,
                        child: Text(
                          'Order Now',
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
