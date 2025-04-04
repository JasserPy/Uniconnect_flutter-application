import 'package:flutter/material.dart';

class AttendanceStyles {
  static const Color primaryColor = Color(0xFF10B981);
  static const Color lateColor = Color(0xFFF59E0B);
  static const Color absentColor = Color(0xFFEF4444);
  static const Color textDark = Color(0xFF1A1A1A);
  static const Color textGrey = Color(0xFF666666);
  static const Color borderColor = Color(0xFF000000);

  static const double borderRadius = 30.0;
  static const double buttonRadius = 20.0;

  static TextStyle headerTitle = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: textDark,
    fontFamily: 'Inter',
  );

  static TextStyle headerSubtitle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: textGrey,
    fontFamily: 'Inter',
  );

  static TextStyle studentName = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: textDark,
    fontFamily: 'Inter',
  );

  static TextStyle buttonText = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: 'Inter',
  );

  static BoxDecoration cardDecoration = BoxDecoration(
    border: Border.all(color: borderColor),
    borderRadius: BorderRadius.circular(borderRadius),
  );

  static ButtonStyle attendanceButtonStyle(Color color) {
    return ButtonStyle(
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(buttonRadius),
          side: BorderSide(color: color),
        ),
      ),
    );
  }
}