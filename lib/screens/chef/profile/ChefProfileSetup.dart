import 'package:chefease/screens/chef/profile/ChefProfileScreen.dart';
import 'package:chefease/widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../../constants/colors.dart';
import '../../../constants/responsive.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/form_fields.dart';
import '../../../api/chef_api.dart';
import '../../../widgets/toast.dart'; // Import the ChefApi class

class ChefProfileSetupScreen extends StatefulWidget {
  final bool firstTime;

  ChefProfileSetupScreen({this.firstTime = false});

  @override
  State<ChefProfileSetupScreen> createState() => _ChefProfileSetupScreenState();
}

class _ChefProfileSetupScreenState extends State<ChefProfileSetupScreen> {
  final _chefApi = ChefApi(); // Create an instance of ChefApi
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _addressController = TextEditingController();
  final _locationController = TextEditingController();
  final _availabilityController = TextEditingController();
  final _skillsController = TextEditingController();
  File? _profileImage;
  String? _profileImageUrl;
  @override
  Widget build(BuildContext context) {
    double _screenheight = Responsive.screenHeight(context);
    double _screenwidth = Responsive.screenWidth(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: AppMainText(
          text: "Chef Profile",
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
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: _screenheight * 0.01), // 1% of screen height
            // Personal Information Heading
            AppMainText(
              text: "Personal Information",
              fontSize: _screenwidth * 0.045, // 4% of screen width
            ),
            SizedBox(height: _screenheight * 0.03), // 3% of screen height

            Center(
              child: GestureDetector(
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
            ),
            // Profile Image Upload
/*            Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: _screenwidth * 0.125, // 12.5% of screen width
                    backgroundColor: Colors.grey[200],
                    backgroundImage: _profileImage != null
                        ? FileImage(_profileImage!)
                        : null,
                    child: _profileImage == null
                        ? Icon(Icons.camera_alt_outlined,
                            size: _screenwidth * 0.1) // 10% of screen width
                        : null,
                  ),
                ),
                IconButton(
                  onPressed: _pickProfileImage,
                  icon: Icon(Icons.camera_alt,
                      size: _screenwidth * 0.06), // 6% of screen width
                ),
              ],
            ),*/
            SizedBox(height: _screenheight * 0.02), // 2% of screen height
            Center(
              child: TextButton(
                onPressed: _pickProfileImage,
                child: Text('Upload Image'),
              ),
            ),
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
            ProfileCard(
              icon: Icons.location_on_outlined,
              title: 'Address',
              value: _addressController.text,
              onEdit: () {
                _editProfileDetail('Address', _addressController);
              },
            ),
            ProfileCard(
              icon: Icons.location_city_outlined,
              title: 'Location',
              value: _locationController.text,
              onEdit: () {
                _editProfileDetail('Location', _locationController);
              },
            ),
            ProfileCard(
              icon: Icons.lock_clock,
              title: 'Availability',
              value: _availabilityController.text,
              onEdit: () {
                _editProfileDetail('Availability', _availabilityController);
              },
            ),

            ProfileCard(
              icon: Icons.work_outline,
              title: 'Skills',
              value: _skillsController.text,
              onEdit: () {
                _editProfileDetail('Skills', _skillsController);
              },
            ),
            SizedBox(height: _screenheight * 0.025), // 2.5% of screen height
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    if (!widget.firstTime) {
      _fetchChefData();
    }
  }

  void _fetchChefData() async {
    try {
      final firebaseUser = FirebaseAuth.instance.currentUser;
      if (firebaseUser != null) {
        final chefData = await _chefApi.getChef(firebaseUser.uid);

        _nameController.text = chefData['Name'];
        _usernameController.text = chefData['Username'];
        _phoneNumberController.text = chefData['PhoneNumber'];
        _addressController.text = chefData['Address'];
        _locationController.text = chefData['Location'];
        _availabilityController.text = chefData['Availability'];
        _skillsController.text = chefData['SkillsAndExpertise'];
        setState(() {
          _profileImageUrl = chefData['ProfileImageURL'];
        });
      }
    } catch (e) {
      AppToast().toastMessage(
        'An error occurred while fetching chef data: $e',
        isError: true,
      );
    }
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

  void _saveProfile() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;
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
      'ChefFirebaseID': firebaseUser.uid,
      'Name': _nameController.text,
      'Username': _usernameController.text,
      'Email': firebaseUser.email ?? '',
      'PhoneNumber': _phoneNumberController.text,
      'Address': _addressController.text,
      'Location': _locationController.text,
      'Availability': _availabilityController.text,
      'SkillsAndExpertise': _skillsController.text,
    };

    if (_usernameController.text.isEmpty || _nameController.text.isEmpty) {
      // Show an error and return
      AppToast().toastMessage('All fields are required.', isError: true);
      return;
    }

    // Print the content of the request
    debugPrint('Request body: $body');

    try {
      var response;
      if (widget.firstTime) {
        response = await _chefApi.createChef(body, _profileImage);
      } else {
        response = await _chefApi.updateChef(body);
      }

      if (response.statusCode == 200 || response.statusCode == 201) {
        AppToast().toastMessage(widget.firstTime
            ? 'Chef created successfully.'
            : 'Chef updated successfully.');

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ChefProfileScreen()),
        );
      } else {
        AppToast().toastMessage(
            'Failed to ${widget.firstTime ? "create" : "update"} chef. Status code: ${response.statusCode}',
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
