import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/responsive.dart';
import '../../../widgets/text_styles.dart';

class BidsReviewScreen extends StatefulWidget {
  const BidsReviewScreen({super.key});

  @override
  State<BidsReviewScreen> createState() => _BidsReviewScreenState();
}

class _BidsReviewScreenState extends State<BidsReviewScreen> {
  @override
  Widget build(BuildContext context) {
    double _screenwidth = Responsive.screenWidth(context);
    double _screenheight = Responsive.screenHeight(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: AppColors.textColor),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppMainText(
              text: 'Active Bids',
            ),
            SizedBox(
              height: _screenwidth * 0.05,
            ),
            Card(
                child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 9), // changes position of shadow
                  ),
                ],
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/imgs/person1circle.png'),
                        radius: 20,
                      ),
                      SizedBox(
                        width: _screenwidth * 0.03,
                      ),
                      Flexible(
                        // Use Flexible widget here
                        child: Text(
                          'Need A Cheesy Pizza ASAP!',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                              color: AppColors.textColor,
                              fontSize: 14),
                          overflow: TextOverflow
                              .visible, // Allow text to overflow and wrap to the next line
                        ),
                      ),
                      Spacer(),
                      AppLiteText(
                        text: '2 hrs left',
                        color: Colors.black38,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: _screenwidth * 0.03,
                  ),
                  AppLiteText(
                    text:
                        "I'm a student and I'm craving for a cheesy pizza. I'm out of cash and I can't go out to buy it. I need someone to deliver it to me. I'll pay you back as soon as I get my pocket money.",
                  ),
                  SizedBox(
                    height: _screenwidth * 0.03,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.newspaper_outlined,
                                size: _screenwidth * 0.04,
                              ),
                              SizedBox(
                                width: _screenwidth * 0.02,
                              ),
                              AppLiteText(
                                text: "Offers : ",
                                fontWeight: FontWeight.w500,
                              ),
                              AppLiteText(
                                text: "5",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.person_outline,
                        color: AppColors.primaryColor,
                        size: _screenwidth * 0.06,
                      ),
                      SizedBox(
                        width: _screenwidth * 0.03,
                      ),
                      AppMainText(
                        text: "Beneficiary Name : ",
                        fontSize: 14,
                      ),
                      AppLiteText(
                        text: "Jack",
                        fontSize: 14,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: _screenwidth * 0.03,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.phone_outlined,
                        color: AppColors.primaryColor,
                        size: _screenwidth * 0.06,
                      ),
                      SizedBox(
                        width: _screenwidth * 0.03,
                      ),
                      AppMainText(
                        text: "Contact No : ",
                        fontSize: 14,
                      ),
                      AppLiteText(
                        text: "0300-1234567",
                        fontSize: 14,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: _screenwidth * 0.03,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.dinner_dining_outlined,
                        color: AppColors.primaryColor,
                        size: _screenwidth * 0.06,
                      ),
                      SizedBox(
                        width: _screenwidth * 0.03,
                      ),
                      AppMainText(
                        text: "Meal Requirment : ",
                        fontSize: 14,
                      ),
                      AppLiteText(
                        text: "Rice x 5",
                        fontSize: 14,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: _screenwidth * 0.03,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.clean_hands_outlined,
                        color: AppColors.primaryColor,
                        size: _screenwidth * 0.06,
                      ),
                      SizedBox(
                        width: _screenwidth * 0.03,
                      ),
                      AppMainText(
                        text: "Donation Amount : ",
                        fontSize: 14,
                      ),
                      AppLiteText(
                        text: "2000 PKR",
                        fontSize: 14,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: _screenwidth * 0.05,
                  ),
                  Row(
                    children: [
                      AppLiteText(
                        text: "75 / 200 Meals",
                        color: Colors.black38,
                      ),
                      Spacer(),
                      AppLiteText(
                        text: "35%",
                        color: AppColors.primaryColor,
                      ),
                    ],
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
