import 'package:chefease/constants/colors.dart';
import 'package:chefease/widgets/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chefease/api/order_api.dart';
import 'package:chefease/api/customer_api.dart';
import 'package:chefease/api/recipe_api.dart';

import '../../../constants/responsive.dart';

class ChefOrder extends StatefulWidget {
  const ChefOrder({Key? key}) : super(key: key);

  @override
  State<ChefOrder> createState() => _ChefOrderState();
}

class _ChefOrderState extends State<ChefOrder> {
  late Future<List<dynamic>> ordersFuture;
  late Map<String, dynamic> customerDetailsCache;
  late Map<String, dynamic> recipeDetailsCache;

  @override
  void initState() {
    super.initState();
    fetchOrders();
    customerDetailsCache = {};
    recipeDetailsCache = {};
  }

  Future<void> fetchOrders() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      ordersFuture = OrderApi().fetchOrdersByChef(firebaseUser.uid);
    } else {
      ordersFuture = Future.value([]);
    }
  }

  Future<Map<String, dynamic>> fetchCustomerDetails(
      String customerFirebaseId) async {
    try {
      if (!customerDetailsCache.containsKey(customerFirebaseId)) {
        final customerDetails =
            await CustomerApi().getCustomer(customerFirebaseId);
        customerDetailsCache[customerFirebaseId] = customerDetails;
      }
      return customerDetailsCache[customerFirebaseId];
    } catch (error) {
      print('Failed to fetch customer data: $error');
      throw Exception('Failed to fetch customer data.');
    }
  }

  Future<Map<String, dynamic>> fetchRecipeDetails(String recipeId) async {
    try {
      if (!recipeDetailsCache.containsKey(recipeId)) {
        final recipeDetails = await RecipeApi().getRecipeByRecipeId(recipeId);
        recipeDetailsCache[recipeId] = recipeDetails;
      }
      return recipeDetailsCache[recipeId];
    } catch (error) {
      print('Failed to fetch recipe data: $error');
      throw Exception('Failed to fetch recipe data.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
        future: ordersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final orders = snapshot.data ?? [];
            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (BuildContext context, int index) {
                final order = orders[index];
                return FutureBuilder<Map<String, dynamic>>(
                  future: Future.wait([
                    fetchCustomerDetails(order['CustomerFirebaseID']),
                    fetchRecipeDetails(order['RecipeID']),
                  ]).then((results) {
                    return {
                      'customerDetails': results[0],
                      'recipeDetails': results[1],
                    };
                  }),
                  builder: (context, detailsSnapshot) {
                    if (detailsSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (detailsSnapshot.hasError) {
                      return Center(
                          child: Text('Error: ${detailsSnapshot.error}'));
                    } else {
                      final details = detailsSnapshot.data!;
                      final customerDetails = details['customerDetails'] ?? {};
                      final recipeDetails = details['recipeDetails'] ?? {};

                      return _buildOrderListItem(
                          order, customerDetails, recipeDetails);
                    }
                  },
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildOrderListItem(
      Map<String, dynamic> order,
      Map<String, dynamic> customerDetails,
      Map<String, dynamic> recipeDetails) {
    double _screenheight = Responsive.screenHeight(context);
    double _screenwidth = Responsive.screenWidth(context);

    return Card(
      margin: EdgeInsets.all(_screenwidth * 0.02), // 2% of screen width
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: _screenwidth *
                0.02), // 2% of screen width // Add padding horizontally
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  EdgeInsets.all(_screenwidth * 0.02), // 2% of screen width
              child: Row(
                children: [
                  CircleAvatar(
                    radius: _screenwidth * 0.03, // 3% of screen width
                    backgroundImage: customerDetails['ProfileImageURL'] != null
                        ? NetworkImage(customerDetails['ProfileImageURL'])
                        : AssetImage('assets/imgs/person1circle.png')
                            as ImageProvider,
                  ),
                  SizedBox(width: _screenwidth * 0.02), // 2% of screen width
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLiteText(
                        text: customerDetails['Name'] ?? 'N/A',
                        fontSize: _screenwidth * 0.035, // 3.5% of screen width
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AppLiteText(
                        text: 'Status: ',
                        fontSize: _screenwidth * 0.03, // 3% of screen width
                        fontWeight: FontWeight.w500,
                      ),
                      AppLiteText(
                        text: order['Status'] ?? 'N/A',
                        fontSize: _screenwidth * 0.03, // 3% of screen width
                        color: order['Status'] == 'Order Pending'
                            ? Colors.orange
                            : order['Status'] == 'Order Accepted'
                                ? Colors.green
                                : Colors.red,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.all(_screenwidth * 0.02), // 2% of screen width
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: _screenwidth * 0.27, // 27% of screen width
                    height: _screenwidth * 0.27, // 27% of screen width
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: recipeDetails['RecipeImageURL'] != null
                            ? NetworkImage(recipeDetails['RecipeImageURL'])
                            : AssetImage('assets/imgs/pizzamenu.png')
                                as ImageProvider,
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  SizedBox(width: _screenwidth * 0.02), // 2% of screen width
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: _screenwidth * 0.02), // 2% of screen width
                          child: AppMainText(
                            text: recipeDetails['Title'] ?? 'N/A',
                            fontSize: _screenwidth * 0.04, // 4% of screen width
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                            height:
                                _screenheight * 0.01), // 1% of screen height
                        Padding(
                          padding: EdgeInsets.only(
                              left: _screenwidth * 0.02), // 2% of screen width
                          child: AppLiteText(
                            text: recipeDetails['Description'] ?? 'N/A',
                            fontSize:
                                _screenwidth * 0.032, // 3.5% of screen width
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: _screenheight * 0.02), // 2% of screen height
            Row(
              children: [
                Icon(Icons.location_on_outlined,
                    size: _screenwidth * 0.05), // 5% of screen width
                SizedBox(width: _screenwidth * 0.01), // 1% of screen width
                AppLiteText(
                  text: 'Delivery Address:',
                  fontSize: _screenwidth * 0.03, // 3% of screen width
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(width: _screenwidth * 0.01), // 1% of screen width
                Expanded(
                  child: AppLiteText(
                    text: order['Address'] ?? 'N/A',
                    fontSize: _screenwidth * 0.028, // 3% of screen width
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(height: _screenheight * 0.03), // 5% of screen height
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppLiteText(
                  text: 'Quality:',
                  fontSize: _screenwidth * 0.03, // 3% of screen width
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(width: _screenwidth * 0.01), // 1% of screen width
                AppLiteText(
                  text: '${order['NumberOfItems'] ?? 0}x',
                  fontSize: _screenwidth * 0.03, // 3% of screen width
                  fontWeight: FontWeight.w400,
                ),
                Spacer(),
                AppLiteText(
                  text: 'Total:',
                  fontSize: _screenwidth * 0.03, // 3% of screen width
                  color: order['Status'] == 'Order Pending'
                      ? Colors.orange
                      : order['Status'] == 'Order Accepted'
                          ? Colors.green
                          : Colors.red,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(width: _screenwidth * 0.01), // 1% of screen width
                AppLiteText(
                  text: 'Rs. ${order['TotalPrice'] ?? 0}',
                  fontSize: _screenwidth * 0.03, // 3% of screen width
                  color: order['Status'] == 'Order Pending'
                      ? Colors.orange
                      : order['Status'] == 'Order Accepted'
                          ? Colors.green
                          : Colors.red,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
            Padding(
              padding:
                  EdgeInsets.all(_screenwidth * 0.02), // 2% of screen width
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: _screenwidth * 0.4, // 40% of screen width
                    child: OutlinedButton(
                      child: Text("Reject"),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: order['Status'] == 'Order Rejected'
                            ? Colors.red
                            : order['Status'] == 'Order Pending'
                                ? null
                                : Colors.grey,
                        foregroundColor: order['Status'] == 'Order Rejected'
                            ? Colors.black
                            : AppColors.primaryColor,
                        side: BorderSide(
                            color: order['Status'] == 'Order Rejected'
                                ? Colors.red
                                : order['Status'] == 'Order Accepted'
                                    ? Colors.grey
                                    : AppColors.primaryColor),
                      ),
                      onPressed: order['Status'] == 'Order Pending'
                          ? () async {
                              await OrderApi().updateOrderStatus(
                                  order['OrderID'], 'Order Rejected');
                              await fetchOrders();
                              setState(() {});
                            }
                          : null,
                    ),
                  ),
                  SizedBox(
                    width: _screenwidth * 0.4, // 40% of screen width
                    child: ElevatedButton(
                      child: Text("Accept"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: order['Status'] == 'Order Accepted'
                            ? Colors.green
                            : order['Status'] == 'Order Pending'
                                ? AppColors.primaryColor
                                : Colors.grey,
                        foregroundColor: order['Status'] == 'Order Accepted'
                            ? Colors.white
                            : order['Status'] == 'Order Pending '
                                ? Colors.white
                                : Colors.white,
                        elevation: 0,
                      ),
                      onPressed: order['Status'] == 'Order Pending'
                          ? () async {
                              await OrderApi().updateOrderStatus(
                                  order['OrderID'], 'Order Accepted');
                              await fetchOrders();
                              setState(() {});
                            }
                          : null,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
