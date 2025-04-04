import 'package:flutter/material.dart';
import 'package:student_dashboard/widgets/pageswidgets/Teachers/empty_student_state.dart';

class EmptyStudentsScreen extends StatelessWidget {
  const EmptyStudentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Students',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: const SafeArea(
        child: EmptyStudentState(),
      ),
    );
  }
}