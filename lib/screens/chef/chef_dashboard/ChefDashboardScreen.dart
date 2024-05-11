//ChefDashboardScreen.dart

import 'package:chefease/screens/chef/chef_add_menu/ChefAddMenuBottomSheet.dart';
import 'package:chefease/screens/chef/chef_dashboard/ChefOrderScreen.dart';
import 'package:chefease/screens/customer/chat/ChatListScreen.dart';
import 'package:chefease/widgets/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

import '../../../constants/colors.dart';
import '../../../constants/responsive.dart';
import '../../../widgets/drawer/ChefDrawer.dart';
import 'ChefMenuScreen.dart';
import '../notifications/NotificationScreen.dart';

class ChefDashboardScreen extends StatefulWidget {
  const ChefDashboardScreen({Key? key}) : super(key: key);

  @override
  _ChefDashboardScreenState createState() => _ChefDashboardScreenState();
}

class _ChefDashboardScreenState extends State<ChefDashboardScreen> {
  final _advancedDrawerController = AdvancedDrawerController();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      controller: _advancedDrawerController,
      drawer: ChefDrawerContent(),
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
          actions: [
            Icon(
              Icons.favorite_border,
              color: AppColors.secondaryColor,
            ),
            SizedBox(
              width: 15,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationScreen()),
                );
              },
              child: Icon(
                Icons.notifications_none_outlined,
                color: AppColors.secondaryColor,
              ),
            ),
            SizedBox(
              width: 15,
            ),
          ],
        ),
        body: Builder(
          builder: (BuildContext context) {
            switch (_selectedIndex) {
              case 0:
                return ChefDashboardHome();
              case 1:
                return ChefMenu();
              case 2:
                return AddBottomSheet();

              case 3:
                return ChefOrder();
              case 4:
                return ChatList();
              default:
                return ChefDashboardHome();
            }
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book),
              label: 'Menu',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle),
              label: 'Add Menu',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Order',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline_outlined),
              label: 'Chat',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class ChefDashboardHome extends StatefulWidget {
  const ChefDashboardHome({super.key});
  @override
  State<ChefDashboardHome> createState() => _ChefDashboardHomeState();
}

