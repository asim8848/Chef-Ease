import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
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
                    fontSize: 20,
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
            Image(image: AssetImage('assets/imgs/donationgirl.png')),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Gorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla  Gorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla ",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
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
