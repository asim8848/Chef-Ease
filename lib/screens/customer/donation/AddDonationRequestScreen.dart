import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../../../api/donation_api.dart';
import '../../../api/customer_api.dart';
import '../../../constants/colors.dart';
import '../../../constants/responsive.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/form_fields.dart';
import '../../../widgets/text_styles.dart';
import '../../../widgets/toast.dart';

class AddDonationRequestScreen extends StatefulWidget {
  const AddDonationRequestScreen({super.key});

  @override
  State<AddDonationRequestScreen> createState() =>
      _AddDonationRequestScreenState();
}

class _AddDonationRequestScreenState extends State<AddDonationRequestScreen> {
  double _sliderCurrentValue = 75;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _beneficiaryNameController =
      TextEditingController();
  final TextEditingController _contactNumberController =
      TextEditingController();
  final TextEditingController _donationAmountController =
      TextEditingController();

  Future<void> _submitDonationRequest() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      final customerData = await CustomerApi().getCustomer(firebaseUser.uid);
      if (customerData != null && customerData['Username'] != null) {
        final createdBy = customerData['CustomerFirebaseID'];

        final donationRequestData = {
          "DonationRequestID": Uuid().v4(),
          "Title": _titleController.text,
          "Description": _descriptionController.text,
          "BeneficiaryName": _beneficiaryNameController.text,
          "ContactNumber": _contactNumberController.text,
          "MealQuantity": _sliderCurrentValue.toInt(),
          "DonationAmount": double.parse(_donationAmountController.text),
          "CurrentAmount": 0.0,
          "Donors": [],
          "CreatedBy": createdBy,
          "Status": "Pending",
          "CreatedAt": DateTime.now().toIso8601String()
        };

        await DonationApi().createDonationRequest(donationRequestData);

        AppToast().toastMessage('Donation request created successfully');
        Navigator.pop(context);
      } else {
        AppToast().toastMessage(
            'Error: customerData is null or Username is null',
            isError: true);
      }
    } else {
      AppToast().toastMessage('Error: firebaseUser is null', isError: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    double _screenwidth = Responsive.screenWidth(context);
    double _screenheight = Responsive.screenHeight(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const AppLiteText(
          text: 'Add Request',
          fontSize: 17,
          fontWeight: FontWeight.w600,
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
              SizedBox(
                height: _screenwidth * 0.05,
              ),
              const AppMainText(
                text: 'Title',
              ),
              SizedBox(
                height: _screenwidth * 0.03,
              ),
              AppTextFormField(
                hintText: 'Need Doctor for needy family',
                controller: _titleController,
              ),
              SizedBox(
                height: _screenwidth * 0.05,
              ),
              const AppMainText(
                text: 'Description',
              ),
              SizedBox(
                height: _screenwidth * 0.03,
              ),
              AppTextFormField(
                hintText: 'Birthday Cake for Orphanage',
                maxLines: 6,
                controller: _descriptionController,
              ),
              SizedBox(
                height: _screenwidth * 0.05,
              ),
              const AppMainText(
                text: 'Beneficiary Name',
              ),
              SizedBox(
                height: _screenwidth * 0.03,
              ),
              AppTextFormField(
                hintText: 'John Doe',
                icon: Icons.person_outline_outlined,
                keyboardType: TextInputType.name,
                controller: _beneficiaryNameController,
              ),
              SizedBox(
                height: _screenwidth * 0.05,
              ),
              const AppMainText(
                text: 'Contact No',
              ),
              SizedBox(
                height: _screenwidth * 0.03,
              ),
              AppTextFormField(
                hintText: '03175167291',
                icon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
                controller: _contactNumberController,
              ),
              SizedBox(
                height: _screenwidth * 0.05,
              ),
              const AppLiteText(
                text: 'Quantity: 5 Meals',
              ),
              SizedBox(
                height: _screenwidth * 0.03,
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
              SizedBox(
                height: _screenwidth * 0.05,
              ),
              const AppMainText(
                text: 'Donation Amount',
              ),
              SizedBox(
                height: _screenwidth * 0.03,
              ),
              AppTextFormField(
                hintText: '500',
                icon: Icons.attach_money_outlined,
                keyboardType: TextInputType.number,
                controller: _donationAmountController,
              ),
              SizedBox(
                height: _screenwidth * 0.05,
              ),
              Center(
                child: CustomButton(
                  text: 'Post Request',
                  onPressed: _submitDonationRequest,
                ),
              ),
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
