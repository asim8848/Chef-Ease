import 'dart:convert';
import 'package:chefease/api/order_api.dart';
import 'package:chefease/widgets/buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:uuid/uuid.dart';
import '../../../api/recipe_api.dart';
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
  final TextEditingController addressController = TextEditingController();
  Map<String, dynamic>? paymentIntentData;
  int count = 1;
  bool _isCashSelected = true;
  String paymentMethod = 'Cash on Delivery';

  late Future<Map<String, dynamic>> recipeDetailsFuture;

  @override
  void initState() {
    super.initState();
    recipeDetailsFuture = fetchRecipeDetails();
  }

  Future<Map<String, dynamic>> fetchRecipeDetails() async {
    try {
      return await RecipeApi().fetchRecipeDetails(widget.recipeId);
    } catch (e) {
      print('Error fetching recipe details: $e');
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = Responsive.screenHeight(context);
    double screenWidth = Responsive.screenWidth(context);

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
          onPressed: () => Navigator.pop(context),
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
            final double itemPerPrice = recipe['Price'].toDouble();
            final double platformFee = 10.0;
            final double totalPrice = (itemPerPrice * count) + platformFee;

            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTitle('Order Details', screenWidth),
                    SizedBox(height: screenHeight * 0.02),
                    _buildRecipeInfo(recipe, screenWidth, screenHeight),
                    SizedBox(height: screenHeight * 0.03),
                    _buildSectionHeader(
                        'Payment Method', Icons.wallet, screenWidth),
                    SizedBox(height: screenHeight * 0.015),
                    _buildPaymentMethod(screenWidth, screenHeight),
                    Divider(color: Colors.grey),
                    SizedBox(height: screenHeight * 0.015),
                    _buildSectionHeader(
                        'Order Summary', Icons.checklist_outlined, screenWidth),
                    SizedBox(height: screenHeight * 0.015),
                    _buildOrderSummary(recipe, screenWidth),
                    Divider(color: Colors.grey),
                    SizedBox(height: screenHeight * 0.02),
                    _buildSectionHeader(
                        'Address', Icons.location_on_outlined, screenWidth),
                    SizedBox(height: screenHeight * 0.015),
                    _buildAddressInput(screenWidth),
                    SizedBox(height: screenHeight * 0.02),
                    _buildPriceSummary(
                        totalPrice, itemPerPrice, platformFee, screenWidth),
                    SizedBox(height: screenHeight * 0.03),
                    _buildConfirmButton(screenWidth, totalPrice, itemPerPrice),
                    SizedBox(height: screenHeight * 0.02),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildTitle(String title, double screenWidth) {
    return AppMainText(
      text: title,
      fontSize: screenWidth * 0.05,
      color: AppColors.textColor,
      fontWeight: FontWeight.w600,
    );
  }

  Widget _buildRecipeInfo(
      Map<String, dynamic> recipe, double screenWidth, double screenHeight) {
    return Row(
      children: [
        Container(
          width: screenWidth * 0.2,
          height: screenHeight * 0.1,
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.20),
            image: DecorationImage(
              image: NetworkImage(recipe['RecipeImageURL']),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        SizedBox(width: screenWidth * 0.04),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppMainText(
              text: recipe['Title'],
              fontSize: screenWidth * 0.04,
              color: AppColors.textColor,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: screenHeight * 0.005),
            AppLiteText(
              text: '${recipe['Price']} Rs.',
              fontSize: screenWidth * 0.03,
              color: AppColors.textColor,
              fontWeight: FontWeight.w300,
            ),
            SizedBox(height: screenHeight * 0.01),
            Row(
              children: [
                _buildCounterButton(Icons.remove, () {
                  setState(() {
                    if (count > 1) count--;
                  });
                }),
                SizedBox(width: screenWidth * 0.03),
                Text(
                  count.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenWidth * 0.04,
                  ),
                ),
                SizedBox(width: screenWidth * 0.03),
                _buildCounterButton(Icons.add, () {
                  setState(() {
                    count++;
                  });
                }),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCounterButton(IconData icon, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Icon(icon, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon, double screenWidth) {
    return Row(
      children: [
        Icon(icon, color: AppColors.primaryColor, size: screenWidth * 0.05),
        SizedBox(width: screenWidth * 0.02),
        AppMainText(
          text: title,
          fontSize: screenWidth * 0.04,
          color: AppColors.textColor,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }

  Widget _buildPaymentMethod(double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildPaymentOption('Cash on Delivery', _isCashSelected, () {
            setState(() {
              _isCashSelected = true;
              paymentMethod = 'Cash on Delivery';
            });
          }),
          _buildPaymentOption('Online Payment', !_isCashSelected, () {
            setState(() {
              _isCashSelected = false;
              paymentMethod = 'Online Payment';
            });
          }),
        ],
      ),
    );
  }

  Widget _buildPaymentOption(
      String title, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            isSelected
                ? Icons.radio_button_checked
                : Icons.radio_button_unchecked,
            color: AppColors.primaryColor,
          ),
          SizedBox(width: 8),
          AppLiteText(
            text: title,
            fontSize: 14,
            color: AppColors.textColor,
            fontWeight: FontWeight.w300,
          ),
        ],
      ),
    );
  }

  Widget _buildOrderSummary(Map<String, dynamic> recipe, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Column(
        children: [
          _buildSummaryRow('Recipe', recipe['Title']),
          _buildSummaryRow('Price per Item', '${recipe['Price']} Rs.'),
          _buildSummaryRow('Number of Items', '$count'),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppLiteText(
            text: title,
            fontSize: 14,
            color: AppColors.textColor,
            fontWeight: FontWeight.w300,
          ),
          AppLiteText(
            text: value,
            fontSize: 14,
            color: AppColors.textColor,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }

  Widget _buildAddressInput(double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: AppTextFormField(
        hintText: 'Enter your address',
        controller: addressController,
      ),
    );
  }

  Widget _buildPriceSummary(double totalPrice, double itemPerPrice,
      double platformFee, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Column(
        children: [
          _buildPriceRow(
              'Subtotal', '${itemPerPrice * count} Rs.', screenWidth),
          _buildPriceRow('Platform Fee', '$platformFee Rs.', screenWidth),
          _buildPriceRow('Total', '$totalPrice Rs.', screenWidth,
              fontWeight: FontWeight.bold),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String title, String price, double screenWidth,
      {FontWeight fontWeight = FontWeight.w400}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppLiteText(
            text: title,
            fontSize: screenWidth * 0.03,
            color: AppColors.textColor,
            fontWeight: FontWeight.w300,
          ),
          AppLiteText(
            text: price,
            fontSize: screenWidth * 0.03,
            color: AppColors.textColor,
            fontWeight: fontWeight,
          ),
        ],
      ),
    );
  }

  Widget _buildConfirmButton(
      double screenWidth, double totalPrice, double itemPerPrice) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: CustomButton(
        text: 'Confirm',
        borderRadius: 12,
        onPressed: () async {
          if (paymentMethod == 'Cash on Delivery') {
            await _confirmOrder(totalPrice, itemPerPrice);
          } else {
            await _handleStripePayment(totalPrice, itemPerPrice);
          }
        },
      ),
    );
  }

  Future<void> _confirmOrder(double totalPrice, double itemPerPrice) async {
    // Generate a unique OrderID using UUID
    String orderId = Uuid().v4();

    final firebaseUser = FirebaseAuth.instance.currentUser;
    String customerFirebaseId = firebaseUser!.uid;

    // Fetch ChefFirebaseID using the recipe ID
    Map<String, dynamic> recipeDetails =
        await RecipeApi().fetchRecipeDetails(widget.recipeId);
    String chefFirebaseId = recipeDetails['ChefFirebaseID'];

    String address = addressController.text;
    String orderTime = DateTime.now().toIso8601String();
    String status = "Order Placed";

    // Construct the order details
    Map<String, dynamic> orderDetails = {
      "OrderID": orderId,
      "CustomerFirebaseID": customerFirebaseId,
      "ChefFirebaseID": chefFirebaseId,
      "RecipeID": widget.recipeId,
      "NumberOfItems": count,
      "Address": address,
      "TotalPrice": totalPrice,
      "OrderTime": orderTime,
      "Status": status,
      "PaymentMethod": paymentMethod,
      "ItemPerPrice": itemPerPrice,
    };

    // Send order details to the backend
    await _submitOrder(orderDetails);
  }

  Future<void> _handleStripePayment(
      double totalPrice, double itemPerPrice) async {
    try {
      paymentIntentData =
          await _createPaymentIntent(totalPrice.toString(), 'PKR');
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentData!['client_secret'],
        merchantDisplayName: 'Your Merchant Name',
        customerId: paymentIntentData!['customer'],
        customerEphemeralKeySecret: paymentIntentData!['ephemeralKey'],
      ));
      await _displayPaymentSheet(totalPrice, itemPerPrice);
    } catch (e) {
      print('Error handling Stripe payment: $e');
    }
  }

  Future<Map<String, dynamic>> _createPaymentIntent(
      String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': (double.parse(amount) * 100)
            .toInt()
            .toString(), // Stripe requires amount in cents
        'currency': currency,
        'payment_method_types[]': 'card',
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization':
              'Bearer YOUR_STRIPE_SECRET_KEY', // Replace with your Stripe secret key
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: body,
      );

      return jsonDecode(response.body);
    } catch (err) {
      print('Error creating payment intent: ${err.toString()}');
      throw err;
    }
  }

  Future<void> _displayPaymentSheet(
      double totalPrice, double itemPerPrice) async {
    try {
      await Stripe.instance.presentPaymentSheet();
      // Payment successful, create the order
      await _confirmOrder(totalPrice, itemPerPrice);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Payment successful, order placed.')));
    } on StripeException catch (e) {
      print('Error displaying payment sheet: $e');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Payment cancelled.')));
    } catch (e) {
      print('Error displaying payment sheet: $e');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Payment failed.')));
    }
  }

  Future<void> _submitOrder(Map<String, dynamic> orderDetails) async {
    try {
      await OrderApi().createOrder(orderDetails);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Order placed successfully'),
      ));
    } catch (e) {
      print('Error submitting order: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to place order'),
      ));
    }
  }
}
