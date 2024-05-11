import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:chefease/screens/chef/chefdrawerscreens/SettingsScreen.dart';
import 'package:chefease/screens/customer/drawerscreens/OrderTrack.dart';

import 'package:chefease/widgets/buttons.dart';
import 'package:chefease/widgets/form_fields.dart';
import 'package:chefease/widgets/text_styles.dart';
import '../../constants/colors.dart';
import '../../constants/responsive.dart';
import '../../screens/chef/ChefDashboardScreen.dart';

import '../../screens/chef/chefdrawerscreens/Help&Support.dart';
import '../../screens/chef/chefdrawerscreens/TermsConditionsScreen.dart';

import '../../screens/customer/profile/UserProfileScreen.dart';
import '../toast.dart';
import 'package:sign_in_button/sign_in_button.dart';

class DrawerContent extends StatefulWidget {
  @override
  State<DrawerContent> createState() => _DrawerContentState();
}

class _DrawerContentState extends State<DrawerContent> {
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
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
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
              Container(
                width: _screenWidth * 0.25,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/imgs/jack.png',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: _screenHeight * 0.02,
              ),
              AppMainText(
                text: 'Jack lorem',
              ),
              SizedBox(
                height: _screenHeight * 0.02,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserProfileScreen()),
                  );
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ChefDashboardScreen();
                                },
                              ),
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
                ),
              ),
              Container(
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
              ),
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
                  SignInButton(
                    Buttons.google,
                    text: "Sign in with Google",
                    onPressed: _handleGoogleSignIn,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    mini: false,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  SignInButton(
                    Buttons.facebookNew,
                    text: "Sign in with Facebook",
                    onPressed: _handleGoogleSignIn,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    mini: false,
                  ),
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
      AppToast().toastMessage('Please fill in all the fields.');
      return;
    }

    if (!isEmailValid(email)) {
      AppToast().toastMessage('Please enter a valid email.');
      return;
    }

    if (password.length < 8) {
      AppToast().toastMessage('Password should be at least 8 characters.');
      return;
    }

    if (password != confirmPassword) {
      AppToast().toastMessage('Passwords do not match.');
      return;
    }

    try {
      setState(() {
        _isLoading = true;
      });

      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      debugPrint('User signup successful: ${userCredential.user!.uid}');

      // Clear the form fields after successful signup
      _emailController.clear();
      _passwordController.clear();
      _confirmPasswordController.clear();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        AppToast().toastMessage('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        AppToast().toastMessage('The account already exists for that email.');
      } else {
        AppToast().toastMessage('Signup failed. ${e.message}');
      }
    } catch (e) {
      AppToast().toastMessage('Signup failed. ${e.toString()}');
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
      AppToast().toastMessage('Please fill in all the fields.');
      return;
    }

    if (!isEmailValid(email)) {
      AppToast().toastMessage('Please enter a valid email.');
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
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        AppToast().toastMessage('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        AppToast().toastMessage('Wrong password provided for that user.');
      } else {
        AppToast().toastMessage('Signin failed. ${e.message}');
      }
    } catch (e) {
      AppToast().toastMessage('Signin failed. ${e.toString()}');
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
}
