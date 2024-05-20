import 'dart:convert';
import 'package:chefease/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import '../../../constants/colors.dart';
import 'package:http/http.dart' as http;
import '../../../constants/responsive.dart';
import '../../../widgets/form_fields.dart';
import '../../../widgets/text_styles.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  Map<String, dynamic>? paymentIntentData;
  int selectedContainerIndex = -1;
  int count = 0;
  bool _isCashSelected = true;
  bool _isCardSelected = false;
  bool _isJazzCashSelected = false;
  bool _isEditing = false;


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

  @override
  Widget build(BuildContext context) {
    double _screenheight = Responsive.screenHeight(context);
    double _screenwidth = Responsive.screenWidth(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: AppMainText(
          text: 'Order Details',
          fontSize: 18,
          color: AppColors.textColor,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: _screenwidth,
          height: _screenheight,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: _screenheight * 0.03), // 3% of screen height
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _screenwidth * 0.05),
                // 5% of screen width
                child: AppMainText(
                  text: 'My Cart',
                  fontSize: _screenwidth * 0.04, // 4% of screen width
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: _screenheight * 0.02),
              Row(
                children: [
                  SizedBox(width: _screenwidth * 0.05), // 2% of screen width
                  Container(
                    width: _screenwidth * 0.2, // 20% of screen width
                    height: _screenheight * 0.1, // 10% of screen height
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.20),
                      image: DecorationImage(
                        image: AssetImage("assets/imgs/pizzapic.png"),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(
                          12), // Rounded corners
                    ),
                  ),
                  SizedBox(width: _screenwidth * 0.04), // 2% of screen width
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppMainText(
                        text: 'Pepperoni Special Pizza',
                        fontSize: _screenwidth * 0.03, // 3% of screen width
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(height: _screenheight * 0.005),
                      // 0.5% of screen height
                      AppLiteText(
                        text: '1000 Rs.',
                        fontSize: _screenwidth * 0.028, // 2.8% of screen width
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w300,
                      ),
                      SizedBox(height: _screenheight * 0.01),
                      // 1% of screen height
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (count > 0) {
                                  count--;
                                }
                              });
                            },
                            child: Container(
                              width: _screenwidth * 0.065,
                              // 6.5% of screen width
                              height: _screenheight * 0.026,
                              // 2.6% of screen height
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor, // Changed color
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.remove,
                                  size: _screenwidth * 0.04,
                                  // 4% of screen width
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: _screenwidth * 0.03),
                          // 3% of screen width
                          Text(
                            count.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: _screenwidth *
                                  0.032, // 3.2% of screen width
                            ),
                          ),
                          SizedBox(width: _screenwidth * 0.03),
                          // 3% of screen width
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                count++;
                              });
                            },
                            child: Container(
                              width: _screenwidth * 0.065,
                              // 6.5% of screen width
                              height: _screenheight * 0.026,
                              // 2.6% of screen height
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor, // Changed color
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.add,
                                  size: _screenwidth * 0.04,
                                  // 4% of screen width
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: _screenheight * 0.03),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _screenwidth * 0.05),
                // 5% of screen width
                child: Row(
                  children: [
                    Icon(
                      Icons.wallet,
                      color: AppColors.primaryColor, // Changed color
                      size: _screenwidth * 0.05, // 5% of screen width
                    ),
                    SizedBox(width: _screenwidth * 0.02), // 2% of screen width
                    AppMainText(
                      text: "Payment Method",
                      fontSize: _screenwidth * 0.04, // 4% of screen width
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w600,
                    ),
                    Spacer(),
                    Icon(
                      Icons.edit,
                      color: AppColors.primaryColor, // Changed color
                      size: _screenwidth * 0.05, // 5% of screen width
                    ),
                  ],
                ),
              ),
              SizedBox(height: _screenheight * 0.015), // 1.5% of screen height
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _screenwidth * 0.05),
                // 5% of screen width
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppLiteText(
                      text: 'Cash',
                      fontSize: _screenwidth * 0.03, // 3% of screen width
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w300,
                    ),
                    AppLiteText(
                      text: '1000 Rs.',
                      fontSize: _screenwidth * 0.03, // 3% of screen width
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
              SizedBox(height: _screenheight * 0.01), // 1% of screen height
              Divider(
                color: Colors.grey,
              ),
              SizedBox(height: _screenheight * 0.015), // 1.5% of screen height
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _screenwidth * 0.05),
                // 5% of screen width
                child: Row(
                  children: [
                    Icon(
                      Icons.checklist_outlined,
                      color: AppColors.primaryColor, // Changed color
                      size: _screenwidth * 0.05, // 5% of screen width
                    ),
                    SizedBox(width: _screenwidth * 0.02), // 2% of screen width
                    AppMainText(
                      text: 'Order Summary',
                      fontSize: _screenwidth * 0.04, // 4% of screen width
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w600,
                    ),
                    Spacer(),
                    Icon(
                      Icons.edit,
                      color: AppColors.primaryColor, // Changed color
                      size: _screenwidth * 0.05, // 5% of screen width
                    ),
                  ],
                ),
              ),
              SizedBox(width: _screenwidth * 0.02), // 2% of screen width

              SizedBox(height: _screenheight * 0.015), // 1.5% of screen height
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _screenwidth * 0.05),
                // 5% of screen width
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppLiteText(
                      text: 'Lorem Ipsum Lorem Ipsum ',
                      fontSize: _screenwidth * 0.03, // 3% of screen width
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w300,
                    ),
                    AppLiteText(
                      text: 'Rs. 1000',
                      fontSize: _screenwidth * 0.03, // 3% of screen width
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
              SizedBox(height: _screenheight * 0.01),
              Divider(
                color: Colors.grey,
              ),
              SizedBox(height: _screenwidth * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _screenwidth * 0.05),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: AppColors.primaryColor, // Changed color
                      size: _screenwidth * 0.05, // 5% of screen width
                    ),
                    SizedBox(width: _screenwidth * 0.02), // 2% of screen width
                    AppMainText(
                      text: 'Address',
                      fontSize: _screenwidth * 0.04, // 4% of screen width
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w600,
                    ),
                    Spacer(),
                  ],
                ),
              ),
              SizedBox(height: _screenwidth * 0.03),
