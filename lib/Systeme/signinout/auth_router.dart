import 'package:flutter/material.dart';
import 'package:student_dashboard/screens/pages/StudentTeacherapp/mother_widgets.dart';
import 'package:student_dashboard/screens/pages/StudentTeacherapp/teacher_widgets.dart';

class AuthRouter {
  static Widget routeBasedOnEmail(String email) {
    if (email.endsWith('@student.com')) {
      return const MotherWidgets();
    } else {
      return const TeacherWidgets();
    }
  }
}