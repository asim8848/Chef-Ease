import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/responsive.dart';
import '../../widgets/buttons.dart';
import '../../widgets/text_styles.dart';

class OrderTrack extends StatefulWidget {
  const OrderTrack({Key? key}) : super(key: key);

  @override
  State<OrderTrack> createState() => _OrderTrackState();
}

class _OrderTrackState extends State<OrderTrack> {
  @override
  Widget build(BuildContext context) {
    double _screenHeight = Responsive.screenHeight(context);
    double _screenWidth = Responsive.screenWidth(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: AppMainText(
          text: 'Order Track',
          fontSize: 18,
          color: AppColors.textColor,
        ),
        backgroundColor: AppColors.secondaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            AppLiteText(
              text: 'Completion Time',
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: _screenHeight* 0.01), // 1% of screen height
            AppMainText(
              text: '45 min',
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryColor,
            ),
            SizedBox(height: _screenHeight* 0.04),
            Image(image: AssetImage('assets/imgs/Scene.png')),
            SizedBox(height: _screenHeight* 0.04),
            Padding(
              padding: EdgeInsets.only(left: _screenWidth * 0.35),
              child: AnotherStepper(
                stepperList: [
                  StepperData(
                    title: StepperText("Order Placed"),
                    subtitle: StepperText("10:32 AM"),
                    iconWidget: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(Icons.access_time, color: Colors.white),
                    ),
                  ),
                  StepperData(
                    title: StepperText("Order Accepted"),
                    subtitle: StepperText("10:32 AM"),
                    iconWidget: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(Icons.book_outlined, color: Colors.white),
                    ),
                  ),
                  StepperData(
                    title: StepperText("Order Completed"),
                    subtitle: StepperText("10:32 AM"),
                    iconWidget: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(Icons.delivery_dining_rounded, color: Colors.white),
                    ),
                  ),
                ],
                stepperDirection: Axis.vertical,
                iconWidth: 40,
                iconHeight: 40,
                activeBarColor: AppColors.primaryColor,
                inActiveBarColor: AppColors.primaryColor,
                verticalGap: 30,
                activeIndex: 1,
                barThickness: 4,
              ),
            ),
            SizedBox(height: _screenHeight * 0.10), // 8.9% of screen height
            Container(
              width: _screenWidth,
              height: _screenHeight * 0.065,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(_screenWidth * 0.045), // 4.5% of screen width
                  topRight: Radius.circular(_screenWidth * 0.045), // 4.5% of screen width
                ),
              ),
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.keyboard_arrow_up_outlined,
                      color: AppColors.secondaryColor,
                      size: _screenWidth * 0.08, // 8% of screen width
                    ),
                    SizedBox(width: _screenWidth * 0.02), // 2% of screen width
                    AppLiteText(
                      text: 'Order Details',
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      fontSize: _screenWidth * 0.04, // 4% of screen width
                    ),
                  ],
                ),
                onTap: () {
                  showModalBottomSheet(
                    enableDrag: true,
                    useSafeArea: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(_screenWidth * 0.05), // 5% of screen width
                        topRight: Radius.circular(_screenWidth * 0.05), // 5% of screen width
                      ),
                    ),
                    backgroundColor: AppColors.primaryColor,
                    context: context,
                    builder: (context) => SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop(); // Close the bottom sheet
                            },
                            child: Container(
                              padding: EdgeInsets.all(_screenWidth * 0.04), // 4% of screen width
                              decoration: BoxDecoration(
                                border: Border(
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    color: AppColors.secondaryColor,
                                    size: _screenWidth * 0.08, // 8% of screen width
                                  ),
                                  SizedBox(width: _screenWidth * 0.01), // 1% of screen width
                                  AppLiteText(
                                    text: 'Order Details',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Poppins',
                                    fontSize: _screenWidth * 0.04, // 4% of screen width
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: _screenWidth * 0.05), // 5% of screen width
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: _screenHeight * 0.02), // 2% of screen height
                                CircleAvatar(
                                  radius: _screenWidth * 0.12, // 12% of screen width
                                  backgroundImage: AssetImage('assets/imgs/person1circle.png'),
                                ),
                                SizedBox(height: _screenHeight * 0.02), // 2% of screen height
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style: TextStyle(fontSize: _screenWidth * 0.042, color: AppColors.secondaryColor, fontFamily: 'Poppins'), // 4.5% of screen width
                                    children: [
                                      TextSpan(text: 'Chef: ', style: TextStyle(fontWeight: FontWeight.bold)),
                                      TextSpan(text: 'Anna’s Kitchen', style: TextStyle(fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                ),
                                SizedBox(height: _screenHeight * 0.01), // 1% of screen height
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style: TextStyle(fontSize: _screenWidth * 0.042, color: AppColors.secondaryColor, fontFamily: 'Poppins'), // 4.5% of screen width
                                    children: [
                                      TextSpan(text: 'INVOICE : ', style: TextStyle(fontWeight: FontWeight.bold)),
                                      TextSpan(text: '12A679', style: TextStyle(fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                ),
                                SizedBox(height: _screenHeight * 0.005), // 0.5% of screen height
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style: TextStyle(fontSize: _screenWidth * 0.042, color: AppColors.secondaryColor, fontFamily: 'Poppins'), // 4.5% of screen width
                                    children: [
                                      TextSpan(text: 'Order Name : ', style: TextStyle(fontWeight: FontWeight.bold)),
                                      TextSpan(text: 'Peperoni Special Pizza', style: TextStyle(fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                ),
                                SizedBox(height: _screenHeight * 0.005), // 0.5% of screen height
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style: TextStyle(fontSize: _screenWidth * 0.042, color: AppColors.secondaryColor, fontFamily: 'Poppins'), // 4.5% of screen width
                                    children: [
                                      TextSpan(text: 'Total : ', style: TextStyle(fontWeight: FontWeight.bold)),
                                      TextSpan(text: ' 1500 Rs.', style: TextStyle(fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                SizedBox(height: _screenHeight * 0.02), // 2% of screen height
                                SizedBox(
                                  width: double.infinity,
                                  child: CustomButton(
                                    borderRadius: _screenWidth * 0.02, // 2% of screen width
                                    text: 'Mark as Completed',
                                    onPressed: () {
                                      // Handle form submission
                                    },
                                    backgroundColor: AppColors.secondaryColor,
                                    textColor: AppColors.primaryColor,
                                  ),
                                ),
                                SizedBox(height: _screenHeight * 0.04), // 4% of screen height
                              ],
                            ),
                          ),
                        ],
                      ),
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
