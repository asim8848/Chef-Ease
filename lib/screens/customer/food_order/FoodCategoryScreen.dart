// path of this file: lib/screens/customer/food_order/FoodCategoryScreen.dart
import 'package:flutter/material.dart';
import 'package:chefease/api/order_api.dart';
import 'package:chefease/constants/colors.dart';
import 'package:chefease/constants/responsive.dart';
import 'package:chefease/widgets/text_styles.dart';
import '../../../api/recipe_api.dart';
import 'KitchenMenuScreen.dart';
import 'OrderDetailsScreen.dart';

class PizzaCategory extends StatefulWidget {
  const PizzaCategory({Key? key}) : super(key: key);

  @override
  _PizzaCategoryState createState() => _PizzaCategoryState();
}

class _PizzaCategoryState extends State<PizzaCategory> {
  late Future<List<Map<String, dynamic>>> futurePizzas;

  @override
  void initState() {
    super.initState();
    futurePizzas = RecipeApi().fetchPizzas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppMainText(
              text: 'Pizza',
              fontSize: Responsive.screenWidth(context) * 0.065,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: futurePizzas,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No pizzas found.'));
          } else {
            final pizzas = snapshot.data!;
            return ListView.builder(
              itemCount: pizzas.length,
              itemBuilder: (context, index) {
                final pizza = pizzas[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            OrderDetails(recipeId: pizza['RecipeID']),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Responsive.screenWidth(context) * 0.03,
                      vertical: Responsive.screenHeight(context) * 0.01,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: Responsive.screenHeight(context) * 0.22,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(pizza['RecipeImageURL'] ??
                                  'https://via.placeholder.com/150'),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(22),
                              topRight: Radius.circular(22),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: Responsive.screenHeight(context) * 0.03,
                                right: Responsive.screenWidth(context) * 0.045,
                                child: Container(
                                  width: Responsive.screenWidth(context) * 0.08,
                                  height:
                                      Responsive.screenWidth(context) * 0.08,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                      size: Responsive.screenWidth(context) *
                                          0.05,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: Responsive.screenHeight(context) * 0.180,
                                right: Responsive.screenWidth(context) * 0.05,
                                child: Container(
                                  width: Responsive.screenWidth(context) * 0.25,
                                  height:
                                      Responsive.screenHeight(context) * 0.035,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical:
                                          Responsive.screenHeight(context) *
                                              0.009,
                                      horizontal:
                                          Responsive.screenHeight(context) *
                                              0.020,
                                    ),
                                    child: AppLiteText(
                                      text: '1.2 KM Away',
                                      fontSize:
                                          Responsive.screenWidth(context) *
                                              0.025,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 95,
                          color: Colors.white,
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(20),
                                child: Container(
                                  width: 40,
                                  height: 41,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: NetworkImage(pizza[
                                              'ChefProfileImageURL'] ??
                                          'https://via.placeholder.com/150'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AppMainText(
                                      text: pizza['Title'] ?? 'Unknown Pizza',
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    AppMainText(
                                      text:
                                          'by ${pizza['ChefName'] ?? 'Unknown Chef'}',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Color(0xFFFD9700),
                                          size: 20,
                                        ),
                                        SizedBox(width: 5),
                                        AppMainText(
                                          text: '5.0',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFFFD9700),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star_border_purple500_rounded,
                                          color: Color(0xFFFD9700),
                                          size: 20,
                                        ),
                                        SizedBox(width: 3),
                                        AppMainText(
                                          text: 'Top Rated',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
