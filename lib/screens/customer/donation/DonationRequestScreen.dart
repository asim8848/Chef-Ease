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
        title: const Text('Donation Requests',
            style: TextStyle(
              fontSize: 17,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            )),
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
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Title',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
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
                          child: Text(
                            'View Details',
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                color: AppColors.primaryColor),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Gorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla  Gorem ipsum dolor sit amet.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 20,
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
            );
          }),
    );
  }
}
