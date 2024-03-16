import 'package:chefease/constants/responsive.dart';
import 'package:chefease/widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../constants/colors.dart';
import '../../../widgets/buttons.dart';
import 'AddDonationRequestScreen.dart';
import 'DonationRequestDetailsScreen.dart';

class DonationRequestsScreen extends StatefulWidget {
  const DonationRequestsScreen({super.key});

  @override
  State<DonationRequestsScreen> createState() => _DonationRequestsScreenState();
}

class _DonationRequestsScreenState extends State<DonationRequestsScreen> {
  @override
  Widget build(BuildContext context) {
    double _screenheight = Responsive.screenHeight(context);
    double _screenwidth = Responsive.screenWidth(context);

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
        title: AppLiteText(
          text: 'Donation Requests',
          color: AppColors.textColor,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddDonationRequestScreen(),
              ));
        },
        child: const Icon(
          Icons.add,
          color: AppColors.secondaryColor,
        ),
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
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
                          children: [AppMainText(text: 'Title')],
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DonationRequestDetails(),
                              ),
                            );
                          },
                          child: AppLiteText(
                              text: 'View Details',
                              color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: _screenwidth * 0.03,
                    ),
                    AppLiteText(
                      text:
                          'Gorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla  Gorem ipsum dolor sit amet.',
                    ),
                    SizedBox(
                      height: _screenwidth * 0.03,
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
                      width: _screenwidth * 0.8,
                      lineHeight: 14.0,
                      percent: 0.35,
                      backgroundColor: Colors.black12,
                      progressColor: AppColors.primaryColor,
                      barRadius: Radius.circular(5),
                    ),
                    SizedBox(
                      height: _screenwidth * 0.03,
                    ),
                    CustomButton(
                        text: 'Donate Now',
                        onPressed: () {
                          // Add your onPressed code here!
                        })
                  ],
                ),
              )),
            );
          }),
    );
  }
}
