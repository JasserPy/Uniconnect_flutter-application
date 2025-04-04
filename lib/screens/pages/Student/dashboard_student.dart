import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_dashboard/data/notifiers.dart'; // Import your notifiers
import 'package:student_dashboard/screens/pages/Student/MyClassesScreen.dart';
import 'package:student_dashboard/screens/pages/Student/TeacherSelectionScreen.dart';
import 'package:student_dashboard/screens/pages/Student/student_settings_screen.dart';
import 'package:student_dashboard/widgets/pageswidgets/Student/home/class_schedule_card.dart';
import 'package:student_dashboard/widgets/pageswidgets/layout/profile_header.dart';
import '../../../theme/student/colors.dart'; // Import your AppColors
import '../../../widgets/pageswidgets/Student/home/status_card.dart';
import '../../../widgets/pageswidgets/Student/home/quick_action_card.dart';

class DashboardScreen extends StatelessWidget {
  final String userName; // User's name
  final String userInitials; // User's initials
  const DashboardScreen(
      {Key? key, required this.userName, required this.userInitials})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageisdark,
      builder: (context, bool isDarkMode, child) {
        // Define colors based on dark mode
        final backgroundColor =
            isDarkMode ? Colors.grey[900]! : AppColors.background;
        final textColor = isDarkMode ? Colors.white : AppColors.textPrimary;
        final secondaryTextColor =
            isDarkMode ? Colors.grey[400]! : AppColors.textSecondary;
        final cardBackgroundColor =
            isDarkMode ? Colors.grey[800]! : AppColors.newsBg;
        final borderColor =
            isDarkMode ? const Color(0xFF616161) : AppColors.border;

        return Scaffold(
          backgroundColor: backgroundColor,
          body: SafeArea(
            child: Column(
              children: [
                ProfileHeader(
                  backgroundColor:
                      isDarkMode ? Colors.grey[850]! : AppColors.background,
                  textPrimaryColor: textColor,
                  textSecondaryColor: secondaryTextColor,
                  iconColor: isDarkMode ? Colors.orange : Colors.blueAccent,
                  isTeacher: false,
                  userName: userName, // Use dynamic user name
                  userInitial: userInitials, // Use dynamic user initials
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Profile Header
                        // Welcome banner
                        Container(
                          padding: const EdgeInsets.all(24),
                          color: AppColors.primary, // Use AppColors.primary
                          width: double.infinity,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome back!',
                                style: GoogleFonts.inter(
                                  color:
                                      Colors.white, // White text for contrast
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Here\'s your daily overview',
                                style: GoogleFonts.inter(
                                  color: Colors.white.withOpacity(
                                      0.8), // White text with opacity
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Calendar section
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 9),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: cardBackgroundColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Calendar',
                                style: GoogleFonts.inter(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: textColor,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  'Mo',
                                  'Tu',
                                  'We',
                                  'Th',
                                  'Fr',
                                  'Sa',
                                  'Su'
                                ]
                                    .map((day) => GestureDetector(
                                          onTap: () {
                                            selectedDayNotifier.value = day;
                                          },
                                          child: ValueListenableBuilder<String>(
                                            valueListenable:
                                                selectedDayNotifier,
                                            builder:
                                                (context, selectedDay, child) {
                                              return Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8,
                                                        vertical: 4),
                                                decoration: BoxDecoration(
                                                  color: selectedDay == day
                                                      ? Colors
                                                          .blue // Highlight the selected day
                                                      : Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Text(
                                                  day,
                                                  style: GoogleFonts.inter(
                                                    color: selectedDay == day
                                                        ? Colors.white
                                                        : textColor,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const StudentScheduleCard(),
                        ),

                        // Recent News section
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 9),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: cardBackgroundColor,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: borderColor),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                offset: const Offset(0, 4),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Recent News',
                                style: GoogleFonts.inter(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: textColor,
                                ),
                              ),
                              Column(
                                children: [
                                  const SizedBox(height: 20),
                                  SizedBox(
                                    height: 150,
                                    child: ListView(
                                      scrollDirection: Axis.vertical,
                                      children: const [
                                        SizedBox(height: 10),
                                        StatusCard(
                                          initials: 'JS',
                                          name: 'John Smith',
                                          subject: 'Mathematics',
                                          status: 'Absence',
                                          statusColor: AppColors.absenceRed,
                                          statusBgColor: AppColors.absenceBg,
                                        ),
                                        SizedBox(height: 10),
                                        StatusCard(
                                          initials: 'JS',
                                          name: 'John Smith',
                                          subject: 'Mathematics',
                                          status: 'Absence',
                                          statusColor: AppColors.absenceRed,
                                          statusBgColor: AppColors.absenceBg,
                                        ),
                                        SizedBox(height: 10),
                                        StatusCard(
                                          initials: 'SW',
                                          name: 'Sarah Wilson',
                                          subject: 'Physics',
                                          status: 'Delay',
                                          statusColor: AppColors.delayOrange,
                                          statusBgColor: AppColors.delayBg,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Quick Actions section
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 9),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: cardBackgroundColor,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                offset: const Offset(4, 4),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Quick Actions',
                                style: GoogleFonts.inter(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: textColor,
                                ),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 120,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    const SizedBox(width: 15),
                                    QuickActionCard(
                                      emoji: '📊',
                                      title: 'Absence',
                                      isDarkMode: isDarkMode,
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const MyClassesScreen(),
                                          ),
                                        );
                                      },
                                    ),
                                    const SizedBox(width: 15),
                                    QuickActionCard(
                                      emoji: '📚',
                                      title: 'Assignments',
                                      isDarkMode: isDarkMode,
                                      onTap: () {
                                        // Navigate to assignments page
                                      },
                                    ),
                                    const SizedBox(width: 15),
                                    QuickActionCard(
                                      emoji: '📝',
                                      title: 'Messages',
                                      isDarkMode: isDarkMode,
                                      onTap: () {
                                        // Navigate to a new screen to select a teacher
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const TeacherSelectionScreen(),
                                          ),
                                        );
                                      },
                                    ),
                                    const SizedBox(width: 15),
                                    QuickActionCard(
                                      emoji: '⚙️',
                                      title: 'Settings',
                                      isDarkMode: isDarkMode,
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const StudentSettingsScreen(),
                                          ),
                                        );
                                        // Open schedule
                                      },
                                    ),
                                    const SizedBox(width: 15),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
}
