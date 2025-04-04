import 'package:flutter/material.dart';
import 'package:student_dashboard/data/notifiers.dart';
import 'package:student_dashboard/screens/pages/Student/AttendanceHistoryScreen.dart';
import '../../../theme/student/theme_class/styles.dart';
import '../../../widgets/pageswidgets/Student/home/classes/class_card.dart';
import '../../../widgets/pageswidgets/Student/home/classes/summary_card.dart';

class MyClassesScreen extends StatelessWidget {
  const MyClassesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageisdark,
      builder: (context, bool isDarkMode, child) {
        return Scaffold(
          backgroundColor:
              isDarkMode ? Colors.grey[900]! : AppColors.background,
          appBar: AppBar(
              backgroundColor: isDarkMode ? Colors.grey[850]! : Colors.white,
              title: Text(
                'My Classes',
                style: AppTextStyles.title.copyWith(
                  color: isDarkMode ? Colors.white : AppColors.textPrimary,
                ),
              )),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(9, 49, 9, 86),
                    child: Column(
                      children: [
                        const SizedBox(height: 18),
                        Column(
                          children: [
                            ClassCard(
                              className: 'Advanced Biology',
                              roomNumber: 'Room 204',
                              time: '9:00 PM',
                              absences: 2,
                              late: 2,
                              attendance: '90%',
                              isDarkMode: isDarkMode,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const AttendanceHistoryScreen(
                                      subject: 'Advanced Biology',
                                      teacher: 'Dr. Smith',
                                      time: '9:00 PM',
                                      date: 'Mon/Wed/Fri',
                                    ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 31),
                            ClassCard(
                              className: 'World History',
                              roomNumber: 'Room 156',
                              time: '10:30 PM',
                              absences: 2,
                              late: 2,
                              attendance: '90%',
                              isDarkMode: isDarkMode,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const AttendanceHistoryScreen(
                                      subject: 'World History',
                                      teacher: 'Prof. Johnson',
                                      time: '10:30 PM',
                                      date: 'Tue/Thu',
                                    ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 31),
                            ClassCard(
                              className: 'Calculus',
                              roomNumber: 'Room 302',
                              time: '1:00 PM',
                              absences: 2,
                              late: 2,
                              attendance: '90%',
                              isDarkMode: isDarkMode,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const AttendanceHistoryScreen(
                                      subject: 'Calculus',
                                      teacher: 'Dr. Lee',
                                      time: '1:00 PM',
                                      date: 'Mon/Wed/Fri',
                                    ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 31),
                            SummaryCard(
                              totalAbsences: 3,
                              totalLate: 2,
                              attendanceRate: '90%',
                              isDarkMode: isDarkMode,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 1,
                    color: isDarkMode
                        ? Colors.grey[700]!
                        : Colors.black.withOpacity(0.1),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
