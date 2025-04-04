import 'package:flutter/material.dart';
import 'package:student_dashboard/screens/pages/Student/StudentChatScreen.dart';

class TeacherSelectionScreen extends StatelessWidget {
  const TeacherSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select a Teacher')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Mr. John Smith'),
            onTap: () {
              Navigator.pop(context); // Close the screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StudentChatScreen(
                    student: '',
                    teacherName: 'Mr. John Smith', // Pass selected teacher
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Ms. Sarah Wilson'),
            onTap: () {
              Navigator.pop(context); // Close the screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StudentChatScreen(
                    student: '',
                    teacherName: 'Ms. Sarah Wilson', // Pass selected teacher
                  ),
                ),
              );
            },
          ),
          // Add more teachers as needed
        ],
      ),
    );
  }
}
