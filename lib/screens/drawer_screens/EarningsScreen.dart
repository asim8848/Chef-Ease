import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../constants/colors.dart';
import '../../constants/responsive.dart';
import '../../widgets/text_styles.dart';
import 'ManagePaymentMethodScreen.dart';

class ChefEarnings extends StatefulWidget {
  const ChefEarnings({Key? key}) : super(key: key);

  @override
  State<ChefEarnings> createState() => _ChefEarningsState();
}

class _ChefEarningsState extends State<ChefEarnings> {
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
          text: 'Earnings',
          fontSize: 18,
          color: AppColors.textColor,
        ),
        backgroundColor: AppColors.secondaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: _screenwidth * 0.020, // 2.5% of screen width
              right: _screenwidth * 0.05, // 5% of screen width
              top: _screenheight * 0.020, // 2.5% of screen height
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // First Container with larger height
                Padding(
                  padding: EdgeInsets.all(_screenwidth * 0.02), // 2% of screen width
                  child: Container(
                    height: _screenheight * 0.220, // 47.5% of screen height
                    width: _screenwidth * 0.396, // 42.5% of screen width
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    padding: EdgeInsets.all(_screenwidth * 0.04), // 4% of screen width
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: AppMainText(
                            text: '\$500',
                            color: AppColors.secondaryColor,
                            fontSize: _screenwidth * 0.065, // 7.5% of screen width
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Center(
                          child: AppLiteText(
                            text: 'Total Earnings',
                            color: AppColors.secondaryColor,
                            fontSize: _screenwidth * 0.040, // 4.5% of screen width
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: _screenwidth*0.01,),
                // Second and Third Containers on the right side
                Padding(
                  padding: EdgeInsets.only(top: _screenheight * 0.011), // 1% of screen height
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: _screenheight * 0.002), // 0.2% of screen height
                        child: Container(
                            width: _screenwidth * 0.48, // 52% of screen width
                            height: _screenheight * 0.1028, // 11.25% of screen height
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.primaryColor), // Add border
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            padding: EdgeInsets.all(_screenwidth * 0.04), // 4% of screen width
                            child: Column(
                              children: [
                                Center(
                                  child: AppMainText(text:
                                  '\$200',
                                    color: AppColors.primaryColor,
                                    fontSize: _screenwidth * 0.055, // 5.5% of screen width
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Center(
                                  child: AppLiteText(text:
                                  'Total Tips',
                                    color: AppColors.primaryColor,
                                    fontSize: _screenwidth * 0.0375, // 3.75% of screen width
                                  ),
                                ),
                              ],
                            )),
                      ),
                      SizedBox(height: _screenheight * 0.0075), // 0.75% of screen height
                      Container(
                          width: _screenwidth * 0.48, // 52% of screen width
                          height: _screenheight * 0.1028, // 11.25% of screen height
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.primaryColor), // Add border
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          padding: EdgeInsets.all(_screenwidth * 0.04), // 4% of screen width
                          child: Column(
                            children: [
                              Center(
                                child: AppMainText(text:
                                '\$300',
                                  color: AppColors.primaryColor,
                                  fontSize: _screenwidth * 0.055, // 5.5% of screen width
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Center(
                                child: AppLiteText(text:
                                'Order Earnings',
                                  color: AppColors.primaryColor,
                                  fontSize: _screenwidth * 0.0375, // 3.75% of screen width
                                ),
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
          SizedBox(height: _screenheight * 0.0125), // 1.25% of screen height
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: _screenwidth * 0.05), // 5% of screen width
                child: AppMainText(
                  text: 'Recent Transactions',
                  fontSize: _screenwidth * 0.045, // 4.5% of screen width
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextButton(
                onPressed: () {
                  // Add your onPressed logic here
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: _screenheight * 0.0125, // 1.25% of screen height
                    horizontal: _screenwidth * 0.03, // 3% of screen width
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(right: _screenwidth * 0.045), // 4.5% of screen width
                  child: AppLiteText(
                    text: 'See All',
                    fontSize: _screenwidth * 0.035, // 3.5% of screen width
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: _screenwidth * 0.05, vertical: _screenheight * 0.01),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryColor), // Orange border
                    borderRadius: BorderRadius.circular(_screenwidth * 0.02), // Circular border radius
                  ),
                  child: ListTile(
                    leading: Container(
                      width: _screenwidth * 0.115,
                      height: _screenwidth * 0.115,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(160, 212, 104, 0.25),
                        borderRadius: BorderRadius.circular(_screenwidth * 0.0625),
                      ),
                      padding: EdgeInsets.all(_screenwidth * 0.02),
                      child: Icon(
                        Icons.arrow_right_alt_outlined,
                        size: _screenwidth * 0.070,
                        color: Color(0xFFA0D468),
                      ),
                    ),
                    title: AppMainText(text:
                      'Welton',fontSize: 16,fontWeight: FontWeight.w500
                    ),
                    subtitle: AppLiteText(text:
                    'Today at 09:20 am',fontSize: 12,
                    ),
                    trailing: AppMainText(text:
                    '-\$570.00',fontSize: 16,fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              );
            },
          ),
          TextButton(
            onPressed: () {
              // Add your onPressed logic here
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ManagePaymentMethod()));
            },

            child: Center(
              child: AppLiteText(text:
              'Manage Payment Method',
                fontSize: 14,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],

      ),

    );
  }
}
