import 'package:chefease/widgets/text_styles.dart';
import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/responsive.dart';
import '../../widgets/buttons.dart';
import '../../widgets/form_fields.dart';

class ChefProfileSetupScreen extends StatefulWidget {
  const ChefProfileSetupScreen({super.key});

  @override
  State<ChefProfileSetupScreen> createState() => _ChefProfileSetupScreenState();
}

class _ChefProfileSetupScreenState extends State<ChefProfileSetupScreen> {
  // Add state variables for form fields

  @override
  Widget build(BuildContext context) {
    double _screenheight = Responsive.screenHeight(context);
    double _screenwidth = Responsive.screenWidth(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Your Chef Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: _screenheight * 0.01), // 1% of screen height
            // Personal Information Heading
            AppMainText(
              text:"Personal Information",
              fontSize: _screenwidth * 0.045, // 4% of screen width
            ),
            SizedBox(height: _screenheight * 0.03), // 3% of screen height

            // Profile Image Upload
            Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: _screenwidth * 0.125, // 12.5% of screen width
                    backgroundColor: Colors.grey[200],
                    child: Icon(Icons.camera_alt_outlined, size: _screenwidth * 0.1), // 10% of screen width
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Implement image upload functionality
                  },
                  icon: Icon(Icons.camera_alt, size: _screenwidth * 0.06), // 6% of screen width
                ),
              ],
            ),
            SizedBox(height: _screenheight * 0.02), // 2% of screen height

            AppLiteText(text: "Name",fontSize: _screenwidth * 0.04,fontWeight: FontWeight.w500,), // 4% of screen width
            SizedBox(height: _screenheight * 0.005), // 0.5% of screen height
            // Form Fields
            AppTextFormField(
              hintText: 'Name',
              icon: Icons.person_2_outlined,
              fontSize: _screenwidth * 0.030,
            ),
            SizedBox(height: _screenheight * 0.015), // 1.5% of screen height
            AppLiteText(text: "Email",fontSize: _screenwidth * 0.04,fontWeight: FontWeight.w500,), // 4% of screen width
            SizedBox(height: _screenheight * 0.005), // 0.5% of screen height
            AppTextFormField(
              hintText: 'Email',
              icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
              fontSize: _screenwidth * 0.030,
            ),
            SizedBox(height: _screenheight * 0.015), // 1.5% of screen height
            AppLiteText(text: "Password",fontSize: _screenwidth * 0.04,fontWeight: FontWeight.w500,), // 4% of screen width
            SizedBox(height: _screenheight * 0.005), // 0.5% of screen height
            AppTextFormField(
              hintText: 'Password',
              icon: Icons.lock_outline,
              obscureText: true,
              fontSize: _screenwidth * 0.030,
            ),
            SizedBox(height: _screenheight * 0.015), // 1.5% of screen height
            AppLiteText(text: "Confirm Password",fontSize: _screenwidth * 0.04,fontWeight: FontWeight.w500,), // 4% of screen width
            SizedBox(height: _screenheight * 0.005), // 0.5% of screen height
            AppTextFormField(
              hintText: 'Confirm Password',
              icon: Icons.lock_outline,
              obscureText: true,
              fontSize: _screenwidth * 0.030,
            ),
            SizedBox(height: _screenheight * 0.02), // 2% of screen height

            // Contact Information Heading
            AppMainText(
              text:"Contact Information",
              fontSize: _screenwidth * 0.045, // 4% of screen width
            ),
            SizedBox(height: _screenheight * 0.02), // 2% of screen height
            AppLiteText(text: "Phone Number",fontSize: _screenwidth * 0.04,fontWeight: FontWeight.w500,), // 4% of screen width
            SizedBox(height: _screenheight * 0.005), // 0.5% of screen height
            // Contact Form Fields
            AppTextFormField(
              hintText: 'Phone Number',
              icon: Icons.phone_outlined,
              keyboardType: TextInputType.phone,
              fontSize: _screenwidth * 0.030,
            ),
            SizedBox(height: _screenheight * 0.015), // 1.5% of screen height
            AppLiteText(text: "Address",fontSize: _screenwidth * 0.04,fontWeight: FontWeight.w500,), // 4% of screen width
            SizedBox(height: _screenheight * 0.005), // 0.5% of screen height
            AppTextFormField(
              icon: Icons.location_on_outlined,
              hintText: 'Address',
              fontSize: _screenwidth * 0.030,
            ),
            SizedBox(height: _screenheight * 0.015), // 1.5% of screen height
            AppLiteText(text: "Location",fontSize: _screenwidth * 0.04,fontWeight: FontWeight.w500,), // 4% of screen width
            SizedBox(height: _screenheight * 0.005), // 0.5% of screen height
            AppTextFormField(
              icon: Icons.location_city_outlined,
              hintText: 'Location (City, Country)',
              fontSize: _screenwidth * 0.030,
            ),
            SizedBox(height: _screenheight * 0.015), // 1.5% of screen height
            AppLiteText(text: "Availability",fontSize: _screenwidth * 0.04,fontWeight: FontWeight.w500,), // 4% of screen width
            SizedBox(height: _screenheight * 0.005), // 0.5% of screen height
            AppTextFormField(
              icon: Icons.lock_clock,
              hintText: 'Availability (e.g., Weekdays, Weekends)',
              fontSize: _screenwidth * 0.030,
            ),
            SizedBox(height: _screenheight * 0.015), // 1.5% of screen height
            AppLiteText(text: "Skills",fontSize: _screenwidth * 0.04,fontWeight: FontWeight.w500,), // 4% of screen width
            SizedBox(height: _screenheight * 0.005), // 0.5% of screen height
            AppTextFormField(
              icon: Icons.work_outline,
              hintText: 'Skills & Expertise (e.g., Italian Cuisine, Baking)',
              fontSize: _screenwidth * 0.030,
            ),
            SizedBox(height: _screenheight * 0.025), // 2.5% of screen height

            // Continue Button
            Align(
              alignment: Alignment.center,
              child: CustomButton(
                borderRadius: _screenwidth * 0.0375, // 3.75% of screen width
                text: 'Continue',
                onPressed: () {
                  // Handle form submission
                },
                backgroundColor: AppColors.primaryColor,
                textColor: Colors.white,

              ),
            ),
          ],
        ),
      ),
    );
  }
}
