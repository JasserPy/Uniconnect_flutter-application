import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_dashboard/data/notifiers.dart';
import 'package:student_dashboard/widgets/pageswidgets/Student/History/attendance_item.dart';
class AttendanceHistoryScreen extends StatelessWidget {
  final String? subject;
  final String? teacher;
  final String? time;
  final String? date;

  const AttendanceHistoryScreen({
    Key? key,
    this.subject,
    this.teacher,
    this.time,
    this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageisdark,
      builder: (context, bool isDarkMode, child) {
        final backgroundColor = isDarkMode ? Colors.grey[900]! : Colors.white;
        final textColor = isDarkMode ? Colors.white : const Color(0xFF1A1A1A);
        final secondaryTextColor = isDarkMode ? Colors.grey[400]! : const Color(0xFF666666);
        final cardColor = isDarkMode ? Colors.grey[800]! : Colors.white;
        final borderColor = isDarkMode ? Colors.grey[700]! : Colors.black;
        final summaryCardColor = isDarkMode ? Colors.blue[800]! : const Color(0xFF4B7EFF);

        return Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            title: Text(
              subject ?? 'Attendance History',
              style: GoogleFonts.inter(color: textColor),
            ),
            backgroundColor: isDarkMode ? Colors.grey[850]! : Colors.white,
            iconTheme: IconThemeData(color: textColor),
            elevation: 0,
          ),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (teacher != null || time != null || date != null)
                            _buildNotificationHeader(
                              teacher: teacher,
                              time: time,
                              date: date,
                              isDarkMode: isDarkMode,
                              textColor: textColor,
                            ),
                          const SizedBox(height: 25),
                          _buildSection(
                            title: 'LATE',
                            items: [
                              AttendanceItem(
                                date: '12',
                                subject: 'World History',
                                month: 'Sep 12',
                                time: '10:30 AM',
                                showDate: true,
                                isDarkMode: isDarkMode,
                              ),
                              AttendanceItem(
                                subject: 'Calculus',
                                month: 'Sep 19',
                                time: '1:00 PM',
                                showDate: false,
                                isDarkMode: isDarkMode,
                              ),
                            ],
                            isDarkMode: isDarkMode,
                            textColor: textColor,
                            cardColor: cardColor,
                          ),
                          const SizedBox(height: 25),
                          _buildSection(
                            title: 'ABSENCE',
                            items: [
                              AttendanceItem(
                                date: '12',
                                subject: 'World History',
                                month: 'Sep 12',
                                time: '10:30 AM',
                                showDate: true,
                                isDarkMode: isDarkMode,
                              ),
                              AttendanceItem(
                                date: '12',
                                subject: 'World History',
                                month: 'Sep 12',
                                time: '10:30 AM',
                                showDate: true,
                                isDarkMode: isDarkMode,
                              ),
                              AttendanceItem(
                                date: '19',
                                subject: 'Calculus',
                                month: 'Sep 19',
                                time: '1:00 PM',
                                showDate: true,
                                isDarkMode: isDarkMode,
                              ),
                            ],
                            isDarkMode: isDarkMode,
                            textColor: textColor,
                            cardColor: cardColor,
                          ),
                          const SizedBox(height: 25),
                          _buildSummaryCard(
                            isDarkMode: isDarkMode,
                            cardColor: summaryCardColor,
                            borderColor: borderColor,
                            textColor: textColor,
                            secondaryTextColor: secondaryTextColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildNotificationHeader({
    required String? teacher,
    required String? time,
    required String? date,
    required bool isDarkMode,
    required Color textColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[800]! : const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (teacher != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                'Teacher: $teacher',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: textColor,
                ),
              ),
            ),
          if (time != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                'Time: $time',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: textColor,
                ),
              ),
            ),
          if (date != null)
            Text(
              'Date: $date',
              style: GoogleFonts.inter(
                fontSize: 16,
                color: textColor,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<Widget> items,
    required bool isDarkMode,
    required Color textColor,
    required Color cardColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: isDarkMode
            ? []
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 3,
                  offset: const Offset(0, 1),
                ),
              ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
            child: Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: title == 'ABSENCE'
                    ? (isDarkMode ? Colors.red[400] : const Color(0xFFFF3B30))
                    : (isDarkMode ? Colors.orange[400] : const Color(0xFFFF9500)),
              ),
            ),
          ),
          const Divider(height: 1, thickness: 1),
          ...items,
        ],
      ),
    );
  }

  Widget _buildSummaryCard({
    required bool isDarkMode,
    required Color cardColor,
    required Color borderColor,
    required Color textColor,
    required Color secondaryTextColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 13),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
        boxShadow: isDarkMode
            ? []
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
              ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildSummaryItem('3', 'Total Absences', textColor, secondaryTextColor),
          _buildSummaryItem('2', 'Total Late', textColor, secondaryTextColor),
          _buildSummaryItem('90%', 'Attendance Rate', textColor, secondaryTextColor),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(String value, String label, Color textColor, Color secondaryTextColor) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14,
            color: secondaryTextColor,
          ),
        ),
      ],
    );
  }
}