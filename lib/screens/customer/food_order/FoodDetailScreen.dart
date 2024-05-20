// path of this file: lib/screens/customer/food_order/FoodDetailScreen.dart

import 'package:chefease/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/responsive.dart';
import '../../../widgets/text_styles.dart';
import 'ViewCartScreen.dart';

class RoundCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  RoundCheckbox({required this.value, required this.onChanged});

  @override
  _RoundCheckboxState createState() => _RoundCheckboxState();
}

class _RoundCheckboxState extends State<RoundCheckbox> {
  @override
  Widget build(BuildContext context) {
    double _screenwidth = Responsive.screenWidth(context);
    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.value);
      },
      child: Container(
        width: _screenwidth * 0.045, // Adjust width based on screen width
        height: _screenwidth * 0.045, // Adjust height based on screen width
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.value ? AppColors.primaryColor : Colors.transparent,
          border: Border.all(color: AppColors.primaryColor),
        ),
        child: widget.value
            ? Icon(
                Icons.check,
                size: _screenwidth *
                    0.035, // Adjust icon size based on screen width
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}

class OrderMenu extends StatefulWidget {
  @override
  _OrderMenuState createState() => _OrderMenuState();
}

class _OrderMenuState extends State<OrderMenu> {
  bool _checkBoxValue1 = false;
  bool _checkBoxValue2 = false;
  bool _checkBoxValue3 = false;
  bool _checkBoxValue4 = false;
  bool _checkBoxValue5 = false;
  bool _checkBoxValue6 = false;
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    double _screenheight = Responsive.screenHeight(context);
    double _screenwidth = Responsive.screenWidth(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: AppMainText(
          text: 'Order Menu',
          fontSize: 18,
          color: AppColors.textColor,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                  bottom: _screenheight *
                      0.04), // Adjust margin based on screen height
              child: Image.asset(
                'assets/imgs/pizzapic.png',
                width: double.infinity,
                height: _screenheight *
                    0.20, // Adjust height based on screen height
                fit: BoxFit.cover,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppMainText(
                  text: 'Pepperoni Special Pizza',
                  fontSize: _screenwidth *
                      0.04, // Adjust font size based on screen width
                ),
                AppMainText(
                  text: 'Rs 2000',
                  fontSize: _screenwidth *
                      0.04, // Adjust font size based on screen width
                ),
              ],
            ),
            SizedBox(
                height: _screenheight *
                    0.01), // Adjust height based on screen height
            AppLiteText(
              text: 'Korem ipsum',
              fontSize:
                  _screenwidth * 0.03, // Adjust font size based on screen width
            ),
            SizedBox(
                height: _screenheight *
                    0.010), // Adjust height based on screen height
            Divider(
              color: Colors.grey,
            ),
            SizedBox(
                height: _screenheight *
                    0.010), // Adjust height based on screen height
            AppMainText(
              text: 'Choose your variation',
              fontSize:
                  _screenwidth * 0.04, // Adjust font size based on screen width
            ),
            SizedBox(
                height: _screenheight *
                    0.01), // Adjust height based on screen height
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLiteText(
                  text: '7 Inches (Single Serving) Rs 2000',
                  fontSize: _screenwidth *
                      0.03, // Adjust font size based on screen width
                ),
                RoundCheckbox(
                  value: _checkBoxValue1,
                  onChanged: (value) {
                    setState(() {
                      _checkBoxValue1 = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
                height: _screenheight *
                    0.01), // Adjust height based on screen height
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLiteText(
                  text: '8 Inches (Double Serving) Rs 2500',
                  fontSize: _screenwidth *
                      0.03, // Adjust font size based on screen width
                ),
                RoundCheckbox(
                  value: _checkBoxValue2,
                  onChanged: (value) {
                    setState(() {
                      _checkBoxValue2 = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
                height: _screenheight *
                    0.01), // Adjust height based on screen height
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLiteText(
                  text: '9 Inches (Family Size) Rs 3000',
                  fontSize: _screenwidth *
                      0.03, // Adjust font size based on screen width
                ),
                RoundCheckbox(
                  value: _checkBoxValue3,
                  onChanged: (value) {
                    setState(() {
                      _checkBoxValue3 = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
                height: _screenheight *
                    0.010), // Adjust height based on screen height
            Divider(
              color: Colors.grey,
            ),
            SizedBox(
                height: _screenheight *
                    0.010), // Adjust height based on screen height
            AppMainText(
              text: 'Choose Your Extra Topping',
              fontSize:
                  _screenwidth * 0.04, // Adjust font size based on screen width
            ),
            SizedBox(
                height: _screenheight *
                    0.01), // Adjust height based on screen height
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLiteText(
                  text: 'Mushrooms Rs 200',
                  fontSize: _screenwidth *
                      0.03, // Adjust font size based on screen width
                ),
                RoundCheckbox(
                  value: _checkBoxValue4,
                  onChanged: (value) {
                    setState(() {
                      _checkBoxValue4 = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
                height: _screenheight *
                    0.01), // Adjust height based on screen height
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLiteText(
                  text: 'Olives Rs 150',
                  fontSize: _screenwidth *
                      0.03, // Adjust font size based on screen width
                ),
                RoundCheckbox(
                  value: _checkBoxValue5,
                  onChanged: (value) {
                    setState(() {
                      _checkBoxValue5 = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
                height: _screenheight *
                    0.01), // Adjust height based on screen height
            Divider(
              color: Colors.grey,
            ),
            SizedBox(
                height: _screenheight *
                    0.02), // Adjust height based on screen height
            AppMainText(
              text: 'Choose Your Drinks',
              fontSize:
                  _screenwidth * 0.04, // Adjust font size based on screen width
            ),
            SizedBox(
                height: _screenheight *
                    0.01), // Adjust height based on screen height
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLiteText(
                  text: 'Pepsi (250ml) Rs 50',
                  fontSize: _screenwidth *
                      0.03, // Adjust font size based on screen width
                ),
                RoundCheckbox(
                  value: _checkBoxValue6,
                  onChanged: (value) {
                    setState(() {
                      _checkBoxValue6 = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
                height: _screenheight *
                    0.01), // Adjust height based on screen height
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLiteText(
                  text: 'Coca-Cola (250ml) Rs 50',
                  fontSize: _screenwidth *
                      0.03, // Adjust font size based on screen width
                ),
                RoundCheckbox(
                  value: false, // Change this value based on checkbox state
                  onChanged: (newValue) {
                    // Implement checkbox logic here
                  },
                ),
              ],
            ),
            SizedBox(
                height: _screenheight *
                    0.03), // Adjust height based on screen height
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: _screenwidth *
                      0.04), // Adjust padding based on screen width
              child: Stack(
                children: [
                  SizedBox(
                    height: _screenheight *
                        0.070, // Adjust height based on screen height
                    width: _screenwidth, // Adjust width based on screen width
                    child: ElevatedButton(
                      onPressed: () {
                        // Implement add to cart logic here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFFDBBB), // Dark orange color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: _screenwidth *
                                0.01), // Adjust padding based on screen width
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.remove,
                                color: AppColors.primaryColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  _quantity--; // Decrement the quantity
                                });
                              },
                            ),
                            AppLiteText(
                              text: '$_quantity',
                              fontSize: _screenwidth *
                                  0.03, // Adjust font size based on screen width
                              color: AppColors.textColor,
                            ),
                            IconButton(
                              icon: Icon(Icons.add,
                                  color: AppColors.primaryColor),
                              onPressed: () {
                                setState(() {
                                  _quantity++; // Increment the quantity
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: _screenwidth *
                        0.35, // Adjust position based on screen width
                    child: SizedBox(
                      height: _screenheight *
                          0.070, // Adjust height based on screen height
                      width: _screenwidth *
                          0.5, // Adjust width based on screen width
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ViewCart()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              AppColors.primaryColor, // Dark orange color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: AppMainText(
                          color: AppColors.secondaryColor,
                          text: 'Add to Cart',
                          fontSize: _screenwidth *
                              0.03, // Adjust font size based on screen width
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
