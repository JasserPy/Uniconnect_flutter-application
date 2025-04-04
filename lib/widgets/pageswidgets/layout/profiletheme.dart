import 'package:flutter/material.dart';
import 'package:student_dashboard/theme/student/colors.dart';

class ProfileTheme {
  final Color backgroundColor;
  final Color textColor;
  final Color secondaryTextColor;
  final Color cardBackgroundColor;
  final Color borderColor;
  final Color highlightColor;

  const ProfileTheme({
    required this.backgroundColor,
    required this.textColor,
    required this.secondaryTextColor,
    required this.cardBackgroundColor,
    required this.borderColor,
    required this.highlightColor,
  });

  factory ProfileTheme.fromContext(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return ProfileTheme(
      backgroundColor: isDarkMode ? Colors.grey[900]! : AppColors.background,
      textColor: isDarkMode ? Colors.white : AppColors.textPrimary,
      secondaryTextColor:
          isDarkMode ? Colors.grey[400]! : AppColors.textSecondary,
      cardBackgroundColor: isDarkMode ? Colors.grey[800]! : Colors.white,
      borderColor: isDarkMode ? Colors.grey[700]! : Colors.black,
      highlightColor: const Color(0xFF4318D1),
    );
  }
}
