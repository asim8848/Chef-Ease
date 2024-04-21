import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/responsive.dart';
import '../../../widgets/text_styles.dart';
import 'PostBidsScreen.dart';

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const PostBidsScreen();
          }));
        },
        child: const Icon(
          Icons.add,
          color: AppColors.secondaryColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          top: 20,
          right: 20.0,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            width: _screenwidth,
            height: _screenheight,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //if index is 0 then Active Bids text should be displayed and after that all the bids should be displayed but index 3 should be text Pending bids and after that all the bids should be displayed
                    if (index == 0) AppMainText(text: 'Active Bids'),
                    SizedBox(
                      height: _screenwidth * 0.03,
                    ),
                    if (index == 1) AppMainText(text: 'Pending Bids'),

                    SizedBox(
                      height: _screenwidth * 0.03,
                    ),
                    Card(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFFFFFFFF),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0.1,
                              blurRadius: 18,
                              offset: const Offset(
                                -10,
                                10,
                              ),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/imgs/person1circle.png'),
                                  radius: 20,
                                ),
                                SizedBox(
                                  width: _screenwidth * 0.03,
                                ),
                                Flexible(
                                  flex: 9,
                                  child: Text(
                                    'Need A Cheesy Pizza ASAP!',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Poppins',
                                        color: AppColors.textColor,
                                        fontSize: 14),
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.newspaper_outlined,
                                            size: _screenwidth * 0.05,
                                          ),
                                          SizedBox(
                                            width: _screenwidth * 0.01,
                                          ),
                                          Flexible(
                                            flex: 3,
                                            child: AppLiteText(
                                              text: "Offers: ",
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Flexible(
                                            child: AppLiteText(
                                              text: "5",
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.remove_red_eye_outlined,
                                            size: _screenwidth * 0.05,
                                          ),
                                          SizedBox(
                                            width: _screenwidth * 0.01,
                                          ),
                                          Flexible(
                                            flex: 20,
                                            child: AppLiteText(
                                              text: "Views: ",
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Flexible(
                                            flex: 8,
                                            child: AppLiteText(
                                              text: "70",
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Flexible(
                                            flex: 10,
                                            fit: FlexFit.tight,
                                            child: AppLiteText(
                                              text: "Status:",
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Flexible(
                                            flex: 6,
                                            fit: FlexFit.tight,
                                            child: AppLiteText(
                                              text: (index == 1)
                                                  ? 'Pending'
                                                  : 'Active',
                                              fontSize: 9,
                                              color: (index == 1)
                                                  ? Colors.red
                                                  : Colors.green,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: _screenwidth * 0.03,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
