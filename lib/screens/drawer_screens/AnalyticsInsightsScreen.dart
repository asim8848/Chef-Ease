import 'package:chefease/widgets/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../constants/colors.dart';
import '../../constants/responsive.dart';
import '../../widgets/line_chart.dart';

class AnalyticsInsights extends StatefulWidget {
  const AnalyticsInsights({super.key});

  @override
  State<AnalyticsInsights> createState() => _AnalyticsInsightsState();
}

class _AnalyticsInsightsState extends State<AnalyticsInsights> {
  String _selectedOption = 'Daily';

  @override
  Widget build(BuildContext context) {
    double _screenheight = Responsive.screenHeight(context);
    double _screenwidth = Responsive.screenWidth(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: AppMainText(
          text: 'Analytics & Insights',
          fontSize: 18,
          color: AppColors.textColor,
        ),
        backgroundColor: AppColors.secondaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(_screenwidth * 0.04), // 4% of screen width // Adjust padding as needed
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(_screenwidth * 0.04), // 4% of screen width
                    margin: EdgeInsets.only(right: _screenwidth * 0.05), // 5% of screen width
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppMainText(
                          text: '20',
                          fontSize: _screenwidth * 0.1, // 10% of screen width
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: _screenheight * 0.004), // 0.4% of screen height
                        AppLiteText(
                          text: 'Running Orders',
                          fontSize: _screenwidth * 0.045, // 4.5% of screen width
                          fontWeight: FontWeight.w500,
                          color: Colors.black, // Text color
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: _screenwidth * 0.025), // 2.5% of screen width
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(_screenwidth * 0.04), // 4% of screen width
                    margin: EdgeInsets.only(right: _screenwidth * 0.05), // 5% of screen width
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppMainText(
                          text: '05',
                          fontSize: _screenwidth * 0.1, // 10% of screen width
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: _screenheight * 0.004), // 0.4% of screen height
                        AppLiteText(
                          text: 'Order Request',
                          fontSize: _screenwidth * 0.045, // 4.5% of screen width
                          fontWeight: FontWeight.w500,
                          color: Colors.black, // Text color
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: _screenheight * 0.02), // 2% of screen height
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    AppMainText(
                      text: 'Total Revenue',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(width: 20),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2), // Adjust padding here
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedOption,
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              setState(() {
                                _selectedOption = newValue;
                              });
                            }
                          },
                          items: <String>['Daily', 'Weekly', 'Monthly', 'Yearly']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: AppLiteText(
                                text: value,
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        // Handle 'See Details' button tap
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Text(
                          'See Details',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.primaryColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                AppMainText(
                  text: '\$2,241',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            LineChartSample2(),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: AppMainText(
                text: 'All Reviews (500+)',
                fontSize: _screenwidth * 0.045, // 4.5% of screen width
                fontWeight: FontWeight.w600,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Replace with the actual number of reviews
                itemBuilder: (context, index) {
                  return ListTile(
                    tileColor: Color(0xFFF8F9FB),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/imgs/person1circle.png'),
                      radius: _screenwidth * 0.05,
                    ),
                    title: AppMainText(
                      text: 'Anna',
                      fontSize: _screenwidth * 0.0325,
                      fontWeight: FontWeight.w400,
                    ),
                    subtitle: AppLiteText(
                      text: 'Great Taste <3',
                      fontSize: _screenwidth * 0.0275,
                      fontWeight: FontWeight.w400,
                    ),
                    trailing: Icon(Icons.star, color: Colors.orange, size: _screenwidth * 0.065),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
