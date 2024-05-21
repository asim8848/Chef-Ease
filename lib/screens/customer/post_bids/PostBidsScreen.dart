import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../../constants/responsive.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/form_fields.dart';
import '../../../widgets/text_styles.dart';

class PostBidsScreen extends StatefulWidget {
  final bool isCustomer;  // Added to determine if the user can post
  const PostBidsScreen({super.key, required this.isCustomer});

  @override
  State<PostBidsScreen> createState() => _PostBidsScreenState();
}

class _PostBidsScreenState extends State<PostBidsScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // You can bind these using TextEditingControllers
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController budgetController = TextEditingController();
  final TextEditingController foodCategoryController = TextEditingController();
  final TextEditingController deliveryTimeController = TextEditingController();

  List<bool> _isSelected = [true, false, false]; // Initially, the first container is selected
  String chefLevel = 'Top Rated';  // Default chef level

  void postOffer() async {
    if (!widget.isCustomer) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Only customers can post offers')),
      );
      return;
    }

    final user = _auth.currentUser;
    if (user != null) {
      try {
        await _firestore.collection('bids').add({
          'title': titleController.text,
          'description': descriptionController.text,
          'chefLevel': chefLevel,
          'budget': budgetController.text,
          'foodCategory': foodCategoryController.text,
          'deliveryTime': deliveryTimeController.text,
          'userId': user.uid,
          'postedDate': FieldValue.serverTimestamp(),
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Offer posted successfully!'), backgroundColor: Colors.lightGreen,),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to post offer: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No user logged in')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double _screenwidth = Responsive.screenWidth(context);
    return Scaffold(
      appBar: AppBar(
        title: const AppLiteText(
          text: 'Post Offer',
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: const IconThemeData(color: AppColors.textColor),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Responsive.screenWidth(context) * 0.05),
              Center(
                child: AppLiteText(
                  text: 'Tell the Chefs what you need?',
                ),
              ),
              SizedBox(height: Responsive.screenWidth(context) * 0.05),
              const AppMainText(text: 'Title'),
              SizedBox(height: Responsive.screenWidth(context) * 0.03),
              AppTextFormField(hintText: 'Birthday Cake for my son', controller: titleController),
              SizedBox(height: Responsive.screenWidth(context) * 0.05),
              const AppMainText(text: 'Description'),
              SizedBox(height: Responsive.screenWidth(context) * 0.03),
              AppTextFormField(hintText: 'Describe what you are looking for...', maxLines: 6, controller: descriptionController),
              SizedBox(height: Responsive.screenWidth(context) * 0.05),
              const AppMainText(text: 'Select Chef level'),
              SizedBox(height: Responsive.screenWidth(context) * 0.03),
              // Display the chef levels in a horizontal list
              SizedBox(
                height: _screenwidth * 0.3,
                width: _screenwidth,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            // Update the selected state of all containers
                            for (int i = 0; i < _isSelected.length; i++) {
                              _isSelected[i] = (i == index);
                            }
                            chefLevel = index == 0 ? 'Top Rated' : index == 1 ? 'Level 2' : 'Level 1';
                          });
                        },
                        child: Container(
                          width: _screenwidth * 0.265,
                          decoration: BoxDecoration(
                            color: AppColors.bgColor,
                            borderRadius: BorderRadius.circular(10),
                            border: _isSelected[index]
                                ? Border.all(
                              color: AppColors.primaryColor,
                              width: 2,
                            )
                                : Border.all(
                              color: AppColors.textColor.withOpacity(0.5),
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.person_outline_outlined,
                                  color: _isSelected[index]
                                      ? AppColors.primaryColor
                                      : AppColors.textColor,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                AppLiteText(
                                  text: index == 0
                                      ? 'Top Rated'
                                      : index == 1
                                      ? 'Level 2'
                                      : 'Level 1',
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: Responsive.screenWidth(context) * 0.05),
              const AppMainText(text: 'What is your budget?'),
              SizedBox(height: Responsive.screenWidth(context) * 0.03),
              AppTextFormField(hintText: '0.00', icon: Icons.money_outlined, keyboardType: TextInputType.number, controller: budgetController),
              SizedBox(height: Responsive.screenWidth(context) * 0.05),
              const AppMainText(text: 'Food Category'),
              SizedBox(height: Responsive.screenWidth(context) * 0.03),
              AppTextFormField(hintText: 'Select Food type', icon: Icons.food_bank_outlined, keyboardType: TextInputType.text, controller: foodCategoryController),
              SizedBox(height: Responsive.screenWidth(context) * 0.05),
              const AppMainText(text: 'Delivery Time'),
              SizedBox(height: Responsive.screenWidth(context) * 0.03),
              AppTextFormField(hintText: '2 days', icon: Icons.timelapse_outlined, keyboardType: TextInputType.text, controller: deliveryTimeController),
              SizedBox(height: Responsive.screenWidth(context) * 0.05),
              Center(
                child: CustomButton(text: 'post offer', onPressed: postOffer),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
