import 'package:flutter/material.dart';
import 'package:student_dashboard/theme/student/theme_class/styles.dart';
class SummaryCard extends StatelessWidget {
  final int totalAbsences;
  final int totalLate;
  final String attendanceRate;
  final bool isDarkMode;
  final VoidCallback? onTap;

  const SummaryCard({
    Key? key,
    required this.totalAbsences,
    required this.totalLate,
    required this.attendanceRate,
    required this.isDarkMode,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cardColor = isDarkMode ? Colors.blue[800]! : AppColors.primary;
    final borderColor = isDarkMode ? Colors.grey[700]! : Colors.black;
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final secondaryTextColor =
        isDarkMode ? Colors.grey[300]! : const Color(0xFF666666);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 408),
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 13),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isDarkMode ? 0.1 : 0.25),
              offset: const Offset(0, 4),
              blurRadius: 4,
            ),
          ],
          border: Border.all(color: borderColor, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildSummaryItem('$totalAbsences', 'Total Absences', textColor,
                secondaryTextColor),
            _buildSummaryItem(
                '$totalLate', 'Total Late', textColor, secondaryTextColor),
            _buildSummaryItem(attendanceRate, 'Attendance Rate', textColor,
                secondaryTextColor),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryItem(
      String value, String label, Color textColor, Color secondaryTextColor) {
    return Column(
      children: [
        Text(
          value,
          style: AppTextStyles.stats.copyWith(color: textColor),
        ),
        const SizedBox(height: 7),
        Text(
          label,
          style: AppTextStyles.body.copyWith(color: secondaryTextColor),
        ),
      ],
    );
  }
}
