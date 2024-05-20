import 'dart:io';
import 'package:chefease/api/recipe_api.dart';
import 'package:chefease/constants/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../constants/colors.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/form_fields.dart';
import '../../../widgets/text_styles.dart';
import '../../../widgets/toast.dart';

class AddRecipeScreen extends StatefulWidget {
  AddRecipeScreen({Key? key}) : super(key: key);

  @override
  _AddRecipeScreenState createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final _recipeApi = RecipeApi();
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _sizeController;
  late TextEditingController _priceController;
  late TextEditingController _variationsController;
  List<TextEditingController> _ingredientControllers = [];
  File? _image;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _sizeController = TextEditingController();
    _priceController = TextEditingController();
    _variationsController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _sizeController.dispose();
    _priceController.dispose();
    _variationsController.dispose();
    for (var controller in _ingredientControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _screenheight = Responsive.screenHeight(context);
    double _screenwidth = Responsive.screenWidth(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        title: AppMainText(
          text: "Add Recipe Details",
          color: AppColors.textColor,
          fontSize: 20,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: AppColors.textColor),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: _screenheight * 0.02), // 3% of screen height

            // Profile Image Upload
            AppLiteText(
              text: "Add picture",
              fontSize: _screenwidth * 0.04,
              fontWeight: FontWeight.w500,
            ), // 4% of screen width
            SizedBox(height: _screenheight * 0.010), // 1.5% of screen height
            Center(
              child: GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: _screenwidth * 0.125, // 12.5% of screen width
                  backgroundImage: _image != null
                      ? FileImage(_image!)
                      : AssetImage('assets/imgs/jack.png')
                          as ImageProvider<Object>,
                ),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: _pickImage,
                child: Text('Upload Image'),
              ),
            ),
            SizedBox(
                height: _screenheight * 0.005), // 0. // 0.5% of screen height
            // Form Fields
            AppLiteText(
              text: "Title",
              fontSize: _screenwidth * 0.04,
              fontWeight: FontWeight.w500,
            ), // 4% of screen width
            SizedBox(height: _screenheight * 0.010), // 1.5% of screen height
            AppTextFormField(
              controller: _titleController,
              hintText: 'Biryani',
              keyboardType: TextInputType.text,
              fontSize: _screenwidth * 0.030,
            ),
            SizedBox(height: _screenheight * 0.015),
            AppLiteText(
              text: "Description",
              fontSize: _screenwidth * 0.04,
              fontWeight: FontWeight.w500,
            ), // 4% of screen width
            SizedBox(height: _screenheight * 0.010), // 1.5% of screen height
            AppTextFormField(
              controller: _descriptionController,
              hintText: 'A delicious biryani with a blend of spices and herbs',
              keyboardType: TextInputType.text,
              maxLines: 6,
              fontSize: _screenwidth * 0.030,
            ),
            SizedBox(height: _screenheight * 0.015),
            AppLiteText(
              text: "Ingredients",
              fontSize: _screenwidth * 0.04,
              fontWeight: FontWeight.w500,
            ), // 4% of screen width
            // 1.5% of screen height
            ListView.builder(
              shrinkWrap: true,
              itemCount: _ingredientControllers.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppTextFormField(
                    controller: _ingredientControllers[index],
                    hintText: 'Ingredient ${index + 1}',
                    fontSize: _screenwidth * 0.030,
                  ),
                );
              },
            ),
            TextButton(
              onPressed: _addIngredient,
              child: Text(
                'Add Ingredient',
                style: TextStyle(color: AppColors.primaryColor),
              ),
            ),
            AppLiteText(
              text: "Size",
              fontSize: _screenwidth * 0.04,
              fontWeight: FontWeight.w500,
            ), // 4% of screen width
            SizedBox(height: _screenheight * 0.010), // 1.5% of screen height
            AppTextFormField(
              controller: _sizeController,
              hintText: 'Serving 5 people',
              keyboardType: TextInputType.text,
              fontSize: _screenwidth * 0.030,
            ),
            SizedBox(height: _screenheight * 0.015),
            AppLiteText(
              text: "Price",
              fontSize: _screenwidth * 0.04,
              fontWeight: FontWeight.w500,
            ), // 4% of screen width
            SizedBox(height: _screenheight * 0.010), // 1.5% of screen height
            AppTextFormField(
              controller: _priceController,
              hintText: '300',
              keyboardType: TextInputType.number,
              fontSize: _screenwidth * 0.030,
            ),
            SizedBox(height: _screenheight * 0.015),
            AppLiteText(
              text: "Variations",
              fontSize: _screenwidth * 0.04,
              fontWeight: FontWeight.w500,
            ), // 4% of screen width
            SizedBox(height: _screenheight * 0.010), // 1.5% of screen height
            AppTextFormField(
              controller: _variationsController,
              hintText: 'Veg, Non-Veg, Egg',
              fontSize: _screenwidth * 0.030,
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: _screenheight * 0.030),
            // Continue Button
            Align(
              alignment: Alignment.center,
              child: CustomButton(
                borderRadius: _screenwidth * 0.0375, // 3.75% of screen width
                text: 'Add Meal',
                onPressed: _addRecipe,
                backgroundColor: AppColors.primaryColor,
                textColor: Colors.white,
              ),
            ),
            SizedBox(height: _screenheight * 0.05), // 3% of screen height
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  void _addIngredient() {
    setState(() {
      _ingredientControllers.add(TextEditingController());
    });
  }

  Future<void> _addRecipe() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser == null) {
      AppToast().toastMessage('User is not logged in.', isError: true);
      return;
    }

    if (_titleController.text.isEmpty ||
        _descriptionController.text.isEmpty ||
        _sizeController.text.isEmpty ||
        _priceController.text.isEmpty ||
        _variationsController.text.isEmpty ||
        _image == null) {
      AppToast().toastMessage('All fields are required.', isError: true);
      return;
    }

    // Create a new recipe
    final recipe = {
      'ChefFirebaseID': firebaseUser.uid, // Add ChefFirebaseID
      'RecipeID': 'some-recipe-id', // Add RecipeID or generate it as needed
      'Title': _titleController.text,
      'Description': _descriptionController.text,
      'Ingredients': _ingredientControllers
          .map((controller) => controller.text)
          .toList()
          .join(', '), // Convert list to string
      'Size': _sizeController.text,
      'Price': _priceController.text,
      'Variations': _variationsController.text,
    };

    final response = await _recipeApi.createRecipe(recipe, _image);
    if (response['status'] == 'success') {
      AppToast().toastMessage('Recipe added successfully.');
      Navigator.of(context).pop(); // Close the current screen
    } else {
      AppToast().toastMessage(
          'Failed to add recipe. Error: ${response['message']}',
          isError: true);
    }
  }
}
