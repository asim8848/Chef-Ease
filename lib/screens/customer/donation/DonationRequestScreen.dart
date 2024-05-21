import 'package:chefease/screens/customer/donation/showDonationModalBottomSheet.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../api/customer_api.dart';
import '../../../api/donation_api.dart';
import '../../../constants/colors.dart';
import '../../../constants/responsive.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/text_styles.dart';
import 'AddDonationRequestScreen.dart';
import 'DonationRequestDetailsScreen.dart';

class DonationRequestsScreen extends StatefulWidget {
  const DonationRequestsScreen({super.key});

  @override
  State<DonationRequestsScreen> createState() => _DonationRequestsScreenState();
}

class _DonationRequestsScreenState extends State<DonationRequestsScreen> {
  late Future<List<dynamic>> donationRequestsFuture;

  @override
  void initState() {
    super.initState();
    donationRequestsFuture = DonationApi().fetchAllDonationRequests();
  }

  Future<String> _getCustomerImage(String firebaseId) async {
    final customerData =
        await CustomerApi().getCustomerByFirebaseId(firebaseId);
    return customerData['ProfileImageURL'];
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
      body: FutureBuilder<List<dynamic>>(
        future: donationRequestsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No donation requests found.'));
          } else {
            final donationRequests = snapshot.data!;
            return ListView.builder(
              itemCount: donationRequests.length,
              itemBuilder: (context, index) {
                final donationRequest = donationRequests[index];
                final double percent = (donationRequest['CurrentAmount'] /
                        donationRequest['DonationAmount'])
                    .clamp(0.0, 1.0);
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
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              FutureBuilder<String>(
                                future: _getCustomerImage(
                                    donationRequest['CreatedBy']),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/imgs/person1circle.png'),
                                      radius: 20,
                                    );
                                  } else if (snapshot.hasError) {
                                    print(
                                        'Error fetching image: ${snapshot.error}');
                                    return CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/imgs/person1circle.png'),
                                      radius: 20,
                                    );
                                  } else {
                                    return CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(snapshot.data!),
                                      radius: 20,
                                    );
                                  }
                                },
                              ),
                              /*CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/imgs/person1circle.png'),
                                radius: 20,
                              ),*/
                              SizedBox(width: _screenwidth * 0.03),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: _screenwidth * 0.45,
                                    child: AppLiteText(
                                      text: donationRequest['Title'],
                                    ),
                                  )
                                ],
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DonationRequestDetails(
                                              donationRequestId:
                                                  donationRequest['_id']),
                                    ),
                                  );
                                },
                                child: AppLiteText(
                                  text: 'View Details',
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: _screenwidth * 0.03),
                          AppLiteText(
                            text: donationRequest['Description'],
                          ),
                          SizedBox(height: _screenwidth * 0.03),
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
                          SizedBox(height: _screenwidth * 0.03),
                          LinearPercentIndicator(
                            width: _screenwidth * 0.8,
                            lineHeight: 14.0,
                            percent: percent,
                            backgroundColor: Colors.black12,
                            progressColor: AppColors.primaryColor,
                            barRadius: Radius.circular(5),
                          ),
                          SizedBox(height: _screenwidth * 0.03),
                          CustomButton(
                            text: 'Donate Now',
                            onPressed: () {
                              showDonationModalBottomSheet(context);
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
