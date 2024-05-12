import 'package:chefease/constants/colors.dart';
import 'package:chefease/screens/chef/Chef_add_menu/UpdateMealScreen.dart';
import 'package:chefease/widgets/drawer/UserDrawer.dart';
import 'package:chefease/widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

import '../../../constants/responsive.dart';

class ChefMenu extends StatefulWidget {
  const ChefMenu({super.key});

  @override
  State<ChefMenu> createState() => _ChefMenuState();
}

class _ChefMenuState extends State<ChefMenu> {
  @override
  Widget build(BuildContext context) {
    double _screenheight = Responsive.screenHeight(context);
    double _screenwidth = Responsive.screenWidth(context);
    return Scaffold(
        body: ListView.builder(
          itemCount: 10, // Replace 3 with the actual number of items
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                left: _screenwidth * 0.05, // 5% of screen width
                right: _screenwidth * 0.05, // 5% of screen width
                bottom: _screenheight * 0.01, // 1% of screen height
              ),
              child: Dismissible(
                key: Key('item_$index'),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: AppColors.primaryColor,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(
                      right: _screenwidth * 0.05), // 5% of screen width
                  child: Icon(Icons.delete, color: Colors.white),
                ),
                onDismissed: (direction) {
                  // Implement delete functionality here
                  setState(() {
                    // Assuming you have a List of items named 'menuItems'
                  });
                },
                child: Container(
                  height: _screenheight * 0.2, // 20% of screen height
                  width: double.infinity,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Container(
                                height: _screenheight * 0.1, // 10% of screen height
                                width: _screenwidth * 0.1, // 20% of screen width
                                child: Image.asset(
                                  'assets/imgs/menupizza.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: ListTile(
                                title: Padding(
                                  padding: EdgeInsets.only(
                                      top: _screenheight *
                                          0.03), // 3% of screen height
                                  child: AppMainText(
                                    text: 'Peperoni Special Pizza',
                                    fontWeight: FontWeight.w500,
                                    fontSize:
                                    _screenwidth * 0.04, // 4% of screen width
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppLiteText(
                                      text: 'Lorem Ipsum Lorem\nIpsum Lorem Ipsum',
                                      fontSize: _screenwidth *
                                          0.035, // 3.5% of screen width
                                      fontWeight: FontWeight.w300,
                                    ),
                                    SizedBox(
                                        height: _screenheight *
                                            0.005), // 0.5% of screen height
                                    Row(
                                      children: [
                                        AppLiteText(
                                          text: '15 inch',
                                          fontSize: _screenwidth *
                                              0.035, // 3.5% of screen width
                                          fontWeight: FontWeight.w400,
                                        ),
                                        SizedBox(
                                            width: _screenwidth *
                                                0.02), // 2% of screen width
                                        AppMainText(
                                          text: '1000 Rs',
                                          fontWeight: FontWeight.w500,
                                          fontSize: _screenwidth *
                                              0.04, // 4% of screen width
                                          color: AppColors.primaryColor,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  // Implement edit functionality here
                                },
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: _screenheight * 0.01, // 1% of screen height
                          right: _screenwidth * 0.01, // 1% of screen width
                          child: IconButton(
                            icon: Icon(Icons.edit_outlined,
                                color: AppColors.primaryColor,
                                size: _screenwidth * 0.04), // 4% of screen width
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UpdateMeal()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}