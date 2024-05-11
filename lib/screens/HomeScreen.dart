import 'package:chefease/constants/responsive.dart';
import 'package:chefease/screens/customer/chat/ChatListScreen.dart';
import 'package:chefease/screens/customer/food_order/HomeOrderScreen.dart';
import 'package:chefease/screens/customer/food_order/OrderHistory.dart';
import 'package:chefease/screens/customer/post_bids/BidsReviewScreen.dart';
import 'package:chefease/screens/customer/reels/ReelScreen.dart';
import 'package:chefease/widgets/drawer/UserDrawer.dart';
import 'package:chefease/widgets/text_styles.dart';
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
    ChatList(),
    OrderHistory(), // Added new screen
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
          type: BottomNavigationBarType.fixed,
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
              icon: Icon(Icons.chat_bubble_outline_outlined),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history), // New item
              label: 'Order',
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
        ),
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
    double _screenheight = Responsive.screenHeight(context);
    double _screenwidth = Responsive.screenWidth(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(
            top: _screenheight * 0.03,
            left: _screenwidth * 0.03,
            right: _screenwidth * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 'Donate Food' and 'Post Bids' Containers
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    width: _screenwidth * 0.45,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppMainText(text: 'Donate Food', fontSize: 15),
                          AppLiteText(
                              text: 'Donate food to needy people',
                              fontSize: 12),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                                width: _screenwidth * 0.2,
                                child: Image.asset('assets/imgs/hand.png')),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // 'Post Bids' Container
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BidsReviewScreen()),
                    );
                  },
                  child: Container(
                    width: _screenwidth * 0.43,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppMainText(text: 'Post Bids', fontSize: 15),
                          AppLiteText(text: 'Tell What you need', fontSize: 12),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                                width: _screenwidth * 0.2,
                                child: Image.asset('assets/imgs/bidding.png')),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: _screenwidth * 0.03,
            ),
            // 'Order Food from nearby Chefs' Container
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => homeOrder()),
                );
              },
              child: Container(
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //col1
                        Container(
                          margin: EdgeInsets.all(15),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Order Food from \nnearby ',
                                        style: TextStyle(
                                          fontSize: _screenwidth * 0.06,
                                          fontFamily: 'SnappyServiceNF',
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Chefs',
                                        style: TextStyle(
                                          color: AppColors.primaryColor,
                                          fontSize: _screenwidth * 0.06,
                                          fontFamily: 'SnappyServiceNF',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: _screenwidth * 0.03, // 15
                                ),
                                AppLiteText(
                                  text: '10% off on first order',
                                  fontFamily: 'MergeOne',
                                ),
                              ]),
                        ),
                        //col2
                        Image.asset(
                          'assets/imgs/hamburger.png',
                          fit: BoxFit.cover,
                          width: _screenwidth * 0.4,
                        ),
                      ]),
                ),
              ),
            ),
            SizedBox(
              height: _screenwidth * 0.03,
            ),
            // 'Deals from Chefs' text
            AppMainText(
              text: 'Deals from Chefs',
            ),
            SizedBox(
              height: _screenwidth * 0.03,
            ),
            //Deals menu items
            Container(
              width: double.maxFinite,
              height: _screenheight * 0.2,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: _screenwidth * 0.38,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          FractionallySizedBox(
                            widthFactor:
                                0.5, // 40% of the parent widget's width
                            child: Image.asset(
                              'assets/imgs/burger.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AppMainText(
                            text: 'Buy 1 Get\n1 free',
                            fontFamily: 'ChieezyBurger',
                            color: Colors.white,
                            textAlign: TextAlign.center,
                            fontSize: 17,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: _screenwidth * 0.03,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => homeOrder()),
                );
              },
              child: Container(
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //col1
                        Container(
                          margin: EdgeInsets.all(15),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Order Food from \nnearby ',
                                        style: TextStyle(
                                          fontSize: _screenwidth * 0.06,
                                          fontFamily: 'SnappyServiceNF',
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Chefs',
                                        style: TextStyle(
                                          color: AppColors.primaryColor,
                                          fontSize: _screenwidth * 0.06,
                                          fontFamily: 'SnappyServiceNF',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: _screenwidth * 0.03, // 15
                                ),
                                AppLiteText(
                                  text: '10% off on first order',
                                  fontFamily: 'MergeOne',
                                ),
                              ]),
                        ),
                        //col2
                        Image.asset(
                          'assets/imgs/hamburger.png',
                          fit: BoxFit.cover,
                          width: _screenwidth * 0.4,
                        ),
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
