import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/responsive.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/form_fields.dart';
import '../../../widgets/text_styles.dart';

class PostBidsScreen extends StatefulWidget {
  const PostBidsScreen({super.key});

  @override
  State<PostBidsScreen> createState() => _PostBidsScreenState();
}

class _PostBidsScreenState extends State<PostBidsScreen> {
  double _sliderCurrentValue = 75;
  bool _isCashSelected = true;
  bool _isCardSelected = false;
  bool _isJazzCashSelected = false;

  String selectedMonth = 'January'; // Default selected month
  String selectedYear = '2023'; // Default selected year

  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  List<String> years = [
    '2023',
    '2024',
    '2025',
    '2026',
    '2027',
    '2028',
    '2029',
    '2030',
  ];

  List<bool> _isSelected = [
    true,
    false,
    false
  ]; // Initially, the first container is selected

  @override
  Widget build(BuildContext context) {
    double _screenwidth = Responsive.screenWidth(context);
    double _screenheight = Responsive.screenHeight(context);
    return Scaffold(
      appBar: AppBar(
        title: const AppLiteText(
          text: 'Post Offer',
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: const IconThemeData(color: AppColors.textColor),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: _screenwidth * 0.05,
              ),
              Center(
                child: AppLiteText(
                  text: 'Tell the Chefs what you need?',
                ),
              ),
              SizedBox(
                height: _screenwidth * 0.05,
              ),
              const AppMainText(
                text: 'Title',
              ),
              SizedBox(
                height: _screenwidth * 0.03,
              ),
              const AppTextFormField(hintText: 'Birthday Cake for my son'),
              SizedBox(
                height: _screenwidth * 0.05,
              ),
              const AppMainText(
                text: 'Description',
              ),
              SizedBox(
                height: _screenwidth * 0.03,
              ),
              const AppTextFormField(
                hintText: 'Describe what you are looking for...',
                maxLines: 6,
              ),
              SizedBox(
                height: _screenwidth * 0.05,
              ),
              const AppMainText(
                text: 'Select Chef level',
              ),
              SizedBox(
                height: _screenwidth * 0.03,
              ),
              // Display the chef levels in a horizontal list
              SizedBox(
                height: _screenwidth * 0.3,
                width: _screenwidth,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            // Update the selected state of all containers
                            for (int i = 0; i < _isSelected.length; i++) {
                              _isSelected[i] = (i == index);
                            }
                          });
                        },
                        child: Container(
                          width: _screenwidth * 0.265,
                          decoration: BoxDecoration(
                            color: AppColors.bgColor,
                            borderRadius: BorderRadius.circular(10),
                            border: _isSelected[index]
                                ? Border.all(
                                    color: AppColors.primaryColor,
                                    width: 2,
                                  )
                                : Border.all(
                                    color: AppColors.textColor.withOpacity(0.5),
                                    width: 2,
                                  ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.person_outline_outlined,
                                  color: _isSelected[index]
                                      ? AppColors.primaryColor
                                      : AppColors.textColor,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                AppLiteText(
                                  text: index == 0
                                      ? 'Top Rated'
                                      : index == 1
                                          ? 'Level 2'
                                          : 'Level 1',
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: _screenwidth * 0.05,
              ),
              const AppMainText(
                text: 'What is your budget?',
              ),
              SizedBox(
                height: _screenwidth * 0.03,
              ),
              const AppTextFormField(
                hintText: '0.00',
                icon: Icons.money_outlined,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: _screenwidth * 0.05,
              ),
              const AppMainText(
                text: 'Food Category',
              ),
              SizedBox(
                height: _screenwidth * 0.03,
              ),
              const AppTextFormField(
                hintText: 'Select Food type',
                icon: Icons.food_bank_outlined,
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: _screenwidth * 0.05,
              ),
              const AppMainText(
                text: 'Delivery Time',
              ),
              SizedBox(
                height: _screenwidth * 0.03,
              ),
              const AppTextFormField(
                  hintText: '2 days',
                  icon: Icons.timelapse_outlined,
                  keyboardType: TextInputType.text),
              SizedBox(
                // Add spacing between the fields
                height: _screenwidth * 0.05,
              ),

              Center(
                child: CustomButton(text: 'post offer', onPressed: () {}),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
