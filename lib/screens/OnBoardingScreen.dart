import 'package:chefease/constants/responsive.dart';
import 'package:chefease/screens/HomeScreen.dart';
import 'package:chefease/widgets/text_styles.dart';
import 'package:flutter/material.dart';
//importing userrolrescreen
import 'package:chefease/UserRoleCheckScreen.dart';
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RoleCheckScreen()),
            );
          },
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primaryColor,
          ),
          child: Text('Skip'),
        ),
      ),
      body: Column(
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        OnboardingItems[index].image,
                        height: Responsive.screenHeight(context) * 0.4,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      AppMainText(
                        text: OnboardingItems[index].title,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: AppLiteText(
                          text: OnboardingItems[index].description,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  );
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(OnboardingItems.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: Responsive.screenWidth(context) * 0.03,
                  width: _currentPage == index
                      ? Responsive.screenWidth(context) * 0.1
                      : Responsive.screenWidth(context) * 0.0333,
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
