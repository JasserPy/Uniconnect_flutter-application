/* home page colors
class AppColors {
  static const Color primary = Color(0xFF4318D1);
  static const Color secondary = Color(0xFF0026FF);
  static const Color background = Colors.white;
  static const Color calendarBg = Color(0xFFDEE7FF);
  static const Color newsBg = Color(0xFFABC3FF);
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF666666);
  static const Color absenceRed = Color(0xFFFF0707);
  static const Color absenceBg = Color(0xCFFEC8C8);
  static const Color delayOrange = Color(0xFFFF942A);
  static const Color delayBg = Color(0xD4FFEAD2);
}*/
import 'package:flutter/material.dart';

class AppColors {
  // Existing colors
  static const Color primary = Color(0xFF4318D1);
  static const Color background = Color(0xFFFFFFFF);
  static const Color cardBackground = Color(0xFFABC3FF);
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF666666);
  static const Color border = Color(0xFF000000);
  static const Color secondary = Color(0xFF0026FF);

  // New colors for DashboardScreen
  static const Color calendarBg =
      Color(0xFFF5F5F5); // Light gray for calendar background
  static const Color newsBg =
      Color(0xFFE0E0E0); // Light gray for news background
  static const Color absenceRed = Color(0xFFD32F2F); // Red for absence status
  static const Color absenceBg =
      Color(0xFFFFCDD2); // Light red for absence background
  static const Color delayOrange = Color(0xFFFF9800); // Orange for delay status
  static const Color delayBg =
      Color(0xFFFFE0B2); // Light orange for delay background
}