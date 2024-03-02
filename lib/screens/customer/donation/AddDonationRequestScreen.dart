import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/form_fields.dart';
import '../../../widgets/text_styles.dart';

class AddDonationRequestScreen extends StatefulWidget {
  const AddDonationRequestScreen({super.key});

  @override
  State<AddDonationRequestScreen> createState() =>
      _AddDonationRequestScreenState();
}

class _AddDonationRequestScreenState extends State<AddDonationRequestScreen> {
  double _sliderCurrentValue = 75;
  bool _isCashSelected = false;
  bool _isCardSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Add Request',
          style: TextStyle(
            fontSize: 17,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            color: AppColors.textColor,
          ),
        ),
        iconTheme: const IconThemeData(color: AppColors.textColor),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const AppMainText(
                text: 'Title',
                fontSize: 16,
              ),
              const SizedBox(
                height: 10,
              ),
              const AppTextFormField(hintText: 'Need Doctor for needy family'),
              const SizedBox(
                height: 20,
              ),
              const AppMainText(text: 'Description', fontSize: 16),
              const SizedBox(
                height: 10,
              ),
              const AppTextFormField(
                hintText: 'Birthday Cake for Orphanage',
                maxLines: 6,
              ),
              const SizedBox(
                height: 20,
              ),
              const AppMainText(text: 'Beneficiary Name', fontSize: 16),
              const SizedBox(
                height: 10,
              ),
              const AppTextFormField(
                hintText: 'John Doe',
                icon: Icons.person_outline_outlined,
                keyboardType: TextInputType.name,
              ),
              const SizedBox(
                height: 20,
              ),
              const AppMainText(text: 'Contact No', fontSize: 16),
              const SizedBox(
                height: 10,
              ),
              const AppTextFormField(
                hintText: '03175167291',
                icon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(
                height: 20,
              ),
              const AppMainText(
                text: 'Meal Requirment',
                fontSize: 16,
              ),
              const SizedBox(
                height: 10,
              ),
              const AppTextFormField(
                  hintText: '2',
                  icon: Icons.set_meal_outlined,
                  keyboardType: TextInputType.number),
              const SizedBox(
                height: 20,
              ),
              const AppLiteText(
                text: 'Quantity: 5 Meals',
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: AppMainText(
                  text: '${_sliderCurrentValue.toInt()} Meals',
                  fontSize: 14,
                ),
              ),
              Slider(
                value: _sliderCurrentValue,
                min: 1,
                max: 250,
                activeColor: AppColors.primaryColor,
                inactiveColor: AppColors.primaryColor.withOpacity(0.25),
                onChanged: (value) {
                  setState(() {
                    _sliderCurrentValue = value;
                  });
                },
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  AppLiteText(
                    text: 'Min: 1',
                    fontSize: 14,
                  ),
                  AppLiteText(
                    text: 'Max: 250',
                    fontSize: 14,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const AppMainText(
                text: 'Donation Amount',
                fontSize: 16,
              ),
              const SizedBox(
                height: 10,
              ),
              const AppTextFormField(
                hintText: '500',
                icon: Icons.attach_money_outlined,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                  child: CustomButton(
                      text: 'post Request',
                      onPressed: () {
                        showModalBottomSheet<void>(
                          showDragHandle: true,
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
                              builder:
                                  (BuildContext context, StateSetter setState) {
                                return SizedBox(
                                  height: 800,
                                  width: 500,
                                  child: SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const AppMainText(
                                            text: 'Select your payment method',
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          CheckboxListTile(
                                            title: const Text('Cash'),
                                            value: _isCashSelected,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                _isCashSelected =
                                                    value ?? false;
                                                if (_isCashSelected) {
                                                  _isCardSelected =
                                                      false; // Unselect card if cash is selected
                                                }
                                              });
                                            },
                                            activeColor: AppColors.primaryColor,
                                            tileColor: _isCashSelected
                                                ? AppColors.primaryColor
                                                    .withOpacity(0.1)
                                                : Colors.transparent,
                                            secondary: const Icon(
                                                Icons.money_outlined),
                                            checkboxShape:
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              side: const BorderSide(
                                                color: AppColors.primaryColor,
                                              ),
                                            ),
                                            controlAffinity:
                                                ListTileControlAffinity
                                                    .trailing,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              side: const BorderSide(
                                                color: AppColors.primaryColor,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          CheckboxListTile(
                                            title: const Text(
                                                'Credit or Debit Card'),
                                            value: _isCardSelected,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                _isCardSelected =
                                                    value ?? false;
                                                if (_isCardSelected) {
                                                  _isCashSelected =
                                                      false; // Unselect cash if card is selected
                                                }
                                              });
                                            },
                                            activeColor: AppColors.primaryColor,
                                            tileColor: _isCardSelected
                                                ? AppColors.primaryColor
                                                    .withOpacity(0.1)
                                                : Colors.transparent,
                                            secondary:
                                                const Icon(Icons.credit_card),
                                            checkboxShape:
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              side: const BorderSide(
                                                color: AppColors.primaryColor,
                                              ),
                                            ),
                                            controlAffinity:
                                                ListTileControlAffinity
                                                    .trailing,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              side: const BorderSide(
                                                color: AppColors.primaryColor,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          const AppLiteText(
                                              text: 'CARD NUMBER'),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      })),
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
