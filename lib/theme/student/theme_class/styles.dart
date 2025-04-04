import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF4B7EFF);
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF666666);
  static const Color background = Color(0xFFFFFFFF);
  static const Color cardBackground = Color(0xFFF8F9FA);
}

class AppTextStyles {
  static const TextStyle title = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.5,
    fontFamily: 'Inter',
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.5,
    fontFamily: 'Inter',
  );

  static const TextStyle body = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.5,
    fontFamily: 'Inter',
  );

  static const TextStyle stats = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.5,
    fontFamily: 'Inter',
  );
}

class AppDecorations {
  static BoxDecoration cardDecoration = BoxDecoration(
    color: AppColors.background,
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.25),
        offset: const Offset(0, 4),
        blurRadius: 4,
      ),
    ],
    border: Border.all(color: Colors.black, width: 1),
  );
}