import 'package:flutter/material.dart';
import '../Constants/constants.dart';
import '../TabBarScreens/Screen1.dart';
import '../TabBarScreens/Screen2.dart';

class CompanyDetails extends StatefulWidget {
  const CompanyDetails({Key? key}) : super(key: key);

  @override
  State<CompanyDetails> createState() => _CompanyDetailsState();
}

class _CompanyDetailsState extends State<CompanyDetails> {

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.sizeOf(context).height*1;
    final width=MediaQuery.sizeOf(context).width*1;
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              width: width * 0.8,
              height: height * 0.3,
              decoration: const BoxDecoration(
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
                    decoration: const BoxDecoration(
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
                    const Padding(
                      padding: EdgeInsets.only(left: 60, top: 38),
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
                                EdgeInsets.only(left: 10),
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
                                padding: EdgeInsets.only(
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
                          icon: const Icon(Icons.share,
                              color: AppColors.primaryColor),
                          onPressed: () {
                            // Add your share functionality here
                          },
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Icon(Icons.favorite,
                              color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            DefaultTabController(
              length: 2,
              child: Expanded(
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0x6DEFF2F5),
                      ),
                      child: PreferredSize(
                        preferredSize: Size.fromHeight(kToolbarHeight), // Set the preferred size to match the height of the default app bar
                        child: TabBar(
                          labelColor: Color(0xFFFF6A42),
                          indicatorColor: Color(0xFFFF6A42),
                          tabs: [
                            Tab(text: 'Details'),
                            Tab(text: 'Reviews'),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                         FirstScreen(),
                         SecondScreen(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
