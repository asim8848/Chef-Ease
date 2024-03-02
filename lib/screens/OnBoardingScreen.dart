import 'package:chefease/screens/HomeScreen.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentPage = 0;
  List<OnboardingItem> OnboardingItems = [
    OnboardingItem(
      title: "Find a Chef",
      description:
          "Gorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla ",
      image: 'assets/imgs/onboarding1.png',
    ),
    OnboardingItem(
      title: "Secure Payments",
      description:
          "Gorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla ",
      image: 'assets/imgs/onboarding2.png',
    ),
    OnboardingItem(
      title: "Donate Food for needy people",
      description:
          "Gorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla ",
      image: 'assets/imgs/onboarding3.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: TextButton(
          onPressed: () {
            // Navigate to HomeScreen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primaryColor,
          ),
          child: Text('Skip'),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: 30),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                    itemCount: OnboardingItems.length,
                    onPageChanged: (value) {
                      setState(() {
                        _currentPage = value;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Image.asset(
                            OnboardingItems[index].image,
                            height: 400,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 50,
                            child: Text(
                              OnboardingItems[index].title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 326,
                            height: 117,
                            child: Text(
                              OnboardingItems[index].description,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black
                                    .withOpacity(0.4300000071525574),
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      );
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(OnboardingItems.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 10,
                      width: _currentPage == index ? 30 : 10,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? Color(0xFFFF6A42)
                            : Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingItem {
  final String title;
  final String description;
  final String image;
  OnboardingItem(
      {required this.title, required this.description, required this.image});
}
