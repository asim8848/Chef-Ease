import 'package:chefease/widgets/drawer/Drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

import '../../constants/colors.dart';

class ChefDashboardScreen extends StatefulWidget {
  const ChefDashboardScreen({super.key});

  @override
  State<ChefDashboardScreen> createState() => _ChefDashboardScreenState();
}

class _ChefDashboardScreenState extends State<ChefDashboardScreen> {
  final _advancedDrawerController = AdvancedDrawerController();
  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      controller: _advancedDrawerController,
      drawer: DrawerContent(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Chef Dashboard'),
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: const Icon(Icons.menu),
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
