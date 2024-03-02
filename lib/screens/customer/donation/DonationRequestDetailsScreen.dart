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
        title: const Text('Request Details',
            style: TextStyle(
              fontSize: 17,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            )),
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
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Need Doners for needy family',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'I am reaching out to you with a humble request for your support. I find family in a situation where access to food has become a daily struggle, and I am reaching out to ask for a family i know who are in desperate need of food and are not able to provide for their family you can find info below lorem Ipsum lorem Ipsum lorem Ipsum lorem Ipsum lorem Ipsum lorem Ipsum.',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                ),
              ),

              Divider(thickness: 1, height: 50),
              Row(
                children: [
                  Icon(
                    Icons.person_outline,
                    color: AppColors.primaryColor,
                    size: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Beneficiary Name : ",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),
                  Text(
                    "Jack",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: AppColors.textColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.phone_outlined,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Contact No : ",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),
                  Text(
                    "03175648614",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: AppColors.textColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.dinner_dining_outlined,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Meal Requirment : ",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),
                  Text(
                    "Rice x 5",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: AppColors.textColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.clean_hands_outlined,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Donation Amount : ",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),
                  Text(
                    "2000 PKR",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: AppColors.textColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text(
                    "75 / 200 Meals",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      color: Colors.black38,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "35%",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              // LinearProgressIndicator(
              //   backgroundColor: AppColors.bgColor,
              //   color: AppColors.primaryColor,
              //   minHeight: 15,
              // ),
              new LinearPercentIndicator(
                width: 330.0,
                lineHeight: 14.0,
                percent: 0.35,
                backgroundColor: Colors.black12,
                progressColor: AppColors.primaryColor,
                barRadius: Radius.circular(5),
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
