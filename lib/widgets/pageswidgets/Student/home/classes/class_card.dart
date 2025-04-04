import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClassCard extends StatelessWidget {
  final String className;
  final String roomNumber;
  final String time;
  final int absences;
  final int late;
  final String attendance;
  final bool isDarkMode;
  final VoidCallback? onTap;

  const ClassCard({
    Key? key,
    required this.className,
    required this.roomNumber,
    required this.time,
    required this.absences,
    required this.late,
    required this.attendance,
    required this.isDarkMode,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cardColor = isDarkMode ? Colors.grey[800]! : Colors.white;
    final textColor = isDarkMode ? Colors.white : const Color(0xFF1A1A1A);
    final secondaryTextColor = isDarkMode ? Colors.grey[400]! : const Color(0xFF666666);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  className,
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.grey[700]! : const Color(0xFFF8F9FA),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    roomNumber,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: secondaryTextColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              time,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: secondaryTextColor,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatItem('$absences', 'Absences', textColor, secondaryTextColor),
                _buildStatItem('$late', 'Late', textColor, secondaryTextColor),
                _buildStatItem(attendance, 'Attendance', textColor, secondaryTextColor),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String value, String label, Color textColor, Color secondaryTextColor) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12,
            color: secondaryTextColor,
          ),
        ),
      ],
    );
  }
}