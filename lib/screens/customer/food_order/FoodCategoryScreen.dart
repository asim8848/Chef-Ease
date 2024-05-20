import 'package:flutter/material.dart';
import 'package:chefease/constants/colors.dart';
import 'package:chefease/constants/responsive.dart';
import 'package:chefease/widgets/text_styles.dart';

import 'KitchenMenuScreen.dart';

class PizzaCategory extends StatelessWidget {
  const PizzaCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> pizzaImages = [
      "assets/imgs/pizza1.png",
      "assets/imgs/pizza2.png",
      "assets/imgs/pizza3.png",
      // Add more pizza images as needed
    ];

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
      body: ListView.builder(
        itemCount: pizzaImages.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Menu()),
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
                        image: AssetImage(pizzaImages[index]),
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
                            height: Responsive.screenWidth(context) * 0.08,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: Responsive.screenWidth(context) * 0.05,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: Responsive.screenHeight(context) * 0.180,
                          right: Responsive.screenWidth(context) * 0.05,
                          child: Container(
                            width: Responsive.screenWidth(context) * 0.25,
                            height: Responsive.screenHeight(context) * 0.035,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: Responsive.screenHeight(context) * 0.009,
                                horizontal: Responsive.screenHeight(context) * 0.020,
                              ),
                              child: AppLiteText(
                                text: '1.2 KM Away',
                                fontSize: Responsive.screenWidth(context) * 0.025,
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
                                image: AssetImage("assets/imgs/person1circle.png"),
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
                                text: 'Homemade Italian Pizza',
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                              AppMainText(
                                text: 'by Anna’s Kitchen',
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
      ),
    );
  }
}
