import 'package:chefease/screens/chef/AddMealScreen.dart';
import 'package:chefease/screens/chef/AddPhotoVideoScreen.dart';
import 'package:chefease/screens/chef/ChefProfileSetup.dart';
import 'package:flutter/material.dart';
import 'package:chefease/constants/colors.dart';
import '../../constants/responsive.dart';
class AddBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _screenheight = Responsive.screenHeight(context);
    double _screenwidth = Responsive.screenWidth(context);
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: _screenwidth*0.02, vertical: _screenheight*0.01),
        height: _screenheight * 0.18,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFF7F50), Color(0xFFFF6347)],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildCustomButton(
              icon: Icons.add,
              text: 'Add Meal',
              onPressed: () {
                // Action for adding a meal
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddMeal()));
              }, context: context,
            ),

            _buildCustomButton(
              icon: Icons.file_upload_outlined,
              text: 'Upload Reel',
              onPressed: () {
                // Action for uploading reels
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddPhotoVideo()));
              }, context: context,
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildCustomButton({required IconData icon, required String text, required VoidCallback onPressed, required BuildContext context}) {
    double _screenheight = Responsive.screenHeight(context);
    double _screenwidth = Responsive.screenWidth(context);

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: _screenheight * 0.1, // 10% of screen height
        width: _screenwidth * 0.22, // 20% of screen width
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: AppColors.primaryColor,
              size: _screenwidth * 0.08, // 8% of screen width
            ),
            SizedBox(height: _screenheight * 0.01), // 1% of screen height
            Text(
              text,
              style: TextStyle(fontSize: _screenwidth * 0.03, color: AppColors.primaryColor), // Font size is 4% of screen width
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
