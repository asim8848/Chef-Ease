// path of this file: lib/screens/customer/food_order/OrderDetailsScreen.dart
import 'dart:convert';
import 'package:chefease/api/order_api.dart';
import 'package:chefease/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import '../../../constants/colors.dart';
import 'package:http/http.dart' as http;
import '../../../constants/responsive.dart';
import '../../../widgets/form_fields.dart';
import '../../../widgets/text_styles.dart';

class OrderDetails extends StatefulWidget {
  final String recipeId;

  const OrderDetails({super.key, required this.recipeId});

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

  late Future<Map<String, dynamic>> recipeDetailsFuture;

  @override
  void initState() {
    super.initState();
    recipeDetailsFuture = fetchRecipeDetails();
  }

  Future<Map<String, dynamic>> fetchRecipeDetails() async {
    try {
      return await OrderApi().fetchRecipeDetails(widget.recipeId);
    } catch (e) {
      print('Error fetching recipe details: $e');
      throw e;
    }
  }

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
      body: FutureBuilder<Map<String, dynamic>>(
        future: recipeDetailsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No recipe details found.'));
          } else {
            final recipe = snapshot.data!;
            return SingleChildScrollView(
              child: Container(
                width: _screenwidth,
                height: _screenheight,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: _screenheight * 0.03), // 3% of screen height
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: _screenwidth * 0.05),
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
                        SizedBox(
                            width: _screenwidth * 0.05), // 2% of screen width
                        Container(
                          width: _screenwidth * 0.2, // 20% of screen width
                          height: _screenheight * 0.1, // 10% of screen height
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor.withOpacity(0.20),
                            image: DecorationImage(
                              image: NetworkImage(recipe['RecipeImageURL']),
                              fit: BoxFit.fill,
                            ),
                            borderRadius:
                                BorderRadius.circular(12), // Rounded corners
                          ),
                        ),
                        SizedBox(
                            width: _screenwidth * 0.04), // 2% of screen width
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppMainText(
                              text: recipe['Title'],
                              fontSize:
                                  _screenwidth * 0.03, // 3% of screen width
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(height: _screenheight * 0.005),
                            // 0.5% of screen height
                            AppLiteText(
                              text: '${recipe['Price']} Rs.',
                              fontSize:
                                  _screenwidth * 0.028, // 2.8% of screen width
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
                                      color: AppColors
                                          .primaryColor, // Changed color
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
                                      color: AppColors
                                          .primaryColor, // Changed color
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
                      padding:
                          EdgeInsets.symmetric(horizontal: _screenwidth * 0.05),
                      // 5% of screen width
                      child: Row(
                        children: [
                          Icon(
                            Icons.wallet,
                            color: AppColors.primaryColor, // Changed color
                            size: _screenwidth * 0.05, // 5% of screen width
                          ),
                          SizedBox(
                              width: _screenwidth * 0.02), // 2% of screen width
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
                    SizedBox(
                        height: _screenheight * 0.015), // 1.5% of screen height
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: _screenwidth * 0.05),
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
                            text: '${recipe['Price']} Rs.',
                            fontSize: _screenwidth * 0.03, // 3% of screen width
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                        height: _screenheight * 0.01), // 1% of screen height
                    Divider(
                      color: Colors.grey,
                    ),
                    SizedBox(
                        height: _screenheight * 0.015), // 1.5% of screen height
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: _screenwidth * 0.05),
                      // 5% of screen width
                      child: Row(
                        children: [
                          Icon(
                            Icons.checklist_outlined,
                            color: AppColors.primaryColor, // Changed color
                            size: _screenwidth * 0.05, // 5% of screen width
                          ),
                          SizedBox(
                              width: _screenwidth * 0.02), // 2% of screen width
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

                    SizedBox(
                        height: _screenheight * 0.015), // 1.5% of screen height
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: _screenwidth * 0.05),
                      // 5% of screen width
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLiteText(
                            text: recipe['Description'] ?? 'No description',
                            fontSize: _screenwidth * 0.03, // 3% of screen width
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w300,
                          ),
                          AppLiteText(
                            text: '${recipe['Price']} Rs.',
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
                      padding:
                          EdgeInsets.symmetric(horizontal: _screenwidth * 0.05),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: AppColors.primaryColor, // Changed color
                            size: _screenwidth * 0.05, // 5% of screen width
                          ),
                          SizedBox(
                              width: _screenwidth * 0.02), // 2% of screen width
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
                      padding:
                          EdgeInsets.symmetric(horizontal: _screenwidth * 0.05),
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

                    SizedBox(
                        height: _screenheight * 0.020), // 1.5% of screen height
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: _screenwidth * 0.05),
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
                            text: '${recipe['Price']} Rs.',
                            fontSize: _screenwidth * 0.03, // 3% of screen width
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                        height: _screenheight * 0.01), // 1% of screen height
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: _screenwidth * 0.05),
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
                            text: '50 Rs.',
                            fontSize: _screenwidth * 0.03, // 3% of screen width
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                        height: _screenheight * 0.01), // 1% of screen height
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: _screenwidth * 0.05),
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
                            text: '100 Rs.',
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
                        text: 'Confirm',
                        borderRadius: 12,
                        onPressed: () async {
                          await makePayment();
                        },
                      ),
                    ),
                    SizedBox(height: _screenheight * 0.02),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Future<void> makePayment() async {
    try {
      paymentIntentData =
          await createPaymentIntent('20', 'USD'); //json.decode(response.body);
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  setupIntentClientSecret: 'Your Secret Key',
                  paymentIntentClientSecret:
                      paymentIntentData!['client_secret'],
                  customFlow: true,
                  style: ThemeMode.dark,
                  merchantDisplayName: 'Kashif'))
          .then((value) {});

      ///now finally display payment sheet
      displayPaymentSheet();
    } catch (e, s) {
      print('Payment exception:$e$s');
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((newValue) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Paid successfully")));
        paymentIntentData = null;
      }).onError((error, stackTrace) {
        print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
      });
    } on StripeException catch (e) {
      print('Exception/DISPLAYPAYMENTSHEET==> $e');
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                content: Text("Cancelled "),
              ));
    } catch (e) {
      print('$e');
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card',
      };
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization': 'Bearer ' +
                'sk_test_51PHlpsRoEY9PrFzvwBUorknKGzTo2GyL0Q6nlo8oizUQxytUANSTz4QIYOUKz2yaMuo43ja6leU6dmKRaxSSkd8T00Cc7V53ou',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
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
