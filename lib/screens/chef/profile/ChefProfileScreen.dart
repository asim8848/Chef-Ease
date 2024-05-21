//path to this file: lib/screens/chef/profile/ChefProfileSetupScreen.dart
import 'package:chefease/screens/chef/chef_dashboard/ChefDashboardScreen.dart';
import 'package:chefease/screens/chef/profile/ChefProfileSetup.dart';
import 'package:chefease/widgets/buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../api/chef_api.dart';
import '../../../constants/colors.dart';
import '../../../widgets/text_styles.dart';
import '../tabs/ChefMenuTab.dart';
import '../tabs/ChefPicturesTab.dart';
import '../tabs/ChefReelsTab.dart';

class ChefProfileScreen extends StatefulWidget {
  final String chefId;

  ChefProfileScreen({Key? key, required this.chefId}) : super(key: key);

  @override
  State<ChefProfileScreen> createState() => _ChefProfileScreenState();
}

class _ChefProfileScreenState extends State<ChefProfileScreen> {
  Map<String, dynamic>? _chefData;

  @override
  void initState() {
    super.initState();
    _fetchChefData();
  }

  Future<void> _fetchChefData() async {
    final chefData = await ChefApi().getChef(widget.chefId);
    setState(() {
      _chefData = chefData;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        title: AppMainText(
          text: "Chef Profile",
          color: AppColors.textColor,
          fontSize: 18,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: AppColors.textColor),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => ChefDashboardScreen()),
              (route) => false,
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Navigate to ChefProfileSetup.dart..but after navigating..it should clear all the previous routes
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => ChefProfileSetupScreen()),
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_chefData != null)
                Container(
                  width: width * 0.26,
                  height: height * 0.12,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: NetworkImage(_chefData!['ProfileImageURL']),
                      fit: BoxFit.cover,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              if (_chefData != null)
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    _chefData!['Name'], // Replace 'Anna' with the actual name
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              Text(
                '@${_chefData?['Username'] ?? ''}', // Use null safety to prevent errors
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0x6D1E1E1E),
                  fontSize: height * 0.02,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    _chefData?['Rating'].toString() ?? 'N/A',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xCC1E1E1E),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    _chefData?['Experience'] ?? 'N/A',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xCC1E1E1E),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    _chefData?['Level'].toString() ?? 'N/A',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xCC1E1E1E),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Rating',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xAA98999C),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Experience',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xAA98999C),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  Text(
                    'Level',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xAA98999C),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              if (FirebaseAuth.instance.currentUser != null &&
                  FirebaseAuth.instance.currentUser!.uid != widget.chefId)
                CustomButton(
                  text: 'Message',
                  width: 0.5,
                  onPressed: () {
                    // Add code to message the chef
                  },
                ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Biography',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  _chefData?['Biography'] ??
                      'N/A', // Use null safety to prevent errors
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0x6D1E1E1E),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          DefaultTabController(
            length: 3, // Changed length to 2 since there are 2 tabs
            child: Expanded(
              child: Column(
                children: [
                  TabBar(
                    labelColor: Color(0xFFFF6A42),
                    indicatorColor: Color(0xFFFF6A42),
                    tabs: [
                      Tab(
                        icon: Icon(Icons.grid_view_outlined),
                      ),
                      Tab(
                        icon: Icon(Icons.menu_outlined),
                      ),
                      Tab(
                        icon: Icon(Icons.video_collection_outlined),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        UserPictures(),
                        _chefData != null
                            ? UserProfileMenu(
                                chefId: _chefData!['ChefFirebaseID'])
                            : Container(), // Show an empty container if _chefData is null
                        UserVideo(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
