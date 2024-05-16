import 'package:chefease/constants/responsive.dart';
import 'package:chefease/screens/OnBoardingScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'constants/colors.dart';
import 'firebase_options.dart';
//Sameer
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chef Ease',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(color: AppColors.textColor),
          iconTheme: const IconThemeData(color: AppColors.textColor),
        ),
        useMaterial3: false,
      ),
      home: const OnBoardingDelayScreen(), // Display splash screen initially
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xE5FF6A42),
      body: Center(
        child: AnimatedSplashLogo(), // Display animated splash logo
      ),
    );
  }
}

class AnimatedSplashLogo extends StatefulWidget {
  const AnimatedSplashLogo({Key? key}) : super(key: key);

  @override
  _AnimatedSplashLogoState createState() => _AnimatedSplashLogoState();
}

class _AnimatedSplashLogoState extends State<AnimatedSplashLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    // Start the animation when the screen is loaded
    _controller.forward();

    // Delay navigation to onboarding screen after the animation completes
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          child: Image(
            image: AssetImage('assets/imgs/splashlogo.png'),
            fit: BoxFit.cover,
            height: Responsive.screenHeight(context) * 0.4,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class OnBoardingDelayScreen extends StatelessWidget {
  const OnBoardingDelayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
