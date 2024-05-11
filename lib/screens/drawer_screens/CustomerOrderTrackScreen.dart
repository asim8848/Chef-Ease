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
            SizedBox(height: 10),
            AppMainText(
              text: '45 min',
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryColor,
            ),
            SizedBox(height: 40),
            Image(image: AssetImage('assets/imgs/Scene.png')),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 140),
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
            SizedBox(height: 89),
            Container(
              width: _screenWidth,
              height: _screenHeight * 0.065,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
              ),
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.keyboard_arrow_up_outlined,
                      color: AppColors.secondaryColor,
                      size: 32,
                    ),
                    SizedBox(width: 8),
                    AppLiteText(
                      text: 'Order Details',
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ),
                  ],
                ),
                onTap: () {
                  showModalBottomSheet(
                    enableDrag: true,
                    useSafeArea: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
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
                              padding: EdgeInsets.all(16),
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
                                    size: 32,
                                  ),
                                  SizedBox(width: 4),
                                  AppLiteText(
                                    text: 'Order Details',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Poppins',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 20),
                                CircleAvatar(
                                  radius: _screenWidth * 0.12, // Adjust the radius according to your needs
                                  backgroundImage: AssetImage('assets/imgs/person1circle.png'),
                                ),
                                SizedBox(height: 20),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style: TextStyle(fontSize: 18, color: AppColors.secondaryColor, fontFamily: 'Poppins'),
                                    children: [
                                      TextSpan(text: 'Chef: ', style: TextStyle(fontWeight: FontWeight.bold)),
                                      TextSpan(text: 'Anna’s Kitchen', style: TextStyle(fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style: TextStyle(fontSize: 18, color: AppColors.secondaryColor, fontFamily: 'Poppins'),
                                    children: [
                                      TextSpan(text: 'INVOICE : ', style: TextStyle(fontWeight: FontWeight.bold)),
                                      TextSpan(text: '12A679', style: TextStyle(fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style: TextStyle(fontSize: 18, color: AppColors.secondaryColor, fontFamily: 'Poppins'),
                                    children: [
                                      TextSpan(text: 'Order Name : ', style: TextStyle(fontWeight: FontWeight.bold)),
                                      TextSpan(text: 'Peperoni Special Pizza', style: TextStyle(fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style: TextStyle(fontSize: 18, color: AppColors.secondaryColor, fontFamily: 'Poppins'),
                                    children: [
                                      TextSpan(text: 'Total : ', style: TextStyle(fontWeight: FontWeight.bold)),
                                      TextSpan(text: ' 1500 Rs.', style: TextStyle(fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                SizedBox(
                                  width: double.infinity,
                                  child: CustomButton(
                                    borderRadius: 8,
                                    text: 'Mark as Completed',
                                    onPressed: () {
                                      // Handle form submission
                                    },
                                    backgroundColor: AppColors.secondaryColor,
                                    textColor: AppColors.primaryColor,
                                  ),
                                ),
                                SizedBox(height: 40),
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
