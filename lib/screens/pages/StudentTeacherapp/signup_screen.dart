import 'package:flutter/material.dart';
import 'package:student_dashboard/data/notifiers.dart';
import 'package:student_dashboard/screens/pages/StudentTeacherapp/mother_widgets.dart';
import 'package:student_dashboard/screens/pages/StudentTeacherapp/teacher_widgets.dart';

import '../../../fonts/CustomTextField.dart';

class SocialLoginButton extends StatelessWidget {
  final String text;
  final Widget icon;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final Color labelColor;

  const SocialLoginButton({
    Key? key,
    required this.text,
    required this.icon,
    this.backgroundColor = const Color.fromARGB(255, 255, 255, 255),
    this.textColor = const Color(0xFF1A1A1A),
    this.borderColor = const Color(0xFFE0E0E0),
    this.labelColor = const Color.fromARGB(255, 255, 255, 255),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 24, height: 24, child: icon),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _handleSignup(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;

    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.endsWith('@student.com')) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MotherWidgets()),
      );
    } else if (email.endsWith('@teacher.com')) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const TeacherWidgets()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please use a valid student or teacher email'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageisdark,
      builder: (context, bool isDarkMode, child) {
        final backgroundColor = isDarkMode ? Colors.grey[900] : Colors.white;
        final textColor = isDarkMode ? Colors.white : Colors.black;
        final secondaryTextColor =
            isDarkMode ? Colors.grey[400] : Colors.grey[700];
        final borderColor = isDarkMode ? Colors.grey[700] : Colors.grey[300];
        final labelColor = isDarkMode ? Colors.white : Colors.black;
        final isLargeScreen = MediaQuery.of(context).size.width > 640;

        return Scaffold(
          backgroundColor: backgroundColor,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isLargeScreen ? 36 : 16,
                  vertical: isLargeScreen ? 54 : 20,
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 427),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 387),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Profile Section
                              Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(89),
                                    child: Image.asset(
                                      'assets/images/logo-isima.jpg',
                                      width: isLargeScreen ? 173 : 140,
                                      height: isLargeScreen ? 167 : 140,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Text(
                                    'Uniconnect',
                                    style: TextStyle(
                                      color: textColor,
                                      fontFamily: 'Inter',
                                      fontSize: isLargeScreen ? 24 : 20,
                                      fontWeight: FontWeight.w700,
                                      height: 1.5,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 27),

                              // Create Account Section
                              Column(
                                children: [
                                  Text(
                                    'Create an account',
                                    style: TextStyle(
                                      color: textColor,
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      height: 1.5,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    'Enter your email to sign up for this app',
                                    style: TextStyle(
                                      color: secondaryTextColor,
                                      fontFamily: 'Inter',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      height: 1.5,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),

                              // Input Fields
                              Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    CustomTextField(
                                      controller: _emailController,
                                      label: 'Email Address',
                                      placeholder: 'email@domain.com',
                                      textColor: textColor,
                                      labelColor: labelColor,
                                      keyboardType: TextInputType.emailAddress,
                                      borderColor: const Color(0xFF000000),
                                      focusedBorderColor:
                                          const Color(0xFF4318D1),
                                    ),
                                    const SizedBox(height: 24),
                                    CustomTextField(
                                      controller: _passwordController,
                                      label: 'Password',
                                      placeholder: 'Enter your password',
                                      isPassword: true,
                                      textColor: textColor,
                                      labelColor: labelColor,
                                      borderColor: const Color(0xFF000000),
                                      focusedBorderColor:
                                          const Color(0xFF4318D1),
                                    ),
                                    const SizedBox(height: 24),

                                    // Continue Button
                                    SizedBox(
                                      width: double.infinity,
                                      height: 40,
                                      child: ElevatedButton(
                                        onPressed: () => _handleSignup(context),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFF4318D1),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        child: const Text(
                                          'Continue',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Inter',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            height: 1.4,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Divider
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 24),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Divider(color: borderColor),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: Text(
                                        'or',
                                        style: TextStyle(
                                          color: secondaryTextColor,
                                          fontFamily: 'Inter',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          height: 1.4,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Divider(color: borderColor),
                                    ),
                                  ],
                                ),
                              ),

                              // Terms and Conditions
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style: TextStyle(
                                      color: secondaryTextColor,
                                      fontFamily: 'Inter',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      height: 1.5,
                                    ),
                                    children: [
                                      const TextSpan(
                                          text:
                                              'By clicking continue, you agree to our '),
                                      TextSpan(
                                        text: 'Terms of Service',
                                        style: TextStyle(color: textColor),
                                      ),
                                      const TextSpan(text: ' and '),
                                      TextSpan(
                                        text: 'Privacy Policy',
                                        style: TextStyle(color: textColor),
                                      ),
                                      const TextSpan(
                                          text:
                                              '\nThis App Create By Jasser hamrouni '),
                                      const TextSpan(
                                          text: '\nteam Uniconnect '),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
