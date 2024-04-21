import 'package:flutter/material.dart';


import '../../../constants/colors.dart';
import '../../../widgets/text_styles.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: AppMainText(text: "Profile",color: AppColors.secondaryColor,fontSize: 20,),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new,color: AppColors.secondaryColor),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Stack(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/imgs/jack.png'), // Change to your image path
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(5),
                    child: Icon(Icons.edit, color: AppColors.primaryColor),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(right: 200),
              child: AppMainText(text: "Personal Details"),
            ),
            SizedBox(height: 5),
            ProfileCard(
              icon: Icons.person_outlined,
              title: 'User Name',
              value: 'John Doe', // Replace with actual user name
            ),
            ProfileCard(
              icon: Icons.email_outlined,
              title: 'Email',
              value: 'johndoe@example.com', // Replace with actual email
            ),
            ProfileCard(
              icon: Icons.phone_outlined,
              title: 'Phone',
              value: '+1234567890', // Replace with actual phone number
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(right: 150),
              child: AppMainText(text: "Connected Accounts"),
            ),
            SizedBox(height: 10),
            ProfileCard(
              icon: Icons.email_rounded,
              title: 'Connected',
              value: 'link@gmail.com', // Replace with actual user name
            ),
            ProfileCard(
              icon: Icons.facebook_outlined,
              title: 'Connected',
              value: 'Lorem Ipsum', // Replace with actual email
            ),

          ],
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const ProfileCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 80,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 1,
            offset: Offset(0, 1),
            spreadRadius: 0,
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            Icon(icon, color: AppColors.textColor),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.edit),
              color: AppColors.primaryColor,
              onPressed: () {
                // Add functionality for editing profile details
              },
            ),
          ],
        ),
      ),
    );
  }
}
