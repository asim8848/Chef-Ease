// path of this file: lib/screens/customer/food_order/HomeOrderScreen.dart

import 'package:chefease/screens/customer/food_order/FoodCategoryScreen.dart';

import 'package:chefease/widgets/drawer/CustomerDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

import '../../../constants/colors.dart';
import '../../../constants/responsive.dart';
import '../../../widgets/text_styles.dart';

class homeOrder extends StatefulWidget {
  const homeOrder({super.key});

  @override
  State<homeOrder> createState() => _homeOrderState();
}

class _homeOrderState extends State<homeOrder> {
  List<String> names = [
    'Jack',
    'Emily',
    'Charlie',
    'Sophia',
    'Oliver',
    'Emma',
    'Harry',
    'Ava'
  ];
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final _advancedDrawerController = AdvancedDrawerController();
  int currentIndex = 0; // Index of the selected tab

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.favorite_rounded,
    Icons.settings_rounded,
    Icons.person_rounded,
    Icons.star_rounded, // Added new icon
  ];

  @override
  Widget build(BuildContext context) {
    double _screenheight = Responsive.screenHeight(context);
    double _screenwidth = Responsive.screenWidth(context);
    return AdvancedDrawer(
        controller: _advancedDrawerController,
        childDecoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        drawer: CustomerDrawerContent(),
        child: Scaffold(
            appBar: AppBar(
              centerTitle: false,
              automaticallyImplyLeading: false,
              backgroundColor: AppColors.primaryColor,
              leading: IconButton(
                onPressed: _handleMenuButtonPressed,
                icon: const Icon(Icons.menu),
                color: AppColors.secondaryColor,
              ),
              title: GestureDetector(
                child: Container(
                  child: const Row(
                    children: <Widget>[
                      Icon(Icons.location_searching,
                          color: AppColors.secondaryColor),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Select your location',
                        style: TextStyle(
                          color: AppColors.secondaryColor,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              actions: const [
                Icon(
                  Icons.favorite_border,
                  color: AppColors.secondaryColor,
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.shopping_cart_outlined,
                  color: AppColors.secondaryColor,
                ),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: _screenheight * 0.02),
                  Container(
                    width: _screenwidth * 0.9, // 90% of screen width
                    height: _screenheight * 0.22, // 30% of screen height
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: [
                        buildContainer(
                            "Find the best Chef \nin your town",
                            "10% Discount\non first order",
                            "assets/imgs/person.png"),
                        buildContainer(
                            "Find the best Chef \nin your town",
                            "10% Discount\non first order",
                            "assets/imgs/person.png"),
                        buildContainer(
                            "Find the best Chef \nin your town",
                            "10% Discount\non first order",
                            "assets/imgs/person.png"),
                      ],
                    ),
                  ),
                  SizedBox(height: _screenheight * 0.01), // 1% of screen height
                  buildDotsIndicator(),
                  SizedBox(height: _screenheight * 0.02), // 2% of screen height
                  const Padding(
                    padding: EdgeInsets.only(left: 20, top: 10),
                    child: Row(
                      children: [
                        AppMainText(
                          text: 'Popular Food',
                          fontSize: 20,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: _screenheight * 0.02),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 4,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 15,
                      children: [
                        foodItem(
                          context: context,
                          image: "assets/imgs/pizza.png",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PizzaCategory()),
                            );
                          },
                          title: 'Pizza',
                        ),
                        foodItem(
                          context: context,
                          image: "assets/imgs/burger2.png",
                          title: 'Burger',
                        ),
                        foodItem(
                          context: context,
                          image: "assets/imgs/chinese.png",
                          title: 'Chinese',
                        ),
                        foodItem(
                          context: context,
                          image: "assets/imgs/tea.png",
                          title: 'Shakes',
                        ),
                        foodItem(
                          context: context,
                          image: "assets/imgs/biryani.png",
                          title: 'Biryani',
                        ),
                        foodItem(
                          context: context,
                          image: "assets/imgs/burgerwithcoke.png",
                          title: 'Fast Food',
                        ),
                        foodItem(
                          context: context,
                          image: "assets/imgs/burger2.png",
                          title: 'Pasta',
                        ),
                        foodItem(
                          context: context,
                          image: "assets/imgs/burger2.png",
                          title: 'Halwa Puri',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: _screenheight * 0.02),
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20, top: 10),
                        child: AppMainText(
                          text: 'Top Chefs',
                          fontSize: 20,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 200),
                        child: AppLiteText(
                          text: 'See all',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: _screenheight * 0.01),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        8,
                        (index) => Container(
                          width: 120,
                          child: Column(
                            mainAxisSize:
                                MainAxisSize.min, // Restrict maximum size
                            children: [
                              Container(
                                width: 120,
                                height: 125,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/imgs/person${index % 4 + 1}.png"),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              AppLiteText(
                                text: names[index % names.length],
                                textAlign: TextAlign.center,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }

  Widget buildContainer(String title, String discount, String imagePath) {
    double _screenheight = Responsive.screenHeight(context);
    double _screenwidth = Responsive.screenWidth(context);
    return Container(
      width: _screenwidth * 0.9, // 90% of screen width
      height: _screenheight * 0.3, // 30% of screen height
      decoration: BoxDecoration(
        color: AppColors.primaryColor, // Change this to your desired color
        borderRadius: BorderRadius.circular(22),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: _screenwidth * 0.075, top: _screenheight * 0.04),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30, top: 95),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '10%',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      height: 0,
                    ),
                  ),
                  TextSpan(
                    text: ' Discount\non first order',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 200,
            top: 16,
            child: Container(
              width: _screenwidth * 0.4, // 40% of screen width
              height: _screenheight * 0.2, // 30% of screen height
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.contain,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(66.50),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDotsIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 8,
            width: _currentPage == index ? 30 : 10,
            decoration: BoxDecoration(
              color: _currentPage == index
                  ? const Color(0xFFFF6A42)
                  : Colors.grey.shade400,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
    );
  }

  Widget foodItem({
    required BuildContext context,
    required String image,
    required String title,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 51,
            height: 51,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
              ),
              color: const Color(0x0FFD6500),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          AppLiteText(
            text: title,
            fontSize: 13, // Choose the fontSize you want to keep
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}
