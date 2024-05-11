import 'package:chefease/constants/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../widgets/text_styles.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  @override
  Widget build(BuildContext context) {
    double _screenheight = Responsive.screenHeight(context);
    double _screenwidth = Responsive.screenWidth(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: AppMainText(
          text: 'Notifications',
          color: AppColors.secondaryColor,
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      body: ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(
            left: _screenwidth * 0.05, // 5% of screen width
            right: _screenwidth * 0.05, // 5% of screen width
            top: _screenheight * 0.01, // 1% of screen height
          ),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_screenwidth * 0.03), // 3% of screen width
            ),
            child: Padding(
              padding: EdgeInsets.all(_screenwidth * 0.03), // 3% of screen width
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: _screenwidth * 0.02), // 2% of screen width
                  Container(
                    width: _screenwidth * 0.125, // 12.5% of screen width
                    height: _screenwidth * 0.125, // 12.5% of screen width
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(160, 212, 104, 0.25),
                      borderRadius: BorderRadius.circular(_screenwidth * 0.0625), // 6.25% of screen width
                    ),
                    padding: EdgeInsets.all(_screenwidth * 0.02), // 2% of screen width
                    child: Icon(
                      Icons.car_crash_outlined,
                      size: _screenwidth * 0.075, // 7.5% of screen width
                      color: Color(0xFFA0D468),
                    ),
                  ),
                  SizedBox(width: _screenwidth * 0.05), // 5% of screen width
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppMainText(
                          text: 'Order Delivered',
                          fontSize: _screenwidth * 0.035, // 3.5% of screen width
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: _screenheight * 0.006), // 0.6% of screen height
                        AppLiteText(
                          text: 'Order number # 10098A has been successfully delivered',
                          fontSize: _screenwidth * 0.03, // 3% of screen width
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AppLiteText(
                        text: '11 min ago',
                        fontSize: _screenwidth * 0.025, // 2.5% of screen width
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    )

    );
  }
}
