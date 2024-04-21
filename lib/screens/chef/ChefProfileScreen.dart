
import 'package:flutter/material.dart';

import 'tabs/ChefMenuTab.dart';
import 'tabs/ChefPicturesTab.dart';
import 'tabs/ChefReelsTab.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final  height=MediaQuery.sizeOf(context).height*1;
    final  width=MediaQuery.sizeOf(context).width*1;
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            // Navigate back when the button is pressed
            Navigator.pop(context);
          },
        ),
        title: const Text("Profile"),
      ),
      body: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width * 0.26,
                height: height* 0.12 ,
                decoration: ShapeDecoration(
                  image: const DecorationImage(
                    image: AssetImage("assets/imgs/reels_pic.jpg"),
                    fit: BoxFit.cover,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Anna',
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
                '@anna89',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0x6D1E1E1E),
                  fontSize: height * 0.02,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,

                ),
              ),
              SizedBox(height: height * 0.02,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '4.8',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xCC1E1E1E),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w900,

                    ),
                  ),
                  Text(
                    '10 Yrs',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xCC1E1E1E),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w900,

                    ),
                  ),
                  Text(
                    '2',
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
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                    width: 140,
                    height: 45,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFFF6A42),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                    ),
                    child: const Center(
                      child: Text(
                        'Message',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 0.11,
                          letterSpacing: -0.12,
                        ),
                      ),
                    )
                ),
              ),
              const SizedBox(height: 20,),

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
              const SizedBox(height: 5,),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Yorem ipsum dolor sit amet, consectetur adipiscing\n elit. Nunc vulputate libero et velit interdum, ac\n aliquet odio mattis.',
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
          const SizedBox(height: 10,),
          const DefaultTabController(
            length: 3, // Changed length to 2 since there are 2 tabs
            child: Expanded(
              child: Column(
                children: [
                  TabBar(
                    labelColor: Color(0xFFFF6A42),
                    indicatorColor: Color(0xFFFF6A42),
                    tabs: [
                      Tab( icon: Icon(Icons.grid_view_outlined),),
                      Tab( icon: Icon(Icons.menu_outlined),),
                      Tab( icon: Icon(Icons.video_collection_outlined),),

                    ],
                  ),

                  Expanded(
                    child: TabBarView(
                      children: [
                        UserPictures(),
                        UserProfileMenu(),
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