class _ChefDashboardHomeState extends State<ChefDashboardHome> {
  final List<Order> orders = [
    Order(
      orderNumber: '2523AQ',
      itemName: 'Pepperoni Special Pizza',
      orderTime: '24:00',
      price: 'Rs. 1200',
    ),
    Order(
      orderNumber: '2523AQ',
      itemName: 'Pepperoni Special Pizza',
      orderTime: '24:00',
      price: 'Rs. 1200',
    ),
    Order(
      orderNumber: '2523AQ',
      itemName: 'Pepperoni Special Pizza',
      orderTime: '24:00',
      price: 'Rs. 1200',
    ),
    Order(
      orderNumber: '2523AQ',
      itemName: 'Pepperoni Special Pizza',
      orderTime: '24:00',
      price: 'Rs. 1200',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double _screenheight = Responsive.screenHeight(context);
    double _screenwidth = Responsive.screenWidth(context);
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: _screenwidth * 0.05, top: _screenheight * 0.015),
              child: AppLiteText(
                text: 'Overview',
                color: AppColors.textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: _screenwidth * 0.05, top: _screenheight * 0.015),
              child: Container(
                width: _screenwidth * 0.44, // 45% of screen width
                height: _screenheight * 0.16, // 16% of screen height
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: _screenwidth * 0.14, // 14% of screen width
                      height: _screenheight * 0.055, // 5.5% of screen height
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(160, 212, 104, 0.15),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        Icons.check_circle_outline,
                        size: _screenwidth * 0.1, // 10% of screen width
                        color: Color(0xFFA0D468),
                      ),
                    ),
                    SizedBox(
                        height: _screenheight * 0.01), // 1% of screen height
                    AppLiteText(
                      text: 'Orders Completed',
                      color: AppColors.textColor,
                      fontSize: _screenwidth * 0.035, // 3.5% of screen width
                      fontWeight: FontWeight.w300,
                    ),
                    SizedBox(
                        height: _screenheight * 0.01), // 1% of screen height
                    AppLiteText(
                      text: '4',
                      color: Color(0xFFA0D468),
                      fontWeight: FontWeight.w500,
                      fontSize: _screenwidth * 0.045, // 4.5% of screen width
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: _screenwidth * 0.02,
                  top: _screenheight * 0.02,
                  right: _screenwidth * 0.02), // 2% of screen width and height
              child: Container(
                width: _screenwidth * 0.44, // 45% of screen width
                height: _screenheight * 0.16, // 16% of screen height
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: _screenwidth * 0.14, // 14% of screen width
                      height: _screenheight * 0.055, // 5.5% of screen height
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 106, 66, 0.12),
                        borderRadius: BorderRadius.circular(
                            40), // Half of the width or height of the image for circular shape
                      ),
                      padding: EdgeInsets.all(5), // Adjust padding as needed
                      child: Icon(
                        Icons.watch_later_outlined,
                        size: _screenwidth * 0.1, // 10% of screen width
                        color: Color.fromRGBO(255, 106, 66, 1),
                      ),
                    ),
                    SizedBox(
                        height: _screenheight * 0.01), // 1% of screen height
                    AppLiteText(
                      text: 'Orders Pending',
                      color: AppColors.textColor,
                      fontSize: _screenwidth * 0.035, // 3.5% of screen width
                      fontWeight: FontWeight.w300,
                    ),
                    SizedBox(
                        height: _screenheight * 0.01), // 1% of screen height
                    AppLiteText(
                      text: '2',
                      color: Color.fromRGBO(255, 106, 66, 1),
                      fontWeight: FontWeight.w500,
                      fontSize: _screenwidth * 0.045, // 4.5% of screen width
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(height: _screenheight * 0.01),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: _screenwidth * 0.05,
                  right: _screenwidth * 0.05), // 2% of screen width
              child: Container(
                width: _screenwidth * 0.90, // 90% of screen width
                height: _screenheight * 0.06, // 6% of screen height
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: _screenwidth * 0.05),
                      child: Icon(
                        Icons.attach_money,
                        size: 30,
                        color: Color.fromRGBO(255, 106, 66, 1),
                      ),
                    ), // Dollar icon
                    Padding(
                      padding: EdgeInsets.only(left: _screenwidth * 0.05),
                      child: AppLiteText(
                          text: 'Total Earning',
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w400,
                          fontSize: _screenwidth * 0.036),
                    ), // Text "Total Earning"
                    Padding(
                      padding: EdgeInsets.only(
                          left: _screenwidth * 0.25), // 12% of screen width
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Rs. ',
                              style: TextStyle(
                                  fontSize: _screenwidth * 0.040,
                                  color: Color.fromRGBO(255, 106, 66, 1),
                                  fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                              text: '2500',
                              style: TextStyle(
                                  fontSize: _screenwidth * 0.040,
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(height: _screenheight * 0.01),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: _screenwidth * 0.05,
                  right: _screenwidth * 0.05), // 2% of screen width
              child: Container(
                width: _screenwidth * 0.90, // 90% of screen width
                height: _screenheight * 0.06, // 6% of screen height
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: _screenwidth * 0.05),
                      child: Icon(
                        Icons.bar_chart_rounded,
                        size: 30,
                        color: Color.fromRGBO(160, 212, 104, 1),
                      ),
                    ), // Dollar icon
                    Padding(
                      padding: EdgeInsets.only(left: _screenwidth * 0.05),
                      child: AppLiteText(
                          text: 'Order Success Rate',
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w400,
                          fontSize: _screenwidth * 0.036),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: _screenwidth * 0.115), // 6.8% of screen width
                      child: AppLiteText(
                          text: '90%',
                          color: Color.fromRGBO(160, 212, 104, 1),
                          fontWeight: FontWeight.w600,
                          fontSize: _screenwidth * 0.040),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(height: _screenheight * 0.01),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: _screenwidth * 0.05,
                  right: _screenwidth * 0.05), // 2% of screen width
              child: Container(
                width: _screenwidth * 0.90, // 90% of screen width
                height: _screenheight * 0.06, // 6% of screen height
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: _screenwidth * 0.05),
                      child: Image(
                        image: AssetImage(
                            'assets/imgs/chefcap.png'), // Replace with your image path
                        width: _screenwidth * 0.075, // 7.5% of screen width
                        height: _screenheight * 0.075, // 7.5% of screen height
                        color: Color.fromRGBO(
                            255, 106, 66, 1), // Apply color tint if desired
                      ),
                    ), // Dollar icon
                    Padding(
                      padding: EdgeInsets.only(left: _screenwidth * 0.05),
                      child: AppLiteText(
                          text: 'Chef Level',
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w400,
                          fontSize: _screenwidth * 0.036),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: _screenwidth * 0.21),
                      child: Image(
                        image: AssetImage(
                            'assets/imgs/crown.png'), // Replace with your image path
                        width: _screenwidth * 0.055,
                        height: _screenheight * 0.055,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: _screenwidth * 0.025),
                      child: AppLiteText(
                          text: 'Top Rated',
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w500,
                          fontSize: _screenwidth * 0.035),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(height: _screenheight * 0.01),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: _screenwidth * 0.05, top: _screenheight * 0.015),
              child: AppLiteText(
                text: 'Order List',
                color: AppColors.textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(height: _screenheight * 0.01),
        Expanded(
          child: ListView.separated(
            itemCount: orders.length,
            separatorBuilder: (context, index) => Divider(
                color: Colors.grey), // Use a divider instead of SizedBox
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: _screenwidth * 0.02), // 2% of screen width
                child: Card(
                  // Use Card for a better UI
                  elevation: 5, // Shadow
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // Rounded corners
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: Color.fromRGBO(255, 106, 66, 1),
                          width: _screenwidth * 0.0125, // 1.25% of screen width
                        ),
                      ),
                    ),
                    child: ListTile(
                      title: Row(
                        children: [
                          Text(
                            'Order # ${orders[index].orderNumber}',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: _screenwidth * 0.04,
                                fontFamily: "Poppins"), // 4% of screen width
                          ),
                          Spacer(),
                          Container(
                            width: _screenwidth * 0.1, // 10% of screen width
                            height: _screenwidth * 0.1, // 10% of screen width
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 106, 66, 0.12),
                              borderRadius: BorderRadius.circular(
                                  _screenwidth * 0.05), // 5% of screen width
                            ),
                            child: Icon(
                              Icons.watch_later_outlined,
                              size: _screenwidth *
                                  0.0625, // 6.25% of screen width
                              color: Color.fromRGBO(255, 106, 66, 1),
                            ),
                          ),
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: _screenheight *
                                  0.005), // 0.5% of screen height
                          Text(
                            orders[index].itemName,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: _screenwidth * 0.04,
                                fontFamily: "Poppins"), // 4% of screen width
                          ),
                          SizedBox(
                              height: _screenheight *
                                  0.005), // 0.5% of screen height
                          Row(
                            children: [
                              Text(
                                'Order Time: ${orders[index].orderTime}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: _screenwidth * 0.04,
                                    fontFamily:
                                        "Poppins"), // 4% of screen width
                              ),
                              SizedBox(
                                  width: _screenwidth *
                                      0.04), // 4% of screen width
                              Text(
                                orders[index].price,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: _screenwidth * 0.04,
                                    fontFamily:
                                        "Poppins"), // 4% of screen width
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class Order {
  final String orderNumber;
  final String itemName;
  final String orderTime;
  final String price;

  Order({
    required this.orderNumber,
    required this.itemName,
    required this.orderTime,
    required this.price,
  });
}
