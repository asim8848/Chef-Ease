import 'package:chefease/screens/OrderTrack.dart';
import 'package:chefease/screens/TermsAndConditions.dart';
import 'package:flutter/material.dart';
import 'package:chefease/Constants/constants.dart';

class DrawerContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return SafeArea(
      child: Container(
        child: ListTileTheme(
          textColor: AppColors.textColor,
          iconColor: AppColors.textColor,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 128.0,
                height: 128.0,
                margin: const EdgeInsets.only(
                  top: 0.0,
                  bottom: 20.0,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/imgs/jack.png',
                  fit: BoxFit.fill,
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    width: 93 * screenWidth / 360,
                    height: 33,
                    child: Text(
                      'Jack lorem',
                      style: TextStyle(
                        color: Color(0xFF1E1E1E),
                        fontSize: 14 * textScaleFactor,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 1.71,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 78 * screenWidth / 360,
                    height: 33,
                    child: Text(
                      'View Profile',
                      style: TextStyle(
                        color: Color(0xFFFF6A42),
                        fontSize: 13 * textScaleFactor,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 1.85,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(),
              buildListTile(
                Icons.settings,
                'Settings',
                screenWidth,
                textScaleFactor,
                onTap: () {
                  // Add your Settings onTap logic here
                },
              ),
              buildListTile(
                Icons.help_outline_outlined,
                'Help/Support',
                screenWidth,
                textScaleFactor,
                onTap: () {
                  // Add your Help/Support onTap logic here
                },
              ),
              buildListTile(
                Icons.maps_home_work_outlined,
                'Chef Mode',
                screenWidth,
                textScaleFactor,
                onTap: () {
                  // Add your Chef Mode onTap logic here
                },
              ),
              buildListTile(
                Icons.task_outlined,
                'Terms & Conditions',
                screenWidth,
                textScaleFactor,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TermsAndConditionsScreen(),
                    ),
                  );
                },
              ),
              buildListTile(
                Icons.track_changes_outlined,
                'Orders Track',
                screenWidth,
                textScaleFactor,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderTrack(),
                    ),
                  );
                },
              ),
              buildListTile(
                Icons.request_page_outlined,
                'Bid Request',
                screenWidth,
                textScaleFactor,
                onTap: () {
                  // Add your Bid Request onTap logic here
                },
              ),
              Spacer(),
              Container(
                width: 307,
                height: 89,
                decoration: BoxDecoration(
                  color: Color(0xFFFF6A42),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 20),
                  child: ListTile(
                    onTap: () {
                      // Add your Signup or Login onTap logic here
                    },
                    leading: const Icon(
                      Icons.exit_to_app_outlined,
                      color: AppColors.secondaryColor,
                    ),
                    title: const Text(
                      'Signup or Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildListTile(
    IconData icon,
    String title,
    double screenWidth,
    double textScaleFactor, {
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: EdgeInsets.only(left: 20 * screenWidth / 360),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon),
        title: Text(
          title,
          style: TextStyle(
            color: Color(0xFF1E1E1E),
            fontSize: 14 * textScaleFactor,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            height: 1.71,
          ),
        ),
      ),
    );
  }
}
