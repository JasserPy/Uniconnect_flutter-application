import 'package:flutter/material.dart';
import 'package:student_dashboard/widgets/pageswidgets/Teachers/student_list_item.dart';
import '../../../theme/Teacher/styles.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  final List<Map<String, dynamic>> students = [
    {'name': 'Alex Thompson', 'status': AttendanceStatus.present},
    {'name': 'Jamie Wilson', 'status': AttendanceStatus.present},
    {'name': 'Taylor Smith', 'status': AttendanceStatus.absent},
    {'name': 'Jordan Lee', 'status': AttendanceStatus.present},
    {'name': 'Casey Brown', 'status': AttendanceStatus.late},
    {'name': 'Riley Johnson', 'status': AttendanceStatus.present},
  ];

  void _showConfirmationDialog() {
    final absentStudents = students.where((s) => s['status'] == AttendanceStatus.absent).length;
    final lateStudents = students.where((s) => s['status'] == AttendanceStatus.late).length;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Attendance'),
        content: Text(
          'Attendance Summary:\n'
          'Present: ${students.length - absentStudents - lateStudents}\n'
          'Late: $lateStudents\n'
          'Absent: $absentStudents\n\n'
          'Confirm these attendance records?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: TeacherStyles.primaryColor,
            ),
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Return to previous screen
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Attendance confirmed successfully'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: const Text('Confirm', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _updateStudentStatus(int index, AttendanceStatus newStatus) {
    setState(() {
      students[index]['status'] = newStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TeacherStyles.backgroundLight,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: TeacherStyles.defaultPadding,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black.withOpacity(0.1)),
                  borderRadius: BorderRadius.circular(TeacherStyles.borderRadius),
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(TeacherStyles.defaultPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Take Attendance',
                            style: TeacherStyles.headerTitle,
                          ),
                          Text(
                            '2024-01-20',
                            style: TeacherStyles.smallText,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: TeacherStyles.smallPadding,
                        vertical: 11,
                      ),
                      margin: const EdgeInsets.symmetric(
                        horizontal: TeacherStyles.smallPadding,
                      ),
                      decoration: BoxDecoration(
                        color: TeacherStyles.backgroundLight,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Student',
                            style: TeacherStyles.captionText,
                          ),
                          Text(
                            'Status',
                            style: TeacherStyles.captionText,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.all(2),
                        itemCount: students.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 2),
                        itemBuilder: (context, index) {
                          return StudentListItem(
                            studentName: students[index]['name'],
                            status: students[index]['status'],
                            onStatusChanged: (newStatus) {
                              _updateStudentStatus(index, newStatus);
                            },
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(TeacherStyles.defaultPadding),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildStatusIndicator(
                                color: TeacherStyles.presentColor,
                                label: 'Present',
                              ),
                              const SizedBox(width: 32),
                              _buildStatusIndicator(
                                color: TeacherStyles.lateColor,
                                label: 'Late',
                              ),
                              const SizedBox(width: 32),
                              _buildStatusIndicator(
                                color: TeacherStyles.absentColor,
                                label: 'Absent',
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: TeacherStyles.primaryButton,
                              onPressed: _showConfirmationDialog,
                              child: const Text(
                                'Confirm Attendance',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 12),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.black.withOpacity(0.1)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusIndicator({
    required Color color,
    required String label,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: TeacherStyles.statusIndicatorSize,
          height: TeacherStyles.statusIndicatorSize,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: TeacherStyles.captionText,
        ),
      ],
    );
  }
}