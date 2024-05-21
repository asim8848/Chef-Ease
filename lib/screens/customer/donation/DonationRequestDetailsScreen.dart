import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../api/donation_api.dart';
import '../../../constants/colors.dart';
import '../../../constants/responsive.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/text_styles.dart';
import 'showDonationModalBottomSheet.dart';

class DonationRequestDetails extends StatefulWidget {
  final String donationRequestId;

  const DonationRequestDetails({required this.donationRequestId, Key? key})
      : super(key: key);

  @override
  State<DonationRequestDetails> createState() => _DonationRequestDetailsState();
}

class _DonationRequestDetailsState extends State<DonationRequestDetails> {
  late Future<Map<String, dynamic>> donationRequestFuture;

  @override
  void initState() {
    super.initState();
    donationRequestFuture =
        DonationApi().fetchDonationRequestById(widget.donationRequestId);
  }

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
      body: FutureBuilder<Map<String, dynamic>>(
        future: donationRequestFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('Donation request not found.'));
          } else {
            final donationRequest = snapshot.data!;
            final double percent = (donationRequest['CurrentAmount'] /
                    donationRequest['DonationAmount'])
                .clamp(0.0, 1.0);

            return SingleChildScrollView(
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
                        offset:
                            const Offset(0, 3), // changes position of shadow
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
                              SizedBox(
                                width: _screenwidth * 0.7,
                                child: AppMainText(
                                  text: donationRequest['Title'],
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: _screenwidth * 0.03,
                      ),
                      SizedBox(
                        width: _screenwidth * 0.9,
                        child: AppLiteText(
                          text: donationRequest['Description'],
                        ),
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
                            text: donationRequest['BeneficiaryName'],
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
                            text: donationRequest['ContactNumber'],
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
                            text: "${donationRequest['MealQuantity']} Meals",
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
                            text: "${donationRequest['DonationAmount']} PKR",
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
                            text:
                                "${donationRequest['CurrentAmount']} / ${donationRequest['DonationAmount']} PKR",
                            color: Colors.black38,
                          ),
                          Spacer(),
                          AppLiteText(
                            text: "${(percent * 100).toStringAsFixed(1)}%",
                            color: AppColors.primaryColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: _screenwidth * 0.03,
                      ),
                      LinearPercentIndicator(
                        width: Responsive.screenWidth(context) * 0.8,
                        lineHeight: 14.0,
                        percent: percent,
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
                            showDonationModalBottomSheet(context);
                          })
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
