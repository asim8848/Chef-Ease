import 'package:chefease/widgets/buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../widgets/text_styles.dart';

class ManagePaymentMethod extends StatefulWidget {
  const ManagePaymentMethod({Key? key}) : super(key: key);

  @override
  State<ManagePaymentMethod> createState() => _ManagePaymentMethodState();
}

class _ManagePaymentMethodState extends State<ManagePaymentMethod> {
  int selectedContainerIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: AppMainText(
          text: 'Manage Payment Method',
          fontSize: 18,
          color: AppColors.textColor,
        ),
        backgroundColor: AppColors.secondaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         const  Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: AppMainText(
              text: 'Select Payment Method',
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        const   SizedBox(height: 20),
          _buildPaymentMethodRow(
            index: 0,
            iconPath: 'assets/imgs/visa.png',
            iconWidth: 40,
            iconHeight: 40,
            subTitle: '**** **** **** 8970',
            expireDate: 'Expire Date 12/26',
          ),
          _buildPaymentMethodRow(
            index: 1,
            iconPath: 'assets/imgs/mastercard.png',
            iconWidth: 55,
            iconHeight: 55,
            subTitle: '**** **** **** 8970',
            expireDate: 'Expire Date 12/26',
          ),
          _buildPaymentMethodRow(
            index: 2,
            iconPath: 'assets/imgs/paypal.png',
            iconWidth: 40,
            iconHeight: 40,
            subTitle: 'imsameerakram@gmail.com',
            expireDate: 'Expire Date 12/26',
          ),
          _buildPaymentMethodRow(
            index: 3,
            iconPath: 'assets/imgs/money.png',
            iconWidth: 45,
            iconHeight: 45,
            subTitle: 'Cash',
            expireDate: 'Expire Date 12/26',
          ),
          SizedBox(height: 80,),
          Align(
            alignment: Alignment.center,
            child: CustomButton(
              borderRadius: 12, // 3.75% of screen width
              text: 'Update',
              onPressed: () {
                // Handle form submission
              },
              backgroundColor: AppColors.primaryColor,
              textColor: Colors.white,

            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodRow({
    required int index,
    required String iconPath,
    required String subTitle,
    required String expireDate,
    double iconWidth = 30, // Default width of the icon
    double iconHeight = 30, // Default height of the icon
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedContainerIndex = index;
        });
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        decoration: BoxDecoration(
          color: selectedContainerIndex == index ? Color(0xFFFFEEE9) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selectedContainerIndex == index ? AppColors.primaryColor : AppColors.secondaryColor,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Image.asset(
                  iconPath,
                  width: iconWidth,
                  height: iconHeight,
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      subTitle,
                      style: TextStyle(fontSize: 14, color: AppColors.textColor),
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    expireDate,
                    style: TextStyle(fontSize: 14, color: AppColors.textColor),


                  ),
                ],
              ),
            ],
          ),
        ),
      ),

    );
  }

}
