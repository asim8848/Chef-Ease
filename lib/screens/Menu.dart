import 'package:chefease/Constants/constants.dart';
import 'package:chefease/screens/OrderMenu.dart';
import 'package:flutter/material.dart';
class Menu extends StatefulWidget {
  Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Color(0xffFBFBFB),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      width: 430,
                      height: 270,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/imgs/pizzamenu.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12, top: 12),
                          child: Container(
                            width: 81,
                            height: 85,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/imgs/person1.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween, // Align children to both ends of the row
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 60, top: 38),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text(
                                          'Anna’s Kitchen',
                                          style: TextStyle(
                                            color: Color(0xFF292D32),
                                            fontSize: 22,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            height: 0.09,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 14, left: 10),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.location_on,
                                              color: Colors.black,
                                              size: 16,
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              '1.1km away',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.share,
                                      color: AppColors.primaryColor),
                                  onPressed: () {
                                    // Add your share functionality here
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Icon(Icons.favorite,
                                      color: AppColors.primaryColor),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        width: 388,
                        height: 85,
                        decoration: ShapeDecoration(
                          color: Color(0xFFFF6A42),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 16, top: 18),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'Ratings: 4.5',
                                        style: TextStyle(
                                          color: Color(0xFFEEF5FF),
                                          fontSize: 16,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          height: 0.08,
                                          letterSpacing: -0.14,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8, right: 33),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'Pizza',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          height: 0.08,
                                          letterSpacing: -0.14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 30),
                                  child: Container(
                                    width: 45,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Color(0xFFFF6A42),
                                      size: 25,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 35),
                          child: Container(
                            width: 113,
                            height: 40,
                            padding: const EdgeInsets.only(
                              top: 12,
                              left: 14,
                              right: 16,
                              bottom: 12,
                            ),
                            decoration: ShapeDecoration(
                              color: Color(0xFFFF6A42),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Special Pizza',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    height: 0.09,
                                    letterSpacing: -0.13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            width: 113,
                            height: 40,
                            padding: const EdgeInsets.only(
                              top: 12,
                              left: 14,
                              right: 16,
                              bottom: 12,
                            ),
                            decoration: ShapeDecoration(
                              color: Color(0xFFEFF2F5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Popular',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    height: 0.09,
                                    letterSpacing: -0.13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            width: 113,
                            height: 40,
                            padding: const EdgeInsets.only(
                              top: 12,
                              left: 14,
                              right: 16,
                              bottom: 12,
                            ),
                            decoration: ShapeDecoration(
                              color: Color(0xFFEFF2F5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Midnight',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    height: 0.09,
                                    letterSpacing: -0.13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        InkWell(
                        onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OrderMenu()),
                      );
                    },
                          child: Container(
                            width: 400,
                            height: 110,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Container(
                                    width: 130,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("assets/imgs/pizzalist.png"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20, top: 15),
                                        child: Text(
                                          'Peperoni Special Pizza',
                                          style: TextStyle(
                                            color: Color(0xFF1E1E1E),
                                            fontSize: 16,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            height: 0.10,
                                            letterSpacing: -0.15,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20),
                                        child: Text(
                                          'Single Serving',
                                          style: TextStyle(
                                            color: Color(0xFF292D32),
                                            fontSize: 15,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w300,
                                            height: 0.12,
                                            letterSpacing: -0.14,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20, top: 20),
                                        child: Row(
                                          children: [
                                            Text(
                                              '2500 Rs',
                                              style: TextStyle(
                                                color: Color(0xFF292D32),
                                                fontSize: 15,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                                height: 0.09,
                                              ),
                                            ),
                                            const SizedBox(width: 13),
                                            Text(
                                              '1000 Rs',
                                              style: TextStyle(
                                                color: Color(0xFFFD9700),
                                                fontSize: 15,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                height: 0.09,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(), // Divider between items
                      ],
                    );
                  },
                ),



                ]
              ),
            )
        ));
  }
}
