import 'package:chefease/widgets/text_styles.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/responsive.dart';

class HelpSupport extends StatefulWidget {
  const HelpSupport({super.key});

  @override
  State<HelpSupport> createState() => _HelpSupportState();
}

class _HelpSupportState extends State<HelpSupport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: AppMainText(text: 'Help Support' ,  color: AppColors.textColor,   fontSize: 18,),
        backgroundColor: AppColors.secondaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 20),
            buildSettingOption('Get help with my orders',  _GetHelpOrderPressed),
            buildSettingOption('My Account',  _MyAccountPressed),
            buildSettingOption('FAQ',  _FAQPressed),
            buildSettingOption('Payment and Refunds',  _PaymentandRefunds),
            buildSettingOption('Safety Concerns', _SafetyConcerns),
            buildSettingOption('Contact Us',  _Contactus),
          ],
        ),
      ),
    );;
  }
  Widget buildSettingOption(String title, VoidCallback onPressed) {
    double _screenheight = Responsive.screenHeight(context);
    double _screenwidth = Responsive.screenWidth(context);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(bottom: _screenheight * 0.01), // 1% of screen height
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(_screenwidth * 0.03), // 3% of screen width
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: _screenwidth * 0.005, // 0.5% of screen width
              blurRadius: _screenwidth * 0.01, // 1% of screen width
              offset: Offset(0, _screenheight * 0.003), // 0.3% of screen height
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(_screenwidth * 0.04), // 4% of screen width
          child: Row(
            children: [
              SizedBox(width: _screenwidth * 0.04), // 4% of screen width
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(fontSize: _screenwidth * 0.04, fontWeight: FontWeight.w500, color: Colors.black), // 4% of screen width
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: AppColors.primaryColor, size: _screenwidth * 0.06), // 6% of screen width
            ],
          ),
        ),
      ),
    );
  }

  void _GetHelpOrderPressed() {
  }
  void _MyAccountPressed() {
  }
  void _FAQPressed() {
  }
  void _PaymentandRefunds() {
  }
  void _SafetyConcerns() {
  }
  void _Contactus() {
  }
}
