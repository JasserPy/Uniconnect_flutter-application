import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AttendanceItem extends StatelessWidget {
  final String subject;
  final String month;
  final String time;
  final String? date;
  final bool showDate;
  final bool isDarkMode;

  const AttendanceItem({
    Key? key,
    required this.subject,
    required this.month,
    required this.time,
    this.date,
    required this.showDate,
    required this.isDarkMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cardColor = isDarkMode ? Colors.grey[800]! : const Color(0xFFF8F9FA);
    final textColor = isDarkMode ? Colors.white : const Color(0xFF1A1A1A);
    final secondaryTextColor = isDarkMode ? Colors.grey[400]! : const Color(0xFF666666);
    final timeBoxColor = isDarkMode ? Colors.grey[700]! : Colors.white;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          if (showDate) _buildDateBox(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: showDate ? 16 : 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subject,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    month,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: secondaryTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: timeBoxColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              time,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: secondaryTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateBox() {
    return Container(
      width: 48,
      height: 44,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFFFF3B30), // Keeping red color for dates
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        date ?? '',
        style: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}