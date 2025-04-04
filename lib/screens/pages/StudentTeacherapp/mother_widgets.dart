import 'package:flutter/material.dart';
import 'package:student_dashboard/data/notifiers.dart';
import 'package:student_dashboard/screens/pages/Student/dashboard_student.dart';
import 'package:student_dashboard/screens/pages/Student/profile_settings_screen.dart';

import 'package:student_dashboard/screens/pages/Student/student_notification_screen.dart';
import 'package:student_dashboard/screens/pages/StudentTeacherapp/news.dart';
import 'package:student_dashboard/widgets/pageswidgets/layout/navbar_widget.dart';

List<Widget> pages = [
   const DashboardScreen(
    userName: 'jasser',
    userInitials: 'hamrouni',
  ),
  const NewsScreen(),
  const StudentNotificationScreen(),
  const ProfileSettingsScreen(),
];

class MotherWidgets extends StatelessWidget {
  const MotherWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, int selectedPage, child) {
          return pages.elementAt(selectedPage);
        },
      ),
      bottomNavigationBar: const NavbarWidget(),
    );
  }
}
