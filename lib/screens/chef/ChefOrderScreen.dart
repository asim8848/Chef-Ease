import 'package:chefease/constants/colors.dart';
import 'package:chefease/widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

import '../../constants/responsive.dart';

class ChefOrder extends StatefulWidget {
  const ChefOrder({Key? key}) : super(key: key);

  @override
  State<ChefOrder> createState() => _ChefOrderState();
}

class _ChefOrderState extends State<ChefOrder> {
  final _advancedDrawerController = AdvancedDrawerController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
      body: ListView.builder(
        itemCount: 5, // Replace 5 with the actual number of orders
        itemBuilder: (BuildContext context, int index) {
          return _buildOrderListItem();
        },
      ),
    );
  }

  Widget _buildOrderListItem() {
    double _screenheight = Responsive.screenHeight(context);
    double _screenwidth = Responsive.screenWidth(context);
    return Card(
      margin: EdgeInsets.all(_screenwidth * 0.02), // 2% of screen width
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: _screenwidth * 0.02), // 2% of screen width // Add padding horizontally
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(_screenwidth * 0.02), // 2% of screen width
              child: Row(
                children: [
                  CircleAvatar(
                    // Replace with actual image
                    radius: _screenwidth * 0.03, // 3% of screen width
                    backgroundImage: AssetImage('assets/imgs/person1circle.png'),
                  ),
                  SizedBox(width: _screenwidth * 0.02), // 2% of screen width
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLiteText(
                        text: 'Fahad Kamran',
                        fontSize: _screenwidth * 0.035, // 3.5% of screen width
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AppLiteText(
                        text: 'Status: ',
                        fontSize: _screenwidth * 0.03, // 3% of screen width
                        fontWeight: FontWeight.w500,
                      ),
                      AppLiteText(
                        text: 'Pending',
                        fontSize: _screenwidth * 0.03, // 3% of screen width
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(_screenwidth * 0.02), // 2% of screen width
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: _screenwidth * 0.27, // 27% of screen width
                    height: _screenwidth * 0.27, // 27% of screen width
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/imgs/pizzamenu.png'),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  SizedBox(width: _screenwidth * 0.02), // 2% of screen width
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: _screenwidth * 0.02), // 2% of screen width
                          child: AppMainText(
                            text: 'Pepperoni Special Pizza',
                            fontSize: _screenwidth * 0.04, // 4% of screen width
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: _screenheight * 0.01), // 1% of screen height
                        Padding(
                          padding: EdgeInsets.only(left: _screenwidth * 0.02), // 2% of screen width
                          child: AppLiteText(
                            text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, Lorem Ipsum, lorem.',
                            fontSize: _screenwidth * 0.032, // 3.5% of screen width
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: _screenheight * 0.02), // 2% of screen height
            Row(
              children: [
                Icon(Icons.location_on_outlined, size: _screenwidth * 0.05), // 5% of screen width
                SizedBox(width: _screenwidth * 0.01), // 1% of screen width
                AppLiteText(
                  text: 'Delivery Address:',
                  fontSize: _screenwidth * 0.03, // 3% of screen width
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(width: _screenwidth * 0.01), // 1% of screen width
                AppLiteText(
                  text: 'House#2, Street 16, Bahria Town, Lahore',
                  fontSize: _screenwidth * 0.028, // 3% of screen width
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
            SizedBox(height: _screenheight * 0.03), // 5% of screen height
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.person_pin, size: _screenwidth * 0.05), // 5% of screen width
                SizedBox(width: _screenwidth * 0.01), // 1% of screen width
                AppLiteText(
                  text: 'Invoice:',
                  fontSize: _screenwidth * 0.03, // 3% of screen width
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(width: _screenwidth * 0.01), // 1% of screen width
                AppLiteText(
                  text: '12A679',
                  fontSize: _screenwidth * 0.03, // 3% of screen width
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(width: _screenwidth * 0.07), // 7% of screen width
                AppLiteText(
                  text: 'Quality:',
                  fontSize: _screenwidth * 0.03, // 3% of screen width
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(width: _screenwidth * 0.01), // 1% of screen width
                AppLiteText(
                  text: '4x',
                  fontSize: _screenwidth * 0.03, // 3% of screen width
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(width: _screenwidth * 0.07), // 7% of screen width
                AppLiteText(
                  text: 'Total:',
                  fontSize: _screenwidth * 0.03, // 3% of screen width
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(width: _screenwidth * 0.01), // 1% of screen width
                AppLiteText(
                  text: 'Rs. 300.00',
                  fontSize: _screenwidth * 0.03, // 3% of screen width
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(_screenwidth * 0.02), // 2% of screen width
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: _screenwidth * 0.4, // 40% of screen width
                    child: OutlinedButton(
                      child: Text("Reject"),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.primaryColor,
                        side: BorderSide(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    width: _screenwidth * 0.4, // 40% of screen width
                    child:  ElevatedButton(
                      child: Text("Accept"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        elevation: 0,
                      ),
                      onPressed: () {},
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
  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}
