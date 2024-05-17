import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../widgets/text_styles.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../../../widgets/toast.dart';
import '../../HomeScreen.dart';

import '../../../api/customer_api.dart'; // Import the CustomerApi class

class CustomerProfileScreen extends StatefulWidget {
  final bool firstTime;

  CustomerProfileScreen({this.firstTime = false});

  @override
  _CustomerProfileScreenState createState() => _CustomerProfileScreenState();
}

class _CustomerProfileScreenState extends State<CustomerProfileScreen> {
  final _usernameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _nameController = TextEditingController();

  File? _profileImage;
  String? _profileImageUrl;

  final _customerApi = CustomerApi(); // Create an instance of CustomerApi

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: AppMainText(
          text: "Customer Profile",
          color: AppColors.secondaryColor,
          fontSize: 20,
        ),
        automaticallyImplyLeading: widget.firstTime ? false : true,
        leading: widget.firstTime
            ? null
            : IconButton(
                icon: Icon(Icons.arrow_back_ios_new,
                    color: AppColors.secondaryColor),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
        actions: [
          TextButton(
            onPressed: _saveProfile,
            child: Text(
              widget.firstTime ? 'Save' : 'Update',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //image
            GestureDetector(
              onTap: _pickProfileImage,
              child: CircleAvatar(
                radius: 60,
                backgroundImage: _profileImageUrl != null
                    ? NetworkImage(_profileImageUrl!)
                    : _profileImage != null
                        ? FileImage(_profileImage!)
                        : AssetImage('assets/imgs/jack.png')
                            as ImageProvider<Object>,
              ),
            ),
            TextButton(
              onPressed: _pickProfileImage,
              child: Text('Upload Image'),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(right: 200),
              child: AppMainText(text: "Personal Details"),
            ),
            SizedBox(height: 5),
            ProfileCard(
              icon: Icons.person_outlined,
              title: 'Name',
              value: _nameController.text,
              onEdit: () {
                _editProfileDetail('Name', _nameController);
              },
            ),
            ProfileCard(
              icon: Icons.person_outlined,
              title: 'User Name',
              value: _usernameController.text,
              onEdit: () {
                _editProfileDetail('User Name', _usernameController);
              },
            ),
            ProfileCard(
              icon: Icons.email_outlined,
              title: 'Email',
              value: FirebaseAuth.instance.currentUser!.email!,
              onEdit: null, // Email cannot be edited
            ),
            ProfileCard(
              icon: Icons.phone_outlined,
              title: 'Phone Number',
              value: _phoneNumberController.text,
              onEdit: () {
                _editProfileDetail('Phone Number', _phoneNumberController);
              },
            ),
            // Add more ProfileCard widgets as needed
          ],
        ),
      ),
    );
  }

  void _pickProfileImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (!widget.firstTime) {
      _fetchUserData();
    }
  }

  void _fetchUserData() async {
    try {
      final firebaseUser = FirebaseAuth.instance.currentUser;
      if (firebaseUser != null) {
        final userData = await _customerApi.getCustomer(firebaseUser.uid);

        _usernameController.text = userData['Username'];
        _phoneNumberController.text = userData['PhoneNumber'];
        _nameController.text = userData['Name'];
        // Load the profile image from the URL
        setState(() {
          _profileImageUrl = userData['ProfileImageURL'];
        });
      }
    } catch (e) {
      AppToast().toastMessage(
        'An error occurred while fetching user data: $e',
        isError: true,
      );
    }
  }

  void _saveProfile() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    // Check if the user is logged in
    if (firebaseUser == null) {
      AppToast().toastMessage('User is not logged in.', isError: true);
      return;
    }

    // Check if the user's uid is not null
    if (firebaseUser.uid == null) {
      AppToast()
          .toastMessage('User\'s Firebase ID is not available.', isError: true);
      return;
    }

    var body = {
      'Email': firebaseUser.email ?? '',
      'CustomerFirebaseID': firebaseUser.uid ?? '',
      'Name': _nameController.text,
      'Username': _usernameController.text,
      'PhoneNumber': _phoneNumberController.text,
      'Role': 'Customer',
    };

    if (_usernameController.text.isEmpty ||
        _phoneNumberController.text.isEmpty ||
        _nameController.text.isEmpty) {
      // Show an error and return
      AppToast().toastMessage('All fields are required.', isError: true);
      return;
    }

    // Print the content of the request
    debugPrint('Request body: $body');

    try {
      // Call the API to create or update the customer
      var response;
      if (widget.firstTime) {
        response = await _customerApi.createCustomer(body, _profileImage);
      } else {
        response = await _customerApi.updateCustomer(body);
      }

      if (response.statusCode == 200 || response.statusCode == 201) {
        AppToast().toastMessage(widget.firstTime
            ? 'Customer created successfully.'
            : 'Customer updated successfully.');
        // Navigate to HomeScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        AppToast().toastMessage(
            'Failed to ${widget.firstTime ? "create" : "update"} customer. Status code: ${response.statusCode}',
            isError: true);
      }
    } catch (e) {
      AppToast().toastMessage('An error occurred: $e', isError: true);
    }
  }

  void _editProfileDetail(String title, TextEditingController controller) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Edit $title',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: title,
              labelStyle: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ),
          actions: [
            TextButton(
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'Save',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 16,
                ),
              ),
              onPressed: () {
                setState(() {});
                Navigator.of(context).pop();
              },
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          backgroundColor: Colors.white,
        );
      },
    );
  }
}

class ProfileCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final VoidCallback? onEdit;

  const ProfileCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.value,
    this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 80,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 1,
            offset: Offset(0, 1),
            spreadRadius: 0,
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            Icon(icon, color: AppColors.textColor),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
            Spacer(),
            if (onEdit != null)
              IconButton(
                icon: Icon(Icons.edit),
                color: AppColors.primaryColor,
                onPressed: onEdit,
              ),
          ],
        ),
      ),
    );
  }
}
