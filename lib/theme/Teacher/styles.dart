import 'package:flutter/material.dart';

class TeacherStyles {
  // Colors
  static const Color primaryColor = Color(0xFF4318D1);
  static const Color secondaryColor = Color(0xFF0026FF);
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF666666);
  static const Color textTertiary = Color(0xFF999999);
  static const Color backgroundLight = Color(0xFFF8FAFC);
  static const Color presentColor = Color(0xFF10B981);
  static const Color presentBgColor = Color(0xFFECFDF5);
  static const Color absentColor = Color(0xFFEF4444);
  static const Color absentBgColor = Color(0xFFFFDADA);
  static const Color lateColor = Color(0xFFF59E0B);
  static const Color avatarBg = Color(0xFFE5E7EB);

  // Text Styles
  static const TextStyle headerTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: textPrimary,
    height: 1.5,
  );

  static const TextStyle subheaderText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: textPrimary,
    height: 1.5,
  );

  static const TextStyle bodyText = TextStyle(
    fontSize: 16,
    color: textPrimary,
    height: 1.5,
  );

  static const TextStyle captionText = TextStyle(
    fontSize: 14,
    color: textSecondary,
    height: 1.5,
  );

  static const TextStyle smallText = TextStyle(
    fontSize: 12,
    color: textTertiary,
    height: 1.5,
  );

  // Dimensions
  static const double defaultPadding = 20.0;
  static const double smallPadding = 12.0;
  static const double largePadding = 24.0;
  static const double borderRadius = 30.0;
  static const double cardBorderRadius = 12.0;
  static const double itemBorderRadius = 4.0;
  static const double avatarSize = 40.0;
  static const double statusIndicatorSize = 12.0;

  // Button Styles
  static final ButtonStyle primaryButton = ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(
      horizontal: defaultPadding,
      vertical: smallPadding,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6),
    ),
  );
}