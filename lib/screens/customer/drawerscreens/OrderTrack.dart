
import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../../constants/responsive.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/text_styles.dart';

class OrderTrack extends StatefulWidget {
  const OrderTrack({Key? key}) : super(key: key);

  @override
  State<OrderTrack> createState() => _OrderTrackState();
}

class _OrderTrackState extends State<OrderTrack> {
  bool _bottomSheetVisible = false;
  double progress = 0.2;
  int activeStep = 0;

  @override
  Widget build(BuildContext context) {
    double _screenheight = Responsive.screenHeight(context);
    double _screenwidth = Responsive.screenWidth(context);
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Center(
            child: AppLiteText(
              text: 'Completion Time',
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: AppMainText(
              text: '45 min',
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryColor,
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Image(image: AssetImage('assets/imgs/Scene.png')),
          ),
          SizedBox(height: 20),

          // Insert the AnotherStepper widget here
          Padding(
            padding: const EdgeInsets.only(left:140),
            child: AnotherStepper(
              stepperList: [
                StepperData(
                  title: StepperText(
                    "Order Placed",
                  ),
                  subtitle: StepperText("10:32 AM"),
                  iconWidget: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: const Icon(CupertinoIcons.clock, color: Colors.white),
                  ),
                ),
                StepperData(
                  title: StepperText("Order Accepted"),
                  subtitle: StepperText("10:32 AM"),
                  iconWidget: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: const Icon(Icons.book_outlined, color: Colors.white),
                  ),
                ),
                StepperData(
                  title: StepperText("Order Completed"),
                  subtitle: StepperText("10:32 AM"),
                  iconWidget: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: const Icon(Icons.delivery_dining_rounded, color: Colors.white),
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

          SizedBox(height: 10,),
       
          Center(
            child: CustomButton(
              icon: Icons.arrow_drop_up_outlined,
              borderRadius: 16, // 3.75% of screen width
              text: 'Order Details',
              onPressed: () {
                showModalBottomSheet(
                  showDragHandle: true,
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Stack(
                              children: [
                                Container(
                                  width: _screenwidth * 0.18,
                                  height: _screenwidth * 0.18,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey[200], // Background color for the avatar
                                  ),
                                  child: Center(
                                    child: CircleAvatar(
                                      radius: _screenwidth * 0.085, // Adjust the radius according to your needs
                                      backgroundImage: AssetImage('assets/imgs/person1circle.png'), // Provide the path to your image asset
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20), // Add some space between the avatar and the text
                          Text(
                            'Chef: Anna’s Kitchen',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'INVOICE: 12A679',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[800]),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Order Name: Peperoni Special Pizza',
                            style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Total: 1500 Rs.',
                            style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              backgroundColor: AppColors.primaryColor,
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
