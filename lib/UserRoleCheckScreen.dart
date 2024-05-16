import "package:chefease/screens/HomeScreen.dart";
import "package:chefease/screens/chef/chef_dashboard/ChefDashboardScreen.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

import "api/chef_api.dart";
import "api/customer_api.dart";

class RoleCheckScreen extends StatefulWidget {
  @override
  _RoleCheckScreenState createState() => _RoleCheckScreenState();
}

class _RoleCheckScreenState extends State<RoleCheckScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CustomerApi _customerApi = CustomerApi();
  final ChefApi _chefApi = ChefApi();

  @override
  void initState() {
    super.initState();
    _checkUserRole();
  }

  Future<void> _checkUserRole() async {
    final User? user = _auth.currentUser;
    if (user != null) {
      try {
        final customerData = await _customerApi.getCustomer(user.uid);
        if (customerData['Role'] == 'Customer') {
          debugPrint("Customer");
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          });
          return;
        }
      } catch (e) {
        debugPrint('No customer data found for this user');
      }

      try {
        final chefData = await _chefApi.getChef(user.uid);
        if (chefData['Role'] == 'Chef') {
          debugPrint("Chef");
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ChefDashboardScreen()),
            );
          });
          return;
        }
      } catch (e) {
        debugPrint('No chef data found for this user');
      }

      // If the user is not a customer or a chef, handle accordingly
      debugPrint("User not found in either 'Customer' or 'Chef' collections");
      // Navigate to a different screen or show a message
    } else {
      debugPrint("new user");
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
