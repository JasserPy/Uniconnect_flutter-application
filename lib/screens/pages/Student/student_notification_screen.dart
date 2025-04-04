import 'package:flutter/material.dart';
import 'package:student_dashboard/data/notifiers.dart';
import 'package:student_dashboard/screens/pages/Student/AttendanceHistoryScreen.dart';
import '../../../theme/student/colors.dart';
import '../../../widgets/pageswidgets/layout/profile_header.dart';
import '../../../widgets/pageswidgets/Student/page/notification_card.dart';
import '../../../widgets/pageswidgets/Student/attendance_stats.dart';

class StudentNotificationScreen extends StatelessWidget {
  const StudentNotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageisdark,
      builder: (context, bool isDarkMode, child) {
        final backgroundColor =
            isDarkMode ? Colors.grey[900]! : AppColors.background;
        final textColor = isDarkMode ? Colors.white : AppColors.textPrimary;
        final secondaryTextColor =
            isDarkMode ? Colors.grey[400]! : AppColors.textSecondary;
        final cardBackgroundColor =
            isDarkMode ? Colors.grey[800]! : Colors.white;
        final borderColor = isDarkMode ? Colors.grey[700]! : Colors.black;

        return Scaffold(
          backgroundColor: backgroundColor,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProfileHeader(
                    isTeacher: false,
                    backgroundColor:
                        isDarkMode ? Colors.grey[850]! : AppColors.background,
                    borderColor:
                        isDarkMode ? Colors.grey[800]! : AppColors.border,
                    textPrimaryColor: textColor,
                    textSecondaryColor: secondaryTextColor,
                    iconColor: isDarkMode ? Colors.orange : Colors.blueAccent,
                  ),
                  const SizedBox(height: 11),
                  _buildUpcomingChangesSection(
                    context: context,
                    cardBackgroundColor: cardBackgroundColor,
                    borderColor: borderColor,
                    textColor: textColor,
                    secondaryTextColor: secondaryTextColor,
                  ),
                  const SizedBox(height: 11),
                  _buildSelectNotificationSection(
                    textColor: textColor,
                    secondaryTextColor: secondaryTextColor,
                  ),
                  const SizedBox(height: 11),
                  const AttendanceStats(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildUpcomingChangesSection({
    required BuildContext context,
    required Color cardBackgroundColor,
    required Color borderColor,
    required Color textColor,
    required Color secondaryTextColor,
  }) {
    final notifications = [
      {
        'subject': 'Mathematics 101',
        'teacher': 'Ms. Sarah Parker',
        'time': '09:00 AM',
        'date': 'Today',
        'color': const Color(0xFFFFC5C5),
        'image':
            'https://cdn.builder.io/api/v1/image/assets/TEMP/855bb0ae05b659d89b5a84314ba36afcfdbccb4101f8f77855ae34bf3fdbfc08',
      },
      {
        'subject': 'Physics Advanced',
        'teacher': 'Mr. John Davis',
        'time': '11:30 AM',
        'date': 'Tomorrow',
        'color': const Color(0xFFC2FFC5),
        'image':
            'https://cdn.builder.io/api/v1/image/assets/TEMP/cab2d5f61c80dc4a3b86c80c13f780847a02d5ced244d30388fa5b036001d1fd',
      },
      {
        'subject': 'Chemistry Lab',
        'teacher': 'Dr. Emily White',
        'time': '02:00 PM',
        'date': 'Dec 20',
        'color': const Color(0xFFC2FFC5),
        'image':
            'https://cdn.builder.io/api/v1/image/assets/TEMP/625d04cb92d8116c3dd5c15e54d9932c67732ff9bfb7779b39e4570ef381a31c',
      },
      {
        'subject': 'Computer Science',
        'teacher': 'Dr. Youssef Hamrouni',
        'time': '07:13 PM',
        'date': 'Dec 21',
        'color': const Color(0xFFFFC5C5),
        'image':
            'https://cdn.builder.io/api/v1/image/assets/TEMP/625d04cb92d8116c3dd5c15e54d9932c67732ff9bfb7779b39e4570ef381a31c',
      },
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: cardBackgroundColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(0, 4),
            blurRadius: 4,
          ),
        ],
        border: Border.all(color: borderColor),
      ),
      child: Column(
        children: [
          _buildUpcomingChangesHeader(
            textColor: textColor,
            secondaryTextColor: secondaryTextColor,
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 300,
            child: ListView(
              children: notifications.map((notification) {
                return NotificationCard(
                  subject: notification['subject'] as String,
                  teacher: notification['teacher'] as String,
                  time: notification['time'] as String,
                  date: notification['date'] as String,
                  color: notification['color'] as Color,
                  imageUrl: notification['image'] as String,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AttendanceHistoryScreen(
                          subject: notification['subject'] as String,
                          // teacher: notification['teacher'] as String,
                          time: notification['time'] as String,
                          date: notification['date'] as String,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpcomingChangesHeader({
    required Color textColor,
    required Color secondaryTextColor,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Upcoming Changes',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Your schedule modifications',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: secondaryTextColor,
                ),
              ),
            ],
          ),
          const CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(
              'https://cdn.builder.io/api/v1/image/assets/TEMP/0cdb20899f6a4be88eff08b507c4ca0a1f2b33ad4d9789bd21e09f057114d17e',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectNotificationSection({
    required Color textColor,
    required Color secondaryTextColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        children: [
          const Text('👆', style: TextStyle(fontSize: 24)),
          const SizedBox(height: 8),
          Text(
            'Select a Notification',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: textColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Choose a notification to view details',
            style: TextStyle(
              fontSize: 14,
              color: secondaryTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
