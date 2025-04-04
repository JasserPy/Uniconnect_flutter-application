import 'package:flutter/material.dart';
import '../../../widgets/pageswidgets/Teachers/student_elimination_card.dart';

class StudentEliminationScreen extends StatefulWidget {
  const StudentEliminationScreen({Key? key}) : super(key: key);

  @override
  _StudentEliminationScreenState createState() =>
      _StudentEliminationScreenState();
}

class _StudentEliminationScreenState extends State<StudentEliminationScreen> {
  List<Map<String, dynamic>> students = [
    {'name': 'Emma Wilson', 'role': 'Product Manager', 'eliminated': false},
    {'name': 'John Doe', 'role': 'Software Engineer', 'eliminated': false},
    {'name': 'Jane Smith', 'role': 'UX Designer', 'eliminated': false},
    {'name': 'Mark Brown', 'role': 'Data Scientist', 'eliminated': false},
    {'name': 'Emily Johnson', 'role': 'Product Manager', 'eliminated': false},
    {'name': 'Michael Davis', 'role': 'Software Engineer', 'eliminated': false},
    {'name': 'Sophia Wilson', 'role': 'UX Designer', 'eliminated': false},
  ];

  void toggleElimination(int index) {
    setState(() {
      students[index]['eliminated'] = !students[index]['eliminated'];
    });
  }

  void restoreStudent() {
    setState(() {
      for (var student in students) {
        student['eliminated'] = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          'Student Elimination',
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.black.withOpacity(0.1)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Student Elimination',
                      style: TextStyle(
                        color: Color(0xFF1A1A1A),
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Select a student to process elimination',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),

                    /// **Fixed ListView.builder inside Expanded**
                    SizedBox(
                      height: 400, // Adjust height as needed
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: students.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: students[index]['eliminated']
                                        ? Colors.red
                                        : Colors.transparent, // Red border if eliminated
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: StudentEliminationCard(
                                  name: students[index]['name'],
                                  role: students[index]['role'],
                                  eliminated: students[index]['eliminated'],
                                  onTap: () => toggleElimination(index),
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 30),

                    /// **Action Buttons**
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: restoreStudent,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF01B552),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 21,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(26),
                            ),
                          ),
                          child: const Text(
                            'Back up',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              height: 1.5,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 21,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(26),
                            ),
                          ),
                          child: const Text(
                            'Submit Elimination',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
