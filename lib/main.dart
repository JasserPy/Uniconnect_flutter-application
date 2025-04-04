import 'package:flutter/material.dart';
import 'package:student_dashboard/data/notifiers.dart';
import 'package:student_dashboard/screens/pages/StudentTeacherapp/mother_widgets.dart';
import 'package:student_dashboard/screens/pages/StudentTeacherapp/signup_screen.dart';
import 'package:student_dashboard/screens/pages/StudentTeacherapp/teacher_widgets.dart';

import 'screens/pages/Teachers/notif_teache_add.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageisdark,
      builder: (context, bool isDarkMode, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 255, 255, 255),
              brightness: isDarkMode ? Brightness.dark : Brightness.light,
            ),
          ),
          home: const SignupScreen(),
          routes: {
            '/notif-teachers-add': (context) => const NotifTeachersAdd(),
            '/student': (context) => const MotherWidgets(),
            '/teacher': (context) => const TeacherWidgets(),
          },
        );
      },
    );
  }
}
