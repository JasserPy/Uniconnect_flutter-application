import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuickActionCard extends StatelessWidget {
  final String emoji;
  final String title;
  final VoidCallback? onTap;
  final bool isDarkMode;

  const QuickActionCard({
    Key? key,
    required this.emoji,
    required this.title,
    this.onTap,
    required this.isDarkMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(19),
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.grey[800]! : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              emoji,
              style: const TextStyle(fontSize: 32),
            ),
            const SizedBox(height: 15),
            Text(
              title,
              style: GoogleFonts.inter(
                color: isDarkMode ? Colors.white : const Color(0xFF1A1A1A),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}