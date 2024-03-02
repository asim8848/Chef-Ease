import 'package:chefease/screens/customer/food_order/HomeOrderScreen.dart';
import 'package:chefease/screens/customer/reels/ReelScreen.dart';
import 'package:chefease/widgets/Drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

import '../constants/colors.dart';
import 'customer/donation/DonationMainScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _advancedDrawerController = AdvancedDrawerController();

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    thisHome(),
    Reels(),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.slow_motion_video),
              label: 'Reels',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
        appBar: _selectedIndex == 1
            ? null
            : AppBar(
                centerTitle: false,
                automaticallyImplyLeading: false,
                backgroundColor: AppColors.primaryColor,
                leading: IconButton(
                  onPressed: _handleMenuButtonPressed,
                  icon: const Icon(Icons.menu),
                  color: AppColors.secondaryColor,
                ),
                title: GestureDetector(
                  onTap: () => print("Asim"),
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

        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ), // Your existing body content
      ),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}

class thisHome extends StatefulWidget {
  const thisHome({super.key});

  @override
  State<thisHome> createState() => _thisHomeState();
}

class _thisHomeState extends State<thisHome> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DonationMainScreen()),
                    );
                  },
                  child: Container(
                    width: 168,
                    height: 147,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 113,
                          height: 27,
                          child: Text(
                            'Donate Food',
                            style: TextStyle(
                              color: Color(0xFF1E1E1E),
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 138,
                          height: 56,
                          child: Text(
                            'Donate food to needy people',
                            style: TextStyle(
                              color: Color(0xFF1E1E1E),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                              width: 69.75,
                              height: 53.09,
                              child: Image.asset('assets/imgs/hand.png')),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 168,
                  height: 147,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 113,
                        height: 27,
                        child: Text(
                          'Post Bids',
                          style: TextStyle(
                            color: Color(0xFF1E1E1E),
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 138,
                        height: 56,
                        child: Text(
                          'Tell What you need',
                          style: TextStyle(
                            color: Color(0xFF1E1E1E),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                            width: 80.75,
                            height: 53.09,
                            child: Image.asset('assets/imgs/bidding.png')),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => homeOrder()),
                );
              },
              child: Container(
                width: double.maxFinite,
                height: 147,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(children: [
                  //col1
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0, left: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 160,
                            height: 70,
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Order Food from \nnearby ',
                                    style: TextStyle(
                                      color: Color(0xFF1E1E1E),
                                      fontSize: 21,
                                      fontFamily: 'Snappy Service NF',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Chefs',
                                    style: TextStyle(
                                      color: Color(0xFFFF6A42),
                                      fontSize: 21,
                                      fontFamily: 'Snappy Service NF',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 160,
                            height: 21,
                            child: Text(
                              '10% off on first order',
                              style: TextStyle(
                                color: Color(0xFF1E1E1E),
                                fontSize: 13,
                                fontFamily: 'Merge One',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ]),
                  ),
                  //col2
                  Column(
                    children: [
                      Image.asset(
                        'assets/imgs/hamburger.png',
                        fit: BoxFit.fill,
                        width: 150,
                      ),
                    ],
                  ),
                ]),
              ),
            ),
            const SizedBox(
              width: 184,
              height: 27,
              child: Text(
                'Deals from Chefs',
                style: TextStyle(
                  color: Color(0xFF1E1E1E),
                  fontSize: 17,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              height: 133, // Set a fixed height for the container
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: 134,
                      height: 133, // Set a fixed height for each container
                      decoration: ShapeDecoration(
                        gradient: const RadialGradient(
                          center: Alignment(0, 1),
                          radius: 0,
                          colors: [Color(0xFFF78600), Color(0xFFFD6500)],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/imgs/burger.png'),
                          const SizedBox(
                            width: 87,
                            height: 42,
                            child: Text(
                              'Buy 1 GET 1 free',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontFamily: 'Chieezy Burger',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: double.maxFinite,
              height: 250,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Row(children: [
                //col1
                const Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 160,
                          height: 70,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Order Food from \nnearby ',
                                  style: TextStyle(
                                    color: Color(0xFF1E1E1E),
                                    fontSize: 21,
                                    fontFamily: 'Snappy Service NF',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Chefs',
                                  style: TextStyle(
                                    color: Color(0xFFFF6A42),
                                    fontSize: 21,
                                    fontFamily: 'Snappy Service NF',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 160,
                          height: 21,
                          child: Text(
                            '10% off on first order',
                            style: TextStyle(
                              color: Color(0xFF1E1E1E),
                              fontSize: 13,
                              fontFamily: 'Merge One',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )
                      ]),
                ),
                //col2
                Column(
                  children: [
                    Image.asset(
                      'assets/imgs/hamburger.png',
                      fit: BoxFit.fill,
                      width: 150,
                    ),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
