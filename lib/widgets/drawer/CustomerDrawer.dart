//path to this file: lib/widgets/drawer/CustomerDrawer.dart
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:chefease/widgets/buttons.dart';
import 'package:chefease/widgets/form_fields.dart';
import 'package:chefease/widgets/text_styles.dart';
import '../../constants/colors.dart';
import '../../constants/responsive.dart';
import '../../screens/HomeScreen.dart';
import '../../screens/chef/chef_dashboard/ChefDashboardScreen.dart';

import '../../screens/customer/profile/CustomerProfileScreen.dart';
import '../../screens/drawer_screens/Help&SupportScreen.dart';
import '../../screens/drawer_screens/CustomerOrderTrackScreen.dart';
import '../../screens/drawer_screens/SettingsScreen.dart';
import '../../screens/drawer_screens/TermsConditionsScreen.dart';
import '../toast.dart';
import 'package:sign_in_button/sign_in_button.dart';
import '../../../api/customer_api.dart'; // Import the CustomerApi class

import 'package:flutter/services.dart';

class CustomerDrawerContent extends StatefulWidget {
  @override
  State<CustomerDrawerContent> createState() => _CustomerDrawerContentState();
}

class _CustomerDrawerContentState extends State<CustomerDrawerContent> {
  final _customerApi = CustomerApi();
  User? _user;

