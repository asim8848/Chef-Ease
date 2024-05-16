import 'package:chefease/constants/colors.dart';
import 'package:chefease/widgets/buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/responsive.dart';
import '../../widgets/form_fields.dart';
import '../../widgets/text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth
import '../../../api/customer_api.dart'; // Import the CustomerApi class
import 'package:fluttertoast/fluttertoast.dart';
import '../../screens/HomeScreen.dart';
import '../../widgets/toast.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _obscureOldPassword = true;
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;
  bool _deliveryNotifications = false;
  bool _paymentNotifications = false;
  bool _messageNotifications = false;
  final _auth = FirebaseAuth.instance; // Create an instance of FirebaseAuth
  final _customerApi = CustomerApi(); // Create an instance of CustomerApi

  @override
  Widget build(BuildContext context) {
    double _screenHeight = Responsive.screenHeight(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: AppMainText(
          text: 'Settings',
          color: AppColors.textColor,
          fontSize: 18,
        ),
        backgroundColor: AppColors.secondaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(_screenHeight * 0.02),
        child: ListView(
          children: <Widget>[
            SizedBox(height: _screenHeight * 0.02), // 2% of screen height
            buildSettingOption(
                'Change Password', Icons.lock_outline, _changePasswordPressed),
            buildSettingOption('Notification Settings',
                Icons.notifications_outlined, _notificationSettingsPressed),
            buildSettingOption(
                'Privacy', Icons.privacy_tip_outlined, _privacyPressed),
            buildSettingOption(
                'Delete Account', Icons.delete_outline, _deleteAccountPressed),
          ],
        ),
      ),
    );
  }

  Widget buildSettingOption(
      String title, IconData icon, VoidCallback onPressed) {
    double _screenheight = Responsive.screenHeight(context);
    double _screenwidth = Responsive.screenWidth(context);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(
            bottom: _screenheight * 0.01), // 1% of screen height
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(_screenwidth * 0.03), // 3% of screen width
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
              Icon(icon,
                  color: AppColors.primaryColor,
                  size: _screenwidth * 0.06), // 6% of screen width
              SizedBox(width: _screenwidth * 0.04), // 4% of screen width
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: _screenwidth * 0.045,
                      fontWeight: FontWeight.bold,
                      color: Colors.black), // 4.5% of screen width
                ),
              ),
              Icon(Icons.arrow_forward_ios,
                  color: AppColors.primaryColor,
                  size: _screenwidth * 0.06), // 6% of screen width
            ],
          ),
        ),
      ),
    );
  }

  void _changePasswordPressed() {
    showModalBottomSheet(
      showDragHandle: true,
      enableDrag: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      backgroundColor: Colors.white,
      context: context,
      builder: (context) => _changePasswordBottomSheet(),
    );
  }

  void _notificationSettingsPressed() {
    showModalBottomSheet(
      showDragHandle: true,
      enableDrag: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      backgroundColor: Colors.white,
      context: context,
      builder: (context) => _notificationSettingsBottomSheet(),
    );
  }

  void _privacyPressed() {
    showModalBottomSheet(
      showDragHandle: true,
      enableDrag: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      backgroundColor: Colors.white,
      context: context,
      builder: (context) => _privacyBottomSheet(),
    );
  }

  void _deleteAccountPressed() {
    showModalBottomSheet(
      showDragHandle: true,
      enableDrag: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      backgroundColor: Colors.white,
      context: context,
      builder: (context) => _deleteAccountBottomSheet(),
    );
  }

  Widget _changePasswordBottomSheet() {
    double _screenheight = Responsive.screenHeight(context);
    double _screenwidth = Responsive.screenWidth(context);

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(_screenwidth * 0.05), // 5% of screen width
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: AppMainText(
                text: 'Change Password',
                fontSize: _screenwidth * 0.045, // 4.5% of screen width
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: _screenheight * 0.02), // 2% of screen height
            AppLiteText(
              text: 'Old Password',
              fontSize: _screenwidth * 0.035, // 3.5% of screen width
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: _screenheight * 0.01), // 1% of screen height
            AppTextFormField(
              hintText: 'Old Password',
              icon: Icons.lock,
              obscureText: _obscureOldPassword,
              suffixIcon: IconButton(
                icon: Icon(_obscureOldPassword
                    ? Icons.visibility
                    : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _obscureOldPassword = !_obscureOldPassword;
                  });
                },
              ),
            ),
            SizedBox(height: _screenheight * 0.02), // 2% of screen height
            AppLiteText(
              text: 'New Password',
              fontSize: _screenwidth * 0.035, // 3.5% of screen width
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: _screenheight * 0.01), // 1% of screen height
            AppTextFormField(
              hintText: 'New Password',
              icon: Icons.lock,
              obscureText: _obscureNewPassword,
              suffixIcon: IconButton(
                icon: Icon(_obscureNewPassword
                    ? Icons.visibility
                    : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _obscureNewPassword = !_obscureNewPassword;
                  });
                },
              ),
            ),
            SizedBox(height: _screenheight * 0.02), // 2% of screen height
            AppTextFormField(
              hintText: 'Confirm New Password',
              icon: Icons.lock,
              obscureText: _obscureConfirmPassword,
              suffixIcon: IconButton(
                icon: Icon(_obscureConfirmPassword
                    ? Icons.visibility
                    : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _obscureConfirmPassword = !_obscureConfirmPassword;
                  });
                },
              ),
            ),
            SizedBox(height: _screenheight * 0.03), // 3% of screen height
            Center(
              child: CustomButton(
                borderRadius: _screenwidth * 0.03, // 3% of screen width
                text: 'Save',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _notificationSettingsBottomSheet() {
    double _screenheight = Responsive.screenHeight(context);
    double _screenwidth = Responsive.screenWidth(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: AppMainText(
              text: 'Notification Settings',
              fontSize: _screenwidth * 0.045, // 4.5% of screen width
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: _screenheight * 0.02), // 2% of screen height
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: _screenwidth * 0.075), // 7.5% of screen width
            child: Column(
              // Inner column for notification settings
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  // Delivery Notifications
                  children: [
                    AppLiteText(
                      text: 'Delivery Notifications',
                      fontSize: _screenwidth * 0.04, // 4% of screen width
                      fontWeight: FontWeight.w400,
                    ),
                    Spacer(), // Add Spacer to push toggle button to the right
                    CupertinoSwitch(
                      value: _deliveryNotifications,
                      onChanged: (value) =>
                          setState(() => _deliveryNotifications = value),
                    ),
                  ],
                ),
                SizedBox(height: _screenheight * 0.01), // 1% of screen height
                Row(
                  // Payment Notifications
                  children: [
                    AppLiteText(
                      text: 'Payment Notifications',
                      fontSize: _screenwidth * 0.04, // 4% of screen width
                      fontWeight: FontWeight.w400,
                    ),
                    Spacer(),
                    CupertinoSwitch(
                      value: _paymentNotifications,
                      onChanged: (value) =>
                          setState(() => _paymentNotifications = value),
                    ),
                  ],
                ),
                SizedBox(height: _screenheight * 0.01), // 1% of screen height
                Row(
                  // Message Notifications
                  children: [
                    AppLiteText(
                      text: 'Message Notifications',
                      fontSize: _screenwidth * 0.04, // 4% of screen width
                      fontWeight: FontWeight.w400,
                    ),
                    Spacer(),
                    CupertinoSwitch(
                      value: _messageNotifications,
                      onChanged: (value) =>
                          setState(() => _messageNotifications = value),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: _screenheight * 0.015), // 1.5% of screen height
          Center(
            child: CustomButton(
              borderRadius: _screenwidth * 0.03, // 3% of screen width
              text: 'Save',
              onPressed: () {},
            ),
          ),
          SizedBox(height: _screenheight * 0.01), // 1% of screen height
        ],
      ),
    );
  }

  Widget _privacyBottomSheet() {
    return Center(child: Text('Privacy Bottom Sheet'));
  }

  Widget _deleteAccountBottomSheet() {
    double _screenheight = Responsive.screenHeight(context);
    double _screenwidth = Responsive.screenWidth(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: _screenwidth * 0.175), // 17.5% of screen width
            child: AppMainText(
              text: 'Are you sure you want to delete your account permanently?',
              fontSize: _screenwidth * 0.045, // 4.5% of screen width
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: _screenheight * 0.03), // 3% of screen height
// In SettingsScreen.dart
          Center(
            child: CustomButton(
              borderRadius: _screenwidth * 0.03, // 3% of screen width
              text: 'Yes',
              onPressed: () async {
                final firebaseUser = FirebaseAuth.instance.currentUser;
                if (firebaseUser != null) {
                  final response =
                      await _customerApi.deleteCustomer(firebaseUser.uid);
                  if (response.statusCode == 200) {
                    // Delete the Firebase user
                    await firebaseUser.delete();
                    // Handle successful deletion
                    AppToast().toastMessage("Account deleted successfully");
                    // Navigate to HomeScreen
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                      (Route<dynamic> route) =>
                          false, // remove all previous routes
                    );
                  } else {
                    // Handle error
                    AppToast().toastMessage(
                        "Error occurred during account deletion",
                        isError: true);
                  }
                }
              },
            ),
          ),
          SizedBox(height: _screenheight * 0.02), // 2% of screen height
          Center(
            child: CustomButton(
              borderRadius: _screenwidth * 0.03, // 3% of screen width
              text: 'No',
              onPressed: () {
                Navigator.pop(context); // Close the bottom sheet
              },
            ),
          ),
          SizedBox(height: _screenheight * 0.02), // 2% of screen height
        ],
      ),
    );
  }
}
