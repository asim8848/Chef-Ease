import 'package:chefease/screens/HomeScreen.dart';

import 'package:chefease/widgets/buttons.dart';
import 'package:chefease/widgets/form_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chefease/widgets/text_styles.dart';
import '../../constants/colors.dart';
import '../../constants/responsive.dart';
import '../../screens/chef/chef_dashboard/ChefDashboardScreen.dart';

import '../../screens/customer/profile/UserProfileScreen.dart';
import '../../screens/drawer_screens/AnalyticsInsightsScreen.dart';
import '../../screens/drawer_screens/EarningsScreen.dart';
import '../../screens/drawer_screens/Help&SupportScreen.dart';
import '../../screens/drawer_screens/SettingsScreen.dart';
import '../../screens/drawer_screens/TermsConditionsScreen.dart';



class ChefDrawerContent extends StatefulWidget {
  @override
  State<ChefDrawerContent> createState() => _DrawerContentState();
}

class _DrawerContentState extends State<ChefDrawerContent> {
  int _selectedIndex = -1; // Tracks the selected index of the tile

  @override
  Widget build(BuildContext context) {
    double _screenheight = Responsive.screenHeight(context);
    double _screenwidth = Responsive.screenWidth(context);

    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        width: _screenwidth * 0.7,
        height: _screenheight,
        child: Column(
          children: [
            // Profile image and text
            Container(
              width: _screenwidth * 0.25,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                color: Colors.black26,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'assets/imgs/person1circle.png',
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: _screenheight * 0.02,
            ),
            AppMainText(
              text: 'Jack lorem',
            ),
            SizedBox(
              height: _screenheight * 0.02,
            ),
            GestureDetector(
              onTap: () {
                // Navigate to profile screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserProfileScreen()),
                );
              },
              child: AppLiteText(
                text: 'View Profile',
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(
              height: 20,
              thickness: 1,
            ),
            // List of tiles
            Expanded(
              flex: 6,
              child: Column(
                children: List.generate(
                  6,
                  (index) => Flexible(
                    child: ListTile(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index; //
                          if (_getTileTitle(index) == 'Customer Mode') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return HomeScreen();
                                },
                              ),
                            );
                          } else {
                            // Handle navigation for other tiles if needed
                          }
                          if (_getTileTitle(index) == 'Settings') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Settings();
                                },
                              ),
                            );
                          } else {
                            // Handle navigation for other tiles if needed
                          }
                        });
                        if (_getTileTitle(index) == 'Help/Support') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return HelpSupport();
                              },
                            ),
                          );
                        } else {
                          // Handle navigation for other tiles if needed
                        }
                        if (_getTileTitle(index) == 'Terms & Conditions') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return TermsConditions();
                              },
                            ),
                          );
                        } else {
                          // Handle navigation for other tiles if needed
                        }
                        if (_getTileTitle(index) == 'Analytics & Insights') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return AnalyticsInsights();
                              },
                            ),
                          );
                        } else {
                          // Handle navigation for other tiles if needed
                        }
                        if (_getTileTitle(index) == 'Earnings') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ChefEarnings();
                              },
                            ),
                          );
                        } else {
                          // Handle navigation for other tiles if needed
                        }
                      },
                      leading: Icon(
                        _getLeadingIcon(index), // Function to get leading icon
                        color:
                            _getTileColor(index), // Function to get tile color
                      ),
                      title: AppLiteText(
                        text:
                            _getTileTitle(index), // Function to get tile title
                        color:
                            _getTileColor(index), // Function to get tile color
                      ),
                      contentPadding: const EdgeInsets.only(left: 40),
                      selectedTileColor:
                          AppColors.primaryColor.withOpacity(0.2),
                      iconColor: AppColors.textColor,
                      horizontalTitleGap: 0,
                      selected:
                          _selectedIndex == index, // Check if tile is selected
                    ),
                  ),
                ),
              ),
            ),
            // Logout button
            Container(
              width: _screenwidth,
              height: _screenheight * 0.08,
              color: AppColors.primaryColor,
              child: Center(
                child: ListTile(
                  leading: Icon(
                    Icons.exit_to_app_outlined,
                    color: AppColors.secondaryColor,
                  ),
                  title: AppLiteText(
                    text: 'Signup or Login',
                    color: Colors.white,
                    fontFamily: 'Poppins',
                  ),
                  contentPadding: const EdgeInsets.only(left: 40),
                  onTap: () {
                    showModalBottomSheet<void>(
                      isScrollControlled:
                          true, // Make the bottom sheet height match its content
                      showDragHandle: true,
                      useSafeArea: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      backgroundColor: Colors.white,
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(
                          builder:
                              (BuildContext context, StateSetter setState) {
                            final screenHeight =
                                MediaQuery.of(context).size.height;
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: screenHeight * 0.02),
                                  AppMainText(text: 'Signup or Login'),
                                  SizedBox(height: screenHeight * 0.02),
                                  AppTextFormField(
                                    hintText: 'chefease@gmail.com',
                                    keyboardType: TextInputType.emailAddress,
                                    icon: Icons.email_outlined,
                                  ),
                                  SizedBox(height: screenHeight * 0.02),
                                  AppTextFormField(
                                    hintText: 'Password',
                                    keyboardType: TextInputType.visiblePassword,
                                    icon: Icons.lock_outline,
                                    obscureText: true,
                                  ),
                                  SizedBox(height: screenHeight * 0.02),
                                  CustomButton(
                                    text: 'Continue',
                                    width: 0.9,
                                    height: 0.07,
                                    borderRadius: 15,
                                    onPressed: () {},
                                  ),
                                  SizedBox(height: screenHeight * 0.02),
                                  CustomButton(
                                    icon: Icons.g_mobiledata_outlined,
                                    text: 'Continue with Google',
                                    width: 0.9,
                                    height: 0.07,
                                    borderRadius: 15,
                                    backgroundColor: AppColors.secondaryColor,
                                    textColor: AppColors.textColor,
                                    onPressed: () {},
                                  ),
                                  SizedBox(height: screenHeight * 0.02),
                                  CustomButton(
                                    icon: Icons.facebook_outlined,
                                    text: 'Continue with Facebook',
                                    width: 0.9,
                                    height: 0.07,
                                    borderRadius: 15,
                                    backgroundColor: Color(0xFF5864CD),
                                    textColor: AppColors.secondaryColor,
                                    onPressed: () {},
                                  ),
                                  SizedBox(height: screenHeight * 0.02),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getLeadingIcon(int index) {
    // Add logic to determine the leading icon based on index
    // Example:
    switch (index) {
      case 0:
        return Icons.settings;
      case 1:
        return Icons.help_outline_outlined;
      case 2:
        return Icons.maps_home_work_outlined;
      case 3:
        return Icons.task_outlined;
      case 4:
        return Icons.attach_money_outlined;
      case 5:
        return Icons.auto_graph_outlined;
      default:
        return Icons.settings;
    }
  }

  String _getTileTitle(int index) {
    // Add logic to determine the tile title based on index
    // Example:
    switch (index) {
      case 0:
        return 'Settings';
      case 1:
        return 'Help/Support';
      case 2:
        return 'Customer Mode';
      case 3:
        return 'Terms & Conditions';
      case 4:
        return 'Earnings';
      case 5:
        return 'Analytics & Insights';
      default:
        return 'Settings';
    }
  }

  Color _getTileColor(int index) {
    // Return the tile color based on the selected state
    return _selectedIndex == index
        ? AppColors.primaryColor
        : AppColors.textColor;
  }
}
