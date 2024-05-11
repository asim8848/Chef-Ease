import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/responsive.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/form_fields.dart';
import '../../../widgets/text_styles.dart';


class AddPhotoVideo extends StatefulWidget {
  const AddPhotoVideo({super.key});

  @override
  State<AddPhotoVideo> createState() => _AddPhotoVideoState();
}

class _AddPhotoVideoState extends State<AddPhotoVideo> {
  @override
  Widget build(BuildContext context) {
    double _screenheight = Responsive.screenHeight(context);
    double _screenwidth = Responsive.screenWidth(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        title: AppMainText(text: "Upload Picture or Video",color: AppColors.textColor,fontSize: 18,),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new,color: AppColors.textColor),
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
            AppLiteText(text: "Add Media",fontSize: _screenwidth * 0.04,fontWeight: FontWeight.w500,), // 4% of screen width
            SizedBox(height: _screenheight * 0.010),// 1.5% of screen height
            Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: _screenwidth * 0.125, // 12.5% of screen width
                    backgroundColor: Colors.grey[200],
                    child: Icon(Icons.camera_alt_outlined, size: _screenwidth * 0.1), // 10% of screen width
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Implement image upload functionality
                  },
                  icon: Icon(Icons.camera_alt, size: _screenwidth * 0.06), // 6% of screen width
                ),
              ],
            ),
            SizedBox(height: _screenheight * 0.005), // 0.5% of screen height
            // Form Fields
            AppLiteText(text: "Name",fontSize: _screenwidth * 0.04,fontWeight: FontWeight.w500,), // 4% of screen width
            SizedBox(height: _screenheight * 0.010),// 1.5% of screen height
            AppTextFormField(
              hintText: 'Full Name',
              fontSize: _screenwidth * 0.030,
            ),
            SizedBox(height: _screenheight * 0.015),
            AppLiteText(text: "Description",fontSize: _screenwidth * 0.04,fontWeight: FontWeight.w500,), // 4% of screen width
            SizedBox(height: _screenheight * 0.010),// 1.5% of screen height
            AppTextFormField(
              hintText: 'Description',
              keyboardType: TextInputType.text,
              maxLines: 6,
              fontSize: _screenwidth * 0.030,
            ),
            SizedBox(height: _screenheight * 0.015),
            AppLiteText(text: "Location",fontSize: _screenwidth * 0.04,fontWeight: FontWeight.w500,), // 4% of screen width
            SizedBox(height: _screenheight * 0.010),// 1.5% of screen height
            AppTextFormField(
              hintText: 'Location',
              fontSize: _screenwidth * 0.030,
            ),
            SizedBox(height: _screenheight * 0.050),// 1.5% of screen height
            // Continue Button
            Align(
              alignment: Alignment.center,
              child: CustomButton(
                borderRadius: _screenwidth * 0.0375, // 3.75% of screen width
                text: 'Add Media',
                onPressed: () {
                  // Handle form submission
                },
                backgroundColor: AppColors.primaryColor,
                textColor: Colors.white,

              ),
            ),
          ],
        ),
      ),
    );
  }
}
