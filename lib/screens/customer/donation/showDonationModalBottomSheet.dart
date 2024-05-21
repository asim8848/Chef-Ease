// common_methods.dart
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/responsive.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/form_fields.dart';
import '../../../widgets/text_styles.dart';

void showDonationModalBottomSheet(BuildContext context) {
  double _screenheight = Responsive.screenHeight(context);
  double _screenwidth = Responsive.screenWidth(context);
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
  showModalBottomSheet<void>(
    showDragHandle: true,
    enableDrag: true,
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
        builder: (BuildContext context, StateSetter setState) {
          double screenHeight = Responsive.screenHeight(context);
          double screenWidth = Responsive.screenWidth(context);

          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return SizedBox(
                height: 800,
                width: 500,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: const AppMainText(
                            text: 'Select your payment method',
                          ),
                        ),
                        SizedBox(height: screenWidth * 0.05),
                        CheckboxListTile(
                          title: const Text('Cash'),
                          value: _isCashSelected,
                          onChanged: (bool? value) {
                            setState(() {
                              _isCashSelected = value ?? false;
                              if (_isCashSelected) {
                                _isCardSelected =
                                    false; // Unselect card if cash is selected
                                _isJazzCashSelected =
                                    false; // Unselect JazzCash if cash is selected
                              }
                            });
                          },
                          activeColor: AppColors.primaryColor,
                          tileColor: _isCashSelected
                              ? AppColors.primaryColor.withOpacity(0.1)
                              : Colors.transparent,
                          secondary: const Icon(Icons.money_outlined),
                          checkboxShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side: const BorderSide(
                              color: AppColors.primaryColor,
                            ),
                          ),
                          controlAffinity: ListTileControlAffinity.trailing,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                        SizedBox(height: screenWidth * 0.05),
                        CheckboxListTile(
                          title: AppLiteText(
                            text: 'Credit or Debit Card',
                          ),
                          value: _isCardSelected,
                          onChanged: (bool? value) {
                            setState(() {
                              _isCardSelected = value ?? false;
                              if (_isCardSelected) {
                                _isCashSelected =
                                    false; // Unselect cash if card is selected
                                _isJazzCashSelected =
                                    false; // Unselect JazzCash if card is selected
                              }
                            });
                          },
                          activeColor: AppColors.primaryColor,
                          tileColor: _isCardSelected
                              ? AppColors.primaryColor.withOpacity(0.1)
                              : Colors.transparent,
                          secondary: const Icon(Icons.credit_card),
                          checkboxShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side: const BorderSide(
                              color: AppColors.primaryColor,
                            ),
                          ),
                          controlAffinity: ListTileControlAffinity.trailing,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                        if (_isCardSelected) // Only display card input fields if Credit or Debit Card is selected
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: screenWidth * 0.05),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 8,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        AppLiteText(
                                          text: 'CARD NUMBER',
                                          fontSize: 12,
                                          color: AppColors.textColor
                                              .withOpacity(0.7),
                                          fontFamily: 'Poppins',
                                        ),
                                        const SizedBox(height: 5),
                                        SizedBox(
                                          width: double
                                              .infinity, // Set width to fill the available space
                                          child: AppTextFormField(
                                            hintText: '7512 6321 4526 982',
                                            keyboardType: TextInputType.number,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        AppLiteText(
                                          text: 'CVC',
                                          fontSize: 12,
                                          color: AppColors.textColor
                                              .withOpacity(0.7),
                                          fontFamily: 'Poppins',
                                        ),
                                        const SizedBox(height: 5),
                                        SizedBox(
                                          width: double
                                              .infinity, // Set width to fill the available space
                                          child: AppTextFormField(
                                            hintText: '253',
                                            keyboardType: TextInputType.number,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: screenWidth * 0.03),
                              AppLiteText(
                                text: 'CARD HOLDER NAME',
                                color: AppColors.textColor.withOpacity(0.7),
                              ),
                              SizedBox(height: 5),
                              AppTextFormField(
                                hintText: 'John Doe',
                              ),
                              const SizedBox(height: 20),
                              AppLiteText(text: 'EXPIRATION DATE'),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  // Month Dropdown Button
                                  Expanded(
                                    flex: 3,
                                    child: DropdownButtonFormField<String>(
                                      style: TextStyle(
                                        color: AppColors.textColor
                                            .withOpacity(0.7),
                                      ),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 12),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            color: AppColors.bgColor,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            color: AppColors.primaryColor,
                                          ),
                                        ),
                                        fillColor: AppColors.bgColor,
                                        filled: true,
                                        hintText: 'Select Month',
                                        hintStyle: TextStyle(
                                          color: AppColors.textColor
                                              .withOpacity(0.5),
                                        ),
                                      ),
                                      value: selectedMonth,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          selectedMonth = newValue!;
                                        });
                                      },
                                      items: months.map((String month) {
                                        return DropdownMenuItem<String>(
                                          value: month,
                                          child: Text(month),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                  SizedBox(
                                      width:
                                          16), // Add spacing between the buttons
                                  // Year Dropdown Button
                                  Expanded(
                                    flex: 2,
                                    child: DropdownButtonFormField<String>(
                                      style: TextStyle(
                                        color: AppColors.textColor
                                            .withOpacity(0.7),
                                      ),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 12),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            color: AppColors.bgColor,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            color: AppColors.primaryColor,
                                          ),
                                        ),
                                        fillColor: AppColors.bgColor,
                                        filled: true,
                                        hintText: 'Select Year',
                                        hintStyle: TextStyle(
                                          color: AppColors.textColor
                                              .withOpacity(0.5),
                                        ),
                                      ),
                                      value: selectedYear,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          selectedYear = newValue!;
                                        });
                                      },
                                      items: years.map((String year) {
                                        return DropdownMenuItem<String>(
                                          value: year,
                                          child: Text(year),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: SizedBox(
                                      width: 5,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        SizedBox(height: 20),
                        CheckboxListTile(
                          title: const Text('JazzCash'),
                          value: _isJazzCashSelected,
                          onChanged: (bool? value) {
                            setState(() {
                              _isJazzCashSelected = value ?? false;
                              if (_isJazzCashSelected) {
                                _isCashSelected =
                                    false; // Unselect cash if JazzCash is selected
                                _isCardSelected =
                                    false; // Unselect card if JazzCash is selected
                              }
                            });
                          },
                          activeColor: AppColors.primaryColor,
                          tileColor: _isJazzCashSelected
                              ? AppColors.primaryColor.withOpacity(0.1)
                              : Colors.transparent,
                          secondary: const Icon(Icons.monetization_on_outlined),
                          checkboxShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side: const BorderSide(
                              color: AppColors.primaryColor,
                            ),
                          ),
                          controlAffinity: ListTileControlAffinity.trailing,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: CustomButton(
                            text: 'Confirm',
                            onPressed: () {
                              // Show confirmation message on button press
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Confirmation'),
                                    content: const Text(
                                        'Your request has been sent, we will notify you once it is approved.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 20)
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      );
    },
  );
}
