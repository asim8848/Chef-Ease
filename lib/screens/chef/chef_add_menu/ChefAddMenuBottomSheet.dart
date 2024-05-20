// ChefAddMenuBottomSheet.dart

import 'package:chefease/widgets/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chefease/constants/colors.dart';
import '../../../constants/responsive.dart';
import 'AddRecipeScreen.dart';
import 'UploadReelScreen.dart';

class ChefAddScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10.0,
        ),
        Expanded(
          child: _buildCustomButton(
            icon: Icons.add,
            text: 'Add Meal',
            onPressed: () async {
              // Check if user is logged in
              if (FirebaseAuth.instance.currentUser == null) {
                // User is not logged in, show toast
                AppToast().toastMessage('Please log in to add a meal.',
                    isError: true);
              } else {
                // User is logged in, navigate to AddMeal screen
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddRecipeScreen()));
              }
            },
            context: context,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Expanded(
          child: _buildCustomButton(
            icon: Icons.file_upload_outlined,
            text: 'Upload Reel',
            onPressed: () async {
              // Check if user is logged in
              if (FirebaseAuth.instance.currentUser == null) {
                // User is not logged in, show toast
                AppToast().toastMessage('Please log in to upload a reel.',
                    isError: true);
              } else {
                // User is logged in, navigate to AddPhotoVideo screen
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UploadReelScreen()));
              }
            },
            context: context,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
      ],
    );
  }

  Widget _buildCustomButton(
      {required IconData icon,
      required String text,
      required VoidCallback onPressed,
      required BuildContext context}) {
    return Padding(
      padding: EdgeInsets.all(10.0), // Add some padding
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10.0), // Add border radius
            boxShadow: [
              // Add shadow effect
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white, // Change icon color to white
                size: 50.0,
              ),
              Text(
                text,
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontFamily:
                        'Roboto'), // Change text color to white and use Roboto font
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