  Map<String, dynamic>? _userData;
  int _selectedIndex = -1;
  bool _isSigningUp = false;
  bool _isLoading = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _checkUserLoginStatus();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _checkUserLoginStatus();
  }

  void _checkUserLoginStatus() async {
    _user = _auth.currentUser;
    if (_user != null) {
      _userData = await _customerApi.getCustomer(_user!.uid);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double _screenHeight = Responsive.screenHeight(context);
    double _screenWidth = Responsive.screenWidth(context);

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Container(
          margin: const EdgeInsets.only(top: 20),
          width: _screenWidth * 0.7,
          height: _screenHeight,
          child: Column(
            children: [
              // User profile image
              FutureBuilder<Map<String, dynamic>>(
                future: FirebaseAuth.instance.currentUser != null
                    ? _customerApi
                        .getCustomer(FirebaseAuth.instance.currentUser!.uid)
                    : null,
                builder: (context, snapshot) {
                  if (FirebaseAuth.instance.currentUser == null) {
                    // User is not logged in, display default values
                    return CircleAvatar(
                      radius: _screenWidth * 0.125,
                      backgroundImage: AssetImage('assets/imgs/jack.png'),
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return CircleAvatar(
                      radius: _screenWidth * 0.125,
                      backgroundImage:
                          NetworkImage(snapshot.data!['ProfileImageURL']),
                    );
                  }
                },
              ),
              SizedBox(
                height: _screenHeight * 0.02,
              ),
              // User name
              AppMainText(
                text: _user == null || _userData == null
                    ? 'jack'
                    : _userData!['Name'],
              ),
              SizedBox(
                height: _screenHeight * 0.02,
              ),
              GestureDetector(
                onTap: () {
                  if (_auth.currentUser == null) {
                    AppToast().toastMessage('Please login to view profile.',
                        isError: true);
                    _showSignupLoginModal();
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CustomerProfileScreen(),
                      ),
                    );
                  }
                },
                child: AppLiteText(
                  text: 'View Profile',
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(
                height: 20,
                thickness: 1,
              ),
              Expanded(
                flex: 6,
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                          if (_getTileTitle(index) == 'Chef Mode') {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Confirmation'),
                                  content: Text(
                                      'Are you sure you want to switch to Chef Mode? This will sign out the current user.'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('No'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: Text('Yes'),
                                      onPressed: () async {
                                        // Sign out the current user
                                        await FirebaseAuth.instance.signOut();

                                        // Navigate to ChefDashboardScreen
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ChefDashboardScreen(),
                                          ),
                                          (route) =>
                                              false, // remove all previous routes
                                        );
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            // Handle navigation for other tiles if needed
                          }
                          if (_getTileTitle(index) == 'Settings') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Settings();
                                },
                              ),
                            );
                          } else {
                            // Handle navigation for other tiles if needed
                          }
                        });
                        if (_getTileTitle(index) == 'Help/Support') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return HelpSupport();
                              },
                            ),
                          );
                        } else {
                          // Handle navigation for other tiles if needed
                        }
                        if (_getTileTitle(index) == 'Terms & Conditions') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return TermsConditions();
                              },
                            ),
                          );
                        } else {
                          // Handle navigation for other tiles if needed
                        }
                        if (_getTileTitle(index) == 'Orders Track') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return OrderTrack();
                              },
                            ),
                          );
                        } else {
                          // Handle navigation for other tiles if needed
                        }
                      },
                      leading: Icon(
                        _getLeadingIcon(index),
                        color: _getTileColor(index),
                      ),
                      title: AppLiteText(
                        text: _getTileTitle(index),
                        color: _getTileColor(index),
                      ),
                      contentPadding: const EdgeInsets.only(left: 40),
                      selectedTileColor:
                          AppColors.primaryColor.withOpacity(0.2),
                      iconColor: AppColors.textColor,
                      horizontalTitleGap: 0,
                      selected: _selectedIndex == index,
                    );
                  },
                ), // Drawer items
              ),
              // Signup/Login button
              _auth.currentUser == null
                  ? Container(
                      width: _screenWidth,
                      height: _screenHeight * 0.08,
                      color: AppColors.primaryColor,
                      child: Center(
                        child: ListTile(
                          leading: Icon(
                            Icons.exit_to_app_outlined,
                            color: AppColors.secondaryColor,
                          ),
                          title: AppLiteText(
                            text: 'Signup or Login',
                            color: Colors.white,
                            fontFamily: 'Poppins',
                          ),
                          contentPadding: const EdgeInsets.only(left: 40),
                          onTap: _showSignupLoginModal,
                        ),
                      ),
                    ) // Signup/Login button
                  : Container(
                      width: _screenWidth,
                      height: _screenHeight * 0.08,
                      color: AppColors.primaryColor,
                      child: Center(
                        child: ListTile(
                          leading: Icon(
                            Icons.logout,
                            color: AppColors.secondaryColor,
                          ),
                          title: AppLiteText(
                            text: 'Logout',
                            color: Colors.white,
                            fontFamily: 'Poppins',
                          ),
                          contentPadding: const EdgeInsets.only(left: 40),
                          onTap: _handleSignOut,
                        ),
                      ),
                    ), // Logout button
            ],
          ),
        ),
      ),
    );
  }

  IconData _getLeadingIcon(int index) {
    switch (index) {
      case 0:
        return Icons.settings;
      case 1:
        return Icons.help_outline_outlined;
      case 2:
        return Icons.maps_home_work_outlined;
      case 3:
        return Icons.task_outlined;
      case 4:
        return Icons.track_changes_outlined;
      case 5:
        return Icons.request_page_outlined;
      default:
        return Icons.settings;
    }
  }

  String _getTileTitle(int index) {
    switch (index) {
      case 0:
        return 'Settings';
      case 1:
        return 'Help/Support';
      case 2:
        return 'Chef Mode';
      case 3:
        return 'Terms & Conditions';
      case 4:
        return 'Orders Track';
      case 5:
        return 'Bid Request';
      default:
        return 'Settings';
    }
  }

  Color _getTileColor(int index) {
    return _selectedIndex == index
        ? AppColors.primaryColor
        : AppColors.textColor;
  }

  void _showSignupLoginModal() {
    showModalBottomSheet<void>(
      isScrollControlled: true,
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
          builder: (BuildContext context, StateSetter setState) {
            final screenHeight = MediaQuery.of(context).size.height;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.02),
                  AppMainText(text: 'Signup or Login'),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isSigningUp = true;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _isSigningUp
                              ? AppColors.primaryColor
                              : AppColors.bgColor,
                          fixedSize:
                              Size(MediaQuery.of(context).size.width * 0.3, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text('Signup'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isSigningUp = false;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: !_isSigningUp
                              ? AppColors.primaryColor
                              : AppColors.bgColor,
                          fixedSize:
                              Size(MediaQuery.of(context).size.width * 0.3, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text('Signin'),
                      ),
                    ],
                  ),
                  if (_isSigningUp)
                    Column(
                      children: [
                        SizedBox(height: screenHeight * 0.02),
                        AppTextFormField(
                          hintText: 'Email',
                          keyboardType: TextInputType.emailAddress,
                          icon: Icons.email_outlined,
                          controller: _emailController,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        AppTextFormField(
                          hintText: 'Password',
                          keyboardType: TextInputType.visiblePassword,
                          icon: Icons.lock_outline,
                          obscureText: true,
                          controller: _passwordController,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        AppTextFormField(
                          hintText: 'Confirm Password',
                          keyboardType: TextInputType.visiblePassword,
                          icon: Icons.lock_outline,
                          obscureText: true,
                          controller: _confirmPasswordController,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        CustomButton(
                            text: 'Continue',
                            width: 0.9,
                            height: 0.07,
                            borderRadius: 15,
                            isLoading: _isLoading,
                            onPressed: () {
                              // Call signup function
                              _signupButtonPressed();
                              debugPrint('Signup button pressed');
                            } // Call signup function
                            ),
                      ],
                    ),
                  if (!_isSigningUp)
                    Column(
                      children: [
                        SizedBox(height: screenHeight * 0.02),
                        AppTextFormField(
                          hintText: 'Email',
                          keyboardType: TextInputType.emailAddress,
                          icon: Icons.email_outlined,
                          controller: _emailController,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        AppTextFormField(
                          hintText: 'Password',
                          keyboardType: TextInputType.visiblePassword,
                          icon: Icons.lock_outline,
                          obscureText: true,
                          controller: _passwordController,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        CustomButton(
                          text: 'Continue',
                          width: 0.9,
                          height: 0.07,
                          borderRadius: 15, isLoading: _isLoading,
                          onPressed:
                              _signinButtonPressed, // Call signin function
                        ),
                      ],
                    ),
                  SizedBox(height: screenHeight * 0.02),
                  // SignInButton(
                  //   Buttons.google,
                  //   text: "Sign in with Google",
                  //   onPressed: _handleGoogleSignIn,
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(5),
                  //   ),
                  //   mini: false,
                  // ),
                  // SizedBox(height: screenHeight * 0.02),
                  // SignInButton(
                  //   Buttons.facebookNew,
                  //   text: "Sign in with Facebook",
                  //   onPressed: _handleGoogleSignIn,
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(5),
                  //   ),
                  //   mini: false,
                  // ),
                  SizedBox(height: screenHeight * 0.02),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _signupButtonPressed() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      AppToast().toastMessage('Please fill in all the fields.', isError: true);
      return;
    }

    if (!isEmailValid(email)) {
      AppToast().toastMessage('Please enter a valid email.', isError: true);
      return;
    }

    if (password.length < 8) {
      AppToast().toastMessage('Password should be at least 8 characters.',
          isError: true);
      return;
    }

    if (password != confirmPassword) {
      AppToast().toastMessage('Passwords do not match.', isError: true);
      return;
    }

    try {
      setState(() {
        _isLoading = true;
      });

      // Sign up the user
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // If the sign up was successful, navigate to the UserProfileScreen
      if (userCredential.user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CustomerProfileScreen(firstTime: true),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      AppToast().toastMessage('Failed to sign up: $e', isError: true);
    } catch (e) {
      AppToast().toastMessage('An error occurred: $e', isError: true);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _signinButtonPressed() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      AppToast().toastMessage('Please fill in all the fields.', isError: true);
      return;
    }

    if (!isEmailValid(email)) {
      AppToast().toastMessage('Please enter a valid email.', isError: true);
      return;
    }

    try {
      setState(() {
        _isLoading = true;
      });

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      _emailController.clear();
      _passwordController.clear();
      //go to HomeScreen screen and remove all the previous routes
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        AppToast().toastMessage('No user found for that email.', isError: true);
      } else if (e.code == 'wrong-password') {
        AppToast().toastMessage('Wrong password provided for that user.',
            isError: true);
      } else {
        AppToast().toastMessage('Signin failed. ${e.message}', isError: true);
      }
    } catch (e) {
      AppToast().toastMessage('Signin failed. ${e.toString()}', isError: true);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  bool isEmailValid(String email) {
    final RegExp regex =
        RegExp(r'^[a-zA-Z0-9.a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
    return regex.hasMatch(email);
  }

  void _handleGoogleSignIn() async {
    try {
      GoogleAuthProvider _googleAuthProvider = GoogleAuthProvider();
      await _auth.signInWithProvider(_googleAuthProvider);
    } catch (error) {
      print('Google sign in failed: $error');
    }
  }

  Future<void> _handleSignOut() async {
    try {
      await _auth.signOut();
      setState(() {}); // Refresh the UI after logout
    } catch (e) {
      print('Sign out failed: $e');
    }
  }
}
