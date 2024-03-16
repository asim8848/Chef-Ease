import 'package:chefease/widgets/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/responsive.dart';
import '../../../widgets/buttons.dart';
import 'DonationRequestScreen.dart';

class DonationMainScreen extends StatefulWidget {
  const DonationMainScreen({super.key});

  @override
  State<DonationMainScreen> createState() => _DonationMainScreenState();
}

class _DonationMainScreenState extends State<DonationMainScreen> {
  @override
  Widget build(BuildContext context) {
    double _screenheight = Responsive.screenHeight(context);
    double _screenwidth = Responsive.screenWidth(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(
                text: 'Donate Food',
                style: TextStyle(
                    fontSize: _screenwidth * 0.05,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor),
                children: <TextSpan>[
                  TextSpan(
                    text: ' to needy',
                    style: TextStyle(
                      color: AppColors.textColor,
                    ),
                  ),
                ],
              ),
            ),
            Image(
              image: AssetImage('assets/imgs/donationgirl.png'),
              fit: BoxFit.cover,
              height: _screenheight *
                  0.4, // 40% of screen height , 0.04 means 4% of screen height
            ),
            SizedBox(
              height: _screenheight * 0.02, // 2% of screen height
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: AppLiteText(
                  textAlign: TextAlign.center,
                  text:
                      "Gorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla  Gorem ipsum dolor sit amet, consectetur adipiscing elit.",
                )),
            SizedBox(
              height: _screenheight * 0.02,
            ),
            CustomButton(
              text: 'Get Started',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DonationRequestsScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
