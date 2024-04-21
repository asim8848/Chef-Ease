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

    return MaterialApp(
      home: Scaffold(
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
        body: Column(
          children: [
            SizedBox(
              height: Responsive.screenHeight(context) * 0.01,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: pizzaImages.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Menu()),
                    );
                  },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: Responsive.screenWidth(context) * 0.02,
                                right: Responsive.screenWidth(context) * 0.02,
                              ),
                              child: Container(
                                width: Responsive.screenWidth(context) * 0.95,
                                height: Responsive.screenHeight(context) * 0.25,
                                decoration: ShapeDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(pizzaImages[index]),
                                    fit: BoxFit.fill,
                                  ),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(22),
                                      topRight: Radius.circular(22),
                                    ),
                                  ),
                                ),
                              ),
                            ),
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
                              top: Responsive.screenHeight(context) * 0.165,
                              right: Responsive.screenWidth(context) * 0.05,
                              child: Container(
                                width: Responsive.screenWidth(context) * 0.25,
                                height: Responsive.screenHeight(context) * 0.035,
                                decoration: ShapeDecoration(
                                  color: AppColors.primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: Responsive.screenHeight(context) * 0.009,
                                    left: Responsive.screenHeight(context) * 0.020,
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
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            width: 385,
                            height: 95,
                            color: Colors.white,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20, top: 15),
                                  child: Container(
                                    width: 40,
                                    height: 41,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/imgs/person1circle.png"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                const Positioned(
                                  left: 70,
                                  top: 15,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                const Positioned(
                                  right: 16,
                                  top: 15,
                                  child: Column(
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
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
