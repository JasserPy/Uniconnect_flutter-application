import 'package:flutter/material.dart';
import 'package:student_dashboard/screens/pages/StudentTeacherapp/news.dart';
import 'package:student_dashboard/screens/pages/Teachers/profile_settings_screen.dart';

import '../../../data/notifiers.dart';
import '../../../widgets/pageswidgets/layout/navbar_widget.dart';
import '../Teachers/dashboard_screen.dart';
import '../Teachers/teacher_notification_screen.dart';

List<Widget> pages = [
  const DashboardScreen(),
  const NewsScreen(),
  const TeacherNotificationScreen(),
  const ProfileteacherScreen(),

  //const AttendanceScreen(),
];

class TeacherWidgets extends StatelessWidget {
  const TeacherWidgets({super.key});

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
