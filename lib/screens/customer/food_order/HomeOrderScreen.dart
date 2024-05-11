import 'package:chefease/screens/customer/food_order/FoodCategoryScreen.dart';
import 'package:chefease/widgets/drawer/UserDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

import '../../../constants/colors.dart';

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
    return AdvancedDrawer(
        controller: _advancedDrawerController,
        childDecoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        drawer: DrawerContent(),
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
                  const SizedBox(height: 18),
                  Container(
                    width: 352,
                    height: 180,
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
                  const SizedBox(height: 10),
                  buildDotsIndicator(),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, top: 10),
                    child: Row(
                      children: [
                        Text(
                          'Popular Food',
                          style: TextStyle(
                            color: Color(0xFF1E1E1E),
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w900,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PizzaCategory()),
                            );
                          },
                          child: Container(
                            width: 78,
                            height: 76,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage("assets/imgs/pizza.png")),
                                color: const Color(0x0FFD6500),
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            width: 78,
                            height: 76,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image:
                                        AssetImage("assets/imgs/burger2.png")),
                                color: const Color(0x0FFD6500),
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            width: 78,
                            height: 76,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image:
                                        AssetImage("assets/imgs/chinese.png")),
                                color: const Color(0x0FFD6500),
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            width: 78,
                            height: 76,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage("assets/imgs/tea.png")),
                                color: const Color(0x0FFD6500),
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 42, top: 8),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PizzaCategory()),
                            );
                          },
                          child: Text(
                            'Pizza',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 58, top: 8),
                        child: Text(
                          'Burger',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 52, top: 8),
                        child: Text(
                          'Chinese',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 45, top: 8),
                        child: Text(
                          'Shakes',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Container(
                          width: 78,
                          height: 76,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage("assets/imgs/biryani.png")),
                              color: const Color(0x0FFD6500),
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            width: 78,
                            height: 76,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage(
                                        "assets/imgs/burgerwithcoke.png")),
                                color: const Color(0x0FFD6500),
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            width: 78,
                            height: 76,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image:
                                        AssetImage("assets/imgs/burger2.png")),
                                color: const Color(0x0FFD6500),
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            width: 78,
                            height: 76,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image:
                                        AssetImage("assets/imgs/burger2.png")),
                                color: const Color(0x0FFD6500),
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 35, top: 8, right: 20),
                        child: Text(
                          'Biryani',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25, top: 8),
                        child: Text(
                          'Fast Food',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 45, top: 8),
                        child: Text(
                          'Pasta',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 45, top: 8),
                        child: Text(
                          'Halwa Puri',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20, top: 10),
                        child: Text(
                          'Top Chefs',
                          style: TextStyle(
                            color: Color(0xFF1E1E1E),
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w900,
                            height: 0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 225),
                        child: Text(
                          'See all',
                          style: TextStyle(
                            color: Color(0xFF1E1E1E),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        8,
                            (index) => Container(
                          width: 120,
                          child: Column(
                            mainAxisSize: MainAxisSize.min, // Restrict maximum size
                            children: [
                              Container(
                                width: 120,
                                height: 125,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/imgs/person${index % 4 + 1}.png"),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              Text(
                                names[index % names.length],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
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
    return Container(
      width: 352,
      height: 180,
      decoration: BoxDecoration(
        color: AppColors.primaryColor, // Change this to your desired color
        borderRadius: BorderRadius.circular(22),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 30),
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
              width: 150,
              height: 165,
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

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}
