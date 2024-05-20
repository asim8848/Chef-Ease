// path of this file: lib/screens/customer/food_order/ViewCartScreen.dart
import 'package:chefease/screens/customer/food_order/FoodDetailScreen.dart';
import 'package:chefease/screens/customer/food_order/OrderDetailsScreen.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/responsive.dart';
import '../../../widgets/text_styles.dart';

class ViewCart extends StatefulWidget {
  const ViewCart({super.key});

  @override
  State<ViewCart> createState() => _ViewCartState();
}

class _ViewCartState extends State<ViewCart> {
  int _quantity = 1;
  @override
  Widget build(BuildContext context) {
    double _screenheight = Responsive.screenHeight(context);
    double _screenwidth = Responsive.screenWidth(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(_screenheight * 0.3), // Adjusted height
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity, // Adjusted height
              child: Image.asset(
                "assets/imgs/pizzamenu.png",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: _screenheight * 0.07, // Adjusted position
              left: _screenheight * 0.00, // Adjusted position
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: AppColors.secondaryColor),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: _screenwidth * 0.25, // Adjusted width
                      height: _screenwidth * 0.25, // Adjusted height
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/imgs/person1.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppMainText(
                                text: 'Anna’s Kitchen',
                                color: Color(0xFF292D32),
                                fontSize:
                                    _screenwidth * 0.05, // Adjusted font size
                                fontWeight: FontWeight.w600,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.share,
                                        color: AppColors.primaryColor),
                                    onPressed: () {
                                      // Add your share functionality here
                                    },
                                  ),
                                  Icon(Icons.favorite,
                                      color: AppColors.primaryColor),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.black,
                                size: _screenwidth * 0.04, // Adjusted icon size
                              ),
                              SizedBox(
                                  width:
                                      _screenwidth * 0.01), // Adjusted spacing
                              AppMainText(
                                text: '1.1km away',
                                color: Colors.black,
                                fontSize:
                                    _screenwidth * 0.03, // Adjusted font size
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                Container(
                  width: _screenwidth, // Adjusted width
                  height: _screenheight * 0.090, // Adjusted height
                  decoration: ShapeDecoration(
                    color: Color(0xFFFF6A42),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          _screenwidth * 0.02), // Adjusted borderRadius
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: _screenwidth * 0.05), // Adjusted padding
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: _screenwidth *
                                      0.050, // Adjusted icon size
                                ),
                                SizedBox(
                                    width: _screenwidth *
                                        0.01), // Adjusted spacing
                                AppMainText(
                                  // Using custom text widget
                                  text: 'Ratings: 4.5',
                                  color: Color(0xFFEEF5FF),
                                  fontSize: _screenwidth *
                                      0.035, // Adjusted font size
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                            SizedBox(
                                height:
                                    _screenheight * 0.008), // Adjusted spacing
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: _screenwidth *
                                      0.055, // Adjusted icon size
                                ),
                                SizedBox(
                                    width: _screenwidth *
                                        0.01), // Adjusted spacing
                                AppMainText(
                                  // Using custom text widget
                                  text: 'Pizza',
                                  color: Colors.white,
                                  fontSize: _screenwidth *
                                      0.035, // Adjusted font size
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          width: _screenwidth * 0.102, // Adjusted width
                          height: _screenwidth * 0.102, // Adjusted height
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xFFFF6A42),
                                size:
                                    _screenwidth * 0.070, // Adjusted icon size
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: _screenheight * 0.02), // Adjusted spacing
                Row(
                  children: [
                    FilterChip(
                      label: AppMainText(
                        // Using custom text widget
                        text: 'Special Pizza',
                        color: Colors.white,
                        fontSize: _screenwidth * 0.030, // Adjusted font size
                        fontWeight: FontWeight.w500,
                      ),
                      backgroundColor: Color(0xFFFF6A42),
                      selected: false,
                      onSelected: (isSelected) {},
                    ),
                    SizedBox(width: _screenwidth * 0.04), // Adjusted spacing
                    FilterChip(
                      label: AppMainText(
                        // Using custom text widget
                        text: 'Popular',
                        color: Colors.black,
                        fontSize: _screenwidth * 0.030, // Adjusted font size
                        fontWeight: FontWeight.w500,
                      ),
                      backgroundColor: Color(0xFFEFF2F5),
                      selected: false,
                      onSelected: (isSelected) {},
                    ),
                    SizedBox(width: _screenwidth * 0.04), // Adjusted spacing
                    FilterChip(
                      label: AppMainText(
                        // Using custom text widget
                        text: 'Midnight',
                        color: Colors.black,
                        fontSize: _screenwidth * 0.030, // Adjusted font size
                        fontWeight: FontWeight.w500,
                      ),
                      backgroundColor: Color(0xFFEFF2F5),
                      selected: false,
                      onSelected: (isSelected) {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderMenu(),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: _screenheight * 0.145, // Adjusted height

                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Container(
                              width: _screenwidth * 0.250, // Adjusted width
                              height: _screenheight * 0.110, // Adjusted height

                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/imgs/pizzalist.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: _screenwidth * 0.02),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppMainText(
                                  text: 'Peperoni Special Pizza',
                                  color: Color(0xFF1E1E1E),
                                  fontSize: _screenwidth *
                                      0.036, // Adjust the multiplier as needed
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(
                                    height: _screenheight *
                                        0.010), // Adjust the multiplier as needed
                                AppMainText(
                                  text: 'Single Serving',
                                  color: Color(0xFF292D32),
                                  fontSize: _screenwidth *
                                      0.032, // Adjust the multiplier as needed
                                  fontWeight: FontWeight.w300,
                                ),
                                SizedBox(
                                    height: _screenheight *
                                        0.010), // Adjust the multiplier as needed
                                Row(
                                  children: [
                                    AppMainText(
                                      text: '2500 Rs',
                                      color: Color(0xFF292D32),
                                      fontSize: _screenwidth *
                                          0.032, // Adjust the multiplier as needed
                                      fontWeight: FontWeight.w400,
                                    ),
                                    SizedBox(
                                        width: _screenwidth *
                                            0.036), // Adjust the multiplier as needed
                                    AppMainText(
                                      text: '1000 Rs',
                                      color: Color(0xFFFD9700),
                                      fontSize: _screenwidth *
                                          0.032, // Adjust the multiplier as needed
                                      fontWeight: FontWeight.w500,
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
                  Divider(),
                ],
              );
            },
          ),
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
                            icon:
                                Icon(Icons.add, color: AppColors.primaryColor),
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
                      0.42, // Adjust position based on screen width
                  child: SizedBox(
                    height: _screenheight *
                        0.070, // Adjust height based on screen height
                    width: _screenwidth *
                        0.5, // Adjust width based on screen width
                    child: ElevatedButton(
                      onPressed: () {
                        /*Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrderDetails()),
                        );*/
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
    );
  }
}
