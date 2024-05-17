import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../../api/chef_api.dart';
import '../../../api/reel_api.dart';
import '../../../constants/colors.dart';
import '../../../constants/responsive.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/form_fields.dart';
import '../../../widgets/text_styles.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:path_provider/path_provider.dart';

import '../../../widgets/toast.dart';

class AddPhotoVideo extends StatefulWidget {
  const AddPhotoVideo({super.key});

  @override
  State<AddPhotoVideo> createState() => _AddPhotoVideoState();
}

class _AddPhotoVideoState extends State<AddPhotoVideo> {
  final _reelApi = ReelApi();
  File? _video;
  File? _videoThumbnail;
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double _screenheight = Responsive.screenHeight(context);
    double _screenwidth = Responsive.screenWidth(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        title: AppMainText(
          text: "Upload Picture or Video",
          color: AppColors.textColor,
          fontSize: 18,
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
              text: "Add Media",
              fontSize: _screenwidth * 0.04,
              fontWeight: FontWeight.w500,
            ), // 4% of screen width
            SizedBox(height: _screenheight * 0.010),
            Center(
              child: GestureDetector(
                onTap: _pickVideo,
                child: CircleAvatar(
                  radius: _screenwidth * 0.125, // 12.5% of screen width
                  backgroundImage: _videoThumbnail != null
                      ? FileImage(_videoThumbnail!)
                      : AssetImage('assets/imgs/jack.png')
                          as ImageProvider<Object>,
                ),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: _pickVideo,
                child: Text('Upload Reel'),
              ),
            ),
            /*Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: _screenwidth * 0.125, // 12.5% of screen width
                    backgroundColor: Colors.grey[200],
                    child: _video != null
                        ? Image.file(_video!)
                        : Icon(Icons.camera_alt_outlined,
                            size: _screenwidth * 0.1), // 10% of screen width
                  ),
                ),
                IconButton(
                  onPressed: _pickVideo,
                  icon: Icon(Icons.camera_alt,
                      size: _screenwidth * 0.06), // 6% of screen width
                ),
              ],
            ),*/
            SizedBox(height: _screenheight * 0.005), // 0.5% of screen height
            // Form Fields
            AppLiteText(
              text: "Name",
              fontSize: _screenwidth * 0.04,
              fontWeight: FontWeight.w500,
            ), // 4% of screen width
            SizedBox(height: _screenheight * 0.010), // 1.5% of screen height
            AppTextFormField(
              controller: _nameController,
              hintText: 'Full Name',
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
              hintText: 'Description',
              keyboardType: TextInputType.text,
              maxLines: 6,
              fontSize: _screenwidth * 0.030,
            ),
            SizedBox(height: _screenheight * 0.015),
            AppLiteText(
              text: "Location",
              fontSize: _screenwidth * 0.04,
              fontWeight: FontWeight.w500,
            ), // 4% of screen width
            SizedBox(height: _screenheight * 0.010), // 1.5% of screen height
            AppTextFormField(
              controller: _locationController,
              hintText: 'Location',
              fontSize: _screenwidth * 0.030,
            ),
            SizedBox(height: _screenheight * 0.050), // 1.5% of screen height
            // Continue Button
            Align(
              alignment: Alignment.center,
              child: CustomButton(
                borderRadius: _screenwidth * 0.0375, // 3.75% of screen width
                text: 'Add Media',
                onPressed: _addMedia,
                backgroundColor: AppColors.primaryColor,
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickVideo() async {
    final pickedVideo =
        await ImagePicker().pickVideo(source: ImageSource.gallery);

    if (pickedVideo != null) {
      setState(() {
        _video = File(pickedVideo.path);
      });
      final thumbnailPath = await VideoThumbnail.thumbnailFile(
        video: _video!.path,
        thumbnailPath: (await getTemporaryDirectory()).path,
        imageFormat: ImageFormat.JPEG,
        maxHeight: 64,
        quality: 75,
      );
      setState(() {
        _videoThumbnail = File(thumbnailPath!);
      });
    }
  }

  Future<void> _addMedia() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser == null) {
      AppToast().toastMessage('User is not logged in.', isError: true);
      return;
    }

    if (_nameController.text.isEmpty ||
        _descriptionController.text.isEmpty ||
        _locationController.text.isEmpty) {
      AppToast().toastMessage('All fields are required.', isError: true);
      return;
    }

    // Fetch the chef data from the database
    final chefData = await ChefApi().getChef(firebaseUser.uid);
    final username = chefData['Username'];

    // Format the current date and time as a string
    String formattedDateTime =
        DateFormat('yyyyMMddHHmmss').format(DateTime.now());

    var body = {
      'ReelID':
          '${username}_$formattedDateTime', // Combine username and current date and time
      'ChefFirebaseID': firebaseUser.uid, // Use the current user's Firebase ID
      'Description': _descriptionController.text,
      'Location': _locationController.text,
    };

    try {
      final statusCode = await _reelApi.createReel(body, _video);

      if (statusCode == 200 || statusCode == 201) {
        AppToast().toastMessage('Reel Uploaded successfully');
        Navigator.of(context).pop(); // Close the current screen
      } else {
        AppToast().toastMessage('Failed to Upload Reel', isError: true);
      }
    } catch (e) {
      AppToast().toastMessage('An error occurred: $e', isError: true);
    }
  }
}
