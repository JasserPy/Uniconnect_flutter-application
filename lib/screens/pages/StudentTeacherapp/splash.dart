import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:student_dashboard/screens/pages/StudentTeacherapp/signup_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: SizedBox(
          child: Lottie.asset(
            'assets/anime/intro.json',
            fit: BoxFit.contain,
            frameRate: FrameRate.max,
          ),
        ),
        nextScreen: const SignupScreen(),
        splashIconSize: 1000,
        duration: 10000,
        backgroundColor: Colors.black,
        splashTransition: SplashTransition.fadeTransition,
        animationDuration: const Duration(milliseconds: 1500),
      ),
    );
  }
}