// Address TextField with Edit Button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _screenwidth * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: AppTextFormField(
                            hintText: 'Enter your address',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: _screenheight * 0.020), // 1.5% of screen height
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _screenwidth * 0.05),
                // 5% of screen width
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppLiteText(
                      text: 'Subtotal',
                      fontSize: _screenwidth * 0.03, // 3% of screen width
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w300,
                    ),
                    AppLiteText(
                      text: 'Rs. 1000',
                      fontSize: _screenwidth * 0.03, // 3% of screen width
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
              SizedBox(height: _screenheight * 0.01), // 1% of screen height
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _screenwidth * 0.05),
                // 5% of screen width
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppLiteText(
                      text: 'Discount',
                      fontSize: _screenwidth * 0.03, // 3% of screen width
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w300,
                    ),
                    AppLiteText(
                      text: 'Rs. 50',
                      fontSize: _screenwidth * 0.03, // 3% of screen width
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
              SizedBox(height: _screenheight * 0.01), // 1% of screen height
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _screenwidth * 0.05),
                // 5% of screen width
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppLiteText(
                      text: 'Platform Fee',
                      fontSize: _screenwidth * 0.03, // 3% of screen width
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w300,
                    ),
                    AppLiteText(
                      text: 'Rs. 100',
                      fontSize: _screenwidth * 0.03, // 3% of screen width
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
              SizedBox(height: _screenheight * 0.03),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: CustomButton(

                  text: 'Confrim', borderRadius: 12,
                  onPressed: () async {
                    await makePayment();
                    // await showModalBottomSheet<void>(
                    //     showDragHandle: true,
                    //     enableDrag: true,
                    //     useSafeArea: true,
                    //     shape: const RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.only(
                    //         topLeft: Radius.circular(20),
                    //         topRight: Radius.circular(20),
                    //       ),
                    //     ),
                    //     backgroundColor: Colors.white,
                    //     context: context,
                    //     builder: (BuildContext context) {
                    //       return StatefulBuilder(
                    //         builder:
                    //             (BuildContext context, StateSetter setState) {
                    //           double screenHeight =
                    //           Responsive.screenHeight(context);
                    //           double screenWidth =
                    //           Responsive.screenWidth(context);
                    //
                    //           return StatefulBuilder(
                    //             builder: (BuildContext context,
                    //                 StateSetter setState) {
                    //               return SizedBox(
                    //                 height: 800,
                    //                 width: 500,
                    //                 child: SingleChildScrollView(
                    //                   child: Padding(
                    //                     padding: const EdgeInsets.symmetric(
                    //                         horizontal: 20),
                    //                     child: Column(
                    //                       mainAxisAlignment:
                    //                       MainAxisAlignment.start,
                    //                       crossAxisAlignment:
                    //                       CrossAxisAlignment.start,
                    //                       children: [
                    //                         Center(
                    //                           child: const AppMainText(
                    //                             text:
                    //                             'Select your payment method',
                    //                           ),
                    //                         ),
                    //                         SizedBox(
                    //                           height: screenWidth * 0.05,
                    //                         ),
                    //                         CheckboxListTile(
                    //                           title: const Text('Cash'),
                    //                           value: _isCashSelected,
                    //                           onChanged: (bool? value) {
                    //                             setState(() {
                    //                               _isCashSelected =
                    //                                   value ?? false;
                    //                               if (_isCashSelected) {
                    //                                 _isCardSelected =
                    //                                 false; // Unselect card if cash is selected
                    //                                 _isJazzCashSelected =
                    //                                 false; // Unselect JazzCash if cash is selected
                    //                               }
                    //                             });
                    //                           },
                    //                           activeColor:
                    //                           AppColors.primaryColor,
                    //                           tileColor: _isCashSelected
                    //                               ? AppColors.primaryColor
                    //                               .withOpacity(0.1)
                    //                               : Colors.transparent,
                    //                           secondary: const Icon(
                    //                               Icons.money_outlined),
                    //                           checkboxShape:
                    //                           RoundedRectangleBorder(
                    //                             borderRadius:
                    //                             BorderRadius.circular(50),
                    //                             side: const BorderSide(
                    //                               color:
                    //                               AppColors.primaryColor,
                    //                             ),
                    //                           ),
                    //                           controlAffinity:
                    //                           ListTileControlAffinity
                    //                               .trailing,
                    //                           shape: RoundedRectangleBorder(
                    //                             borderRadius:
                    //                             BorderRadius.circular(10),
                    //                             side: const BorderSide(
                    //                               color:
                    //                               AppColors.primaryColor,
                    //                             ),
                    //                           ),
                    //                         ),
                    //                         SizedBox(
                    //                           height: screenWidth * 0.05,
                    //                         ),
                    //                         CheckboxListTile(
                    //                           title: AppLiteText(
                    //                             text: 'Credit or Debit Card',
                    //                           ),
                    //                           value: _isCardSelected,
                    //                           onChanged: (bool? value) {
                    //                             setState(() {
                    //                               _isCardSelected =
                    //                                   value ?? false;
                    //                               if (_isCardSelected) {
                    //                                 _isCashSelected =
                    //                                 false; // Unselect cash if card is selected
                    //                                 _isJazzCashSelected =
                    //                                 false; // Unselect JazzCash if card is selected
                    //                               }
                    //                             });
                    //                           },
                    //                           activeColor:
                    //                           AppColors.primaryColor,
                    //                           tileColor: _isCardSelected
                    //                               ? AppColors.primaryColor
                    //                               .withOpacity(0.1)
                    //                               : Colors.transparent,
                    //                           secondary: const Icon(
                    //                               Icons.credit_card),
                    //                           checkboxShape:
                    //                           RoundedRectangleBorder(
                    //                             borderRadius:
                    //                             BorderRadius.circular(50),
                    //                             side: const BorderSide(
                    //                               color:
                    //                               AppColors.primaryColor,
                    //                             ),
                    //                           ),
                    //                           controlAffinity:
                    //                           ListTileControlAffinity
                    //                               .trailing,
                    //                           shape: RoundedRectangleBorder(
                    //                             borderRadius:
                    //                             BorderRadius.circular(10),
                    //                             side: const BorderSide(
                    //                               color:
                    //                               AppColors.primaryColor,
                    //                             ),
                    //                           ),
                    //                         ),
                    //                         if (_isCardSelected) // Only display card input fields if Credit or Debit Card is selected
                    //                           Column(
                    //                             mainAxisAlignment:
                    //                             MainAxisAlignment.start,
                    //                             crossAxisAlignment:
                    //                             CrossAxisAlignment.start,
                    //                             children: [
                    //                               SizedBox(
                    //                                 height:
                    //                                 screenWidth * 0.05,
                    //                               ),
                    //                               Row(
                    //                                 mainAxisAlignment:
                    //                                 MainAxisAlignment
                    //                                     .spaceEvenly,
                    //                                 crossAxisAlignment:
                    //                                 CrossAxisAlignment
                    //                                     .start,
                    //                                 children: [
                    //                                   Expanded(
                    //                                     flex: 8,
                    //                                     child: Column(
                    //                                       crossAxisAlignment:
                    //                                       CrossAxisAlignment
                    //                                           .start,
                    //                                       mainAxisAlignment:
                    //                                       MainAxisAlignment
                    //                                           .start,
                    //                                       children: [
                    //                                         AppLiteText(
                    //                                           text:
                    //                                           'CARD NUMBER',
                    //                                           fontSize: 12,
                    //                                           color: AppColors
                    //                                               .textColor
                    //                                               .withOpacity(
                    //                                               0.7),
                    //                                           fontFamily:
                    //                                           'Poppins',
                    //                                         ),
                    //                                         const SizedBox(
                    //                                           height: 5,
                    //                                         ),
                    //                                         SizedBox(
                    //                                           width: double
                    //                                               .infinity, // Set width to fill the available space
                    //                                           child:
                    //                                           AppTextFormField(
                    //                                             hintText:
                    //                                             '7512 6321 4526 982',
                    //                                             keyboardType:
                    //                                             TextInputType
                    //                                                 .number,
                    //                                           ),
                    //                                         ),
                    //                                       ],
                    //                                     ),
                    //                                   ),
                    //                                   SizedBox(
                    //                                     width: 10,
                    //                                   ),
                    //                                   Expanded(
                    //                                     flex: 2,
                    //                                     child: Column(
                    //                                       crossAxisAlignment:
                    //                                       CrossAxisAlignment
                    //                                           .start,
                    //                                       mainAxisAlignment:
                    //                                       MainAxisAlignment
                    //                                           .start,
                    //                                       children: [
                    //                                         AppLiteText(
                    //                                           text: 'CVC',
                    //                                           fontSize: 12,
                    //                                           color: AppColors
                    //                                               .textColor
                    //                                               .withOpacity(
                    //                                               0.7),
                    //                                           fontFamily:
                    //                                           'Poppins',
                    //                                         ),
                    //                                         const SizedBox(
                    //                                           height: 5,
                    //                                         ),
                    //                                         SizedBox(
                    //                                           width: double
                    //                                               .infinity, // Set width to fill the available space
                    //                                           child:
                    //                                           AppTextFormField(
                    //                                             hintText:
                    //                                             '253',
                    //                                             keyboardType:
                    //                                             TextInputType
                    //                                                 .number,
                    //                                           ),
                    //                                         ),
                    //                                       ],
                    //                                     ),
                    //                                   ),
                    //                                 ],
                    //                               ),
                    //                               SizedBox(
                    //                                 height:
                    //                                 screenWidth * 0.03,
                    //                               ),
                    //                               AppLiteText(
                    //                                 text: 'CARD HOLDER NAME',
                    //                                 color: AppColors.textColor
                    //                                     .withOpacity(0.7),
                    //                               ),
                    //                               SizedBox(
                    //                                 height: 5,
                    //                               ),
                    //                               AppTextFormField(
                    //                                 hintText: 'John Doe',
                    //                               ),
                    //                               const SizedBox(
                    //                                 height: 20,
                    //                               ),
                    //                               AppLiteText(
                    //                                   text:
                    //                                   'EXPIRATION DATE'),
                    //                               const SizedBox(
                    //                                 height: 5,
                    //                               ),
                    //                               Row(
                    //                                 children: [
                    //                                   // Month Dropdown Button
                    //                                   Expanded(
                    //                                     flex: 3,
                    //                                     child:
                    //                                     DropdownButtonFormField<
                    //                                         String>(
                    //                                       style: TextStyle(
                    //                                         color: AppColors
                    //                                             .textColor
                    //                                             .withOpacity(
                    //                                             0.7),
                    //                                       ),
                    //                                       decoration:
                    //                                       InputDecoration(
                    //                                         contentPadding:
                    //                                         EdgeInsets.symmetric(
                    //                                             horizontal:
                    //                                             16,
                    //                                             vertical:
                    //                                             12),
                    //                                         border:
                    //                                         OutlineInputBorder(
                    //                                           borderRadius:
                    //                                           BorderRadius
                    //                                               .circular(
                    //                                               10),
                    //                                           borderSide:
                    //                                           const BorderSide(
                    //                                             color: AppColors
                    //                                                 .bgColor,
                    //                                           ),
                    //                                         ),
                    //                                         focusedBorder:
                    //                                         OutlineInputBorder(
                    //                                           borderRadius:
                    //                                           BorderRadius
                    //                                               .circular(
                    //                                               10),
                    //                                           borderSide:
                    //                                           const BorderSide(
                    //                                             color: AppColors
                    //                                                 .primaryColor,
                    //                                           ),
                    //                                         ),
                    //                                         fillColor:
                    //                                         AppColors
                    //                                             .bgColor,
                    //                                         filled: true,
                    //                                         hintText:
                    //                                         'Select Month',
                    //                                         hintStyle:
                    //                                         TextStyle(
                    //                                           color: AppColors
                    //                                               .textColor
                    //                                               .withOpacity(
                    //                                               0.5),
                    //                                         ),
                    //                                       ),
                    //                                       value:
                    //                                       selectedMonth,
                    //                                       onChanged: (String?
                    //                                       newValue) {
                    //                                         setState(() {
                    //                                           selectedMonth =
                    //                                           newValue!;
                    //                                         });
                    //                                       },
                    //                                       items: months.map(
                    //                                               (String month) {
                    //                                             return DropdownMenuItem<
                    //                                                 String>(
                    //                                               value: month,
                    //                                               child:
                    //                                               Text(month),
                    //                                             );
                    //                                           }).toList(),
                    //                                     ),
                    //                                   ),
                    //                                   SizedBox(
                    //                                     width: 16,
                    //                                   ), // Add spacing between the buttons
                    //                                   // Year Dropdown Button
                    //                                   Expanded(
                    //                                     flex: 2,
                    //                                     child:
                    //                                     DropdownButtonFormField<
                    //                                         String>(
                    //                                       style: TextStyle(
                    //                                         color: AppColors
                    //                                             .textColor
                    //                                             .withOpacity(
                    //                                             0.7),
                    //                                       ),
                    //                                       decoration:
                    //                                       InputDecoration(
                    //                                         contentPadding:
                    //                                         EdgeInsets.symmetric(
                    //                                             horizontal:
                    //                                             16,
                    //                                             vertical:
                    //                                             12),
                    //                                         border:
                    //                                         OutlineInputBorder(
                    //                                           borderRadius:
                    //                                           BorderRadius
                    //                                               .circular(
                    //                                               10),
                    //                                           borderSide:
                    //                                           const BorderSide(
                    //                                             color: AppColors
                    //                                                 .bgColor,
                    //                                           ),
                    //                                         ),
                    //                                         focusedBorder:
                    //                                         OutlineInputBorder(
                    //                                           borderRadius:
                    //                                           BorderRadius
                    //                                               .circular(
                    //                                               10),
                    //                                           borderSide:
                    //                                           const BorderSide(
                    //                                             color: AppColors
                    //                                                 .primaryColor,
                    //                                           ),
                    //                                         ),
                    //                                         fillColor:
                    //                                         AppColors
                    //                                             .bgColor,
                    //                                         filled: true,
                    //                                         hintText:
                    //                                         'Select Year',
                    //                                         hintStyle:
                    //                                         TextStyle(
                    //                                           color: AppColors
                    //                                               .textColor
                    //                                               .withOpacity(
                    //                                               0.5),
                    //                                         ),
                    //                                       ),
                    //                                       value: selectedYear,
                    //                                       onChanged: (String?
                    //                                       newValue) {
                    //                                         setState(() {
                    //                                           selectedYear =
                    //                                           newValue!;
                    //                                         });
                    //                                       },
                    //                                       items: years.map(
                    //                                               (String year) {
                    //                                             return DropdownMenuItem<
                    //                                                 String>(
                    //                                               value: year,
                    //                                               child:
                    //                                               Text(year),
                    //                                             );
                    //                                           }).toList(),
                    //                                     ),
                    //                                   ),
                    //                                   Expanded(
                    //                                     flex: 1,
                    //                                     child: SizedBox(
                    //                                       width: 5,
                    //                                     ),
                    //                                   )
                    //                                 ],
                    //                               ),
                    //                             ],
                    //                           ),
                    //                         SizedBox(
                    //                           height: 20,
                    //                         ),
                    //                         CheckboxListTile(
                    //                           title: const Text('JazzCash'),
                    //                           value: _isJazzCashSelected,
                    //                           onChanged: (bool? value) {
                    //                             setState(() {
                    //                               _isJazzCashSelected =
                    //                                   value ?? false;
                    //                               if (_isJazzCashSelected) {
                    //                                 _isCashSelected =
                    //                                 false; // Unselect cash if JazzCash is selected
                    //                                 _isCardSelected =
                    //                                 false; // Unselect card if JazzCash is selected
                    //                               }
                    //                             });
                    //                           },
                    //                           activeColor:
                    //                           AppColors.primaryColor,
                    //                           tileColor: _isJazzCashSelected
                    //                               ? AppColors.primaryColor
                    //                               .withOpacity(0.1)
                    //                               : Colors.transparent,
                    //                           secondary: const Icon(Icons
                    //                               .monetization_on_outlined),
                    //                           checkboxShape:
                    //                           RoundedRectangleBorder(
                    //                             borderRadius:
                    //                             BorderRadius.circular(50),
                    //                             side: const BorderSide(
                    //                               color:
                    //                               AppColors.primaryColor,
                    //                             ),
                    //                           ),
                    //                           controlAffinity:
                    //                           ListTileControlAffinity
                    //                               .trailing,
                    //                           shape: RoundedRectangleBorder(
                    //                             borderRadius:
                    //                             BorderRadius.circular(10),
                    //                             side: const BorderSide(
                    //                               color:
                    //                               AppColors.primaryColor,
                    //                             ),
                    //                           ),
                    //                         ),
                    //                         SizedBox(
                    //                           height: 20,
                    //                         ),
                    //                         Center(
                    //                           child: CustomButton(
                    //                             text: 'Confirm',
                    //                             onPressed: () {
                    //                               // Show confirmation message on button press
                    //                               showDialog(
                    //                                 context: context,
                    //                                 builder: (BuildContext
                    //                                 context) {
                    //                                   return AlertDialog(
                    //                                     title: const Text(
                    //                                         'Confirmation'),
                    //                                     content: const Text(
                    //                                         'Your request has been sent, we will notify you once it is approved.'),
                    //                                     actions: [
                    //                                       TextButton(
                    //                                         onPressed: () {
                    //                                           Navigator.of(
                    //                                               context)
                    //                                               .pop();
                    //                                         },
                    //                                         child: const Text(
                    //                                             'OK'),
                    //                                       ),
                    //                                     ],
                    //                                   );
                    //                                 },
                    //                               );
                    //                             },
                    //                           ),
                    //                         ),
                    //                         SizedBox(
                    //                           height: 20,
                    //                         )
                    //                       ],
                    //                     ),
                    //                   ),
                    //                 ),
                    //               );
                    //             },
                    //           );
                    //         },
                    //       );
                    //     });
                  },
                ),
              ),
              SizedBox(height: _screenheight * 0.02),
            ],
          ),
        ),
      ),
    );
  }


  Future<void> makePayment() async {
    try {
      paymentIntentData =
      await createPaymentIntent('20', 'USD'); //json.decode(response.body);
      // print('Response body==>${response.body.toString()}');
      await Stripe.instance
          .initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              setupIntentClientSecret: 'Your Secret Key',
              paymentIntentClientSecret:
              paymentIntentData!['client_secret'],
              // applePay: PaymentSheetApplePay.,
              // googlePay: true,
              // testEnv: true,
              customFlow: true,
              style: ThemeMode.dark,
              // merchantCountryCode: 'US',
              merchantDisplayName: 'Kashif'))
          .then((value) {});

      ///now finally display payment sheeet
      displayPaymentSheet();
    } catch (e, s) {
      print('Payment exception:$e$s');
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance
          .presentPaymentSheet(
        //       parameters: PresentPaymentSheetParameters(
        // clientSecret: paymentIntentData!['client_secret'],
        // confirmPayment: true,
        // )
      )
          .then((newValue) {
        print('payment intent' + paymentIntentData!['id'].toString());
        print(
            'payment intent' + paymentIntentData!['client_secret'].toString());
        print('payment intent' + paymentIntentData!['amount'].toString());
        print('payment intent' + paymentIntentData.toString());
        //orderPlaceApi(paymentIntentData!['id'].toString());
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("paid successfully")));

        paymentIntentData = null;
      }).onError((error, stackTrace) {
        print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
      });
    } on StripeException catch (e) {
      print('Exception/DISPLAYPAYMENTSHEET==> $e');
      showDialog(
          context: context,
          builder: (_) =>
          const AlertDialog(
            content: Text("Cancelled "),
          ));
    } catch (e) {
      print('$e');
    }
  }

//  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount('20'),
        'currency': currency,
        'payment_method_types[]': 'card',
      };
      print(body);
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization': 'Bearer ' + 'sk_test_51PHlpsRoEY9PrFzvwBUorknKGzTo2GyL0Q6nlo8oizUQxytUANSTz4QIYOUKz2yaMuo43ja6leU6dmKRaxSSkd8T00Cc7V53ou',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      print('Create Intent reponse ===> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }
}