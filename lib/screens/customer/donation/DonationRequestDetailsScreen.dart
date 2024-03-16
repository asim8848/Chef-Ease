import 'package:chefease/constants/responsive.dart';
import 'package:chefease/widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../constants/colors.dart';
import '../../../widgets/buttons.dart';

class DonationRequestDetails extends StatefulWidget {
  const DonationRequestDetails({super.key});

  @override
  State<DonationRequestDetails> createState() => _DonationRequestDetailsState();
}

class _DonationRequestDetailsState extends State<DonationRequestDetails> {
  @override
  Widget build(BuildContext context) {
    double _screenwidth = Responsive.screenWidth(context);
    double _screenheight = Responsive.screenHeight(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.textColor,
          ),
        ),
        title: const AppLiteText(
          text: 'Request Details',
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Card(
            child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(0, 3), // changes position of shadow
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppMainText(
                        text: 'Need Doners for needy family',
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: _screenwidth * 0.03,
              ),
              AppLiteText(
                text:
                    'I am reaching out to you with a humble request for your support. I find family in a situation where access to food has become a daily struggle, and I am reaching out to ask for a family i know who are in desperate need of food and are not able to provide for their family you can find info below lorem Ipsum lorem Ipsum lorem Ipsum lorem Ipsum lorem Ipsum lorem Ipsum.',
              ),

              Divider(thickness: 1, height: 50),
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
              SizedBox(
                height: _screenwidth * 0.03,
              ),
              // LinearProgressIndicator(
              //   backgroundColor: AppColors.bgColor,
              //   color: AppColors.primaryColor,
              //   minHeight: 15,
              // ),
              new LinearPercentIndicator(
                width: Responsive.screenWidth(context) * 0.8,
                lineHeight: 14.0,
                percent: 0.35,
                backgroundColor: Colors.black12,
                progressColor: AppColors.primaryColor,
                barRadius: Radius.circular(5),
              ),
              SizedBox(
                height: _screenwidth * 0.04,
              ),
              CustomButton(
                  text: 'Donate Now',
                  onPressed: () {
                    // Add your onPressed code here!
                  })
            ],
          ),
        )),
      ),
    );
  }
}
