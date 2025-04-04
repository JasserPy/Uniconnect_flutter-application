import 'package:flutter/material.dart';
import 'package:student_dashboard/theme/Teacher/attendesStyles.dart';

class AbsenseGere extends StatefulWidget {
  const AbsenseGere({Key? key}) : super(key: key);

  @override
  State<AbsenseGere> createState() => _AbsenseGereState();
}

class _AbsenseGereState extends State<AbsenseGere> {
  final Map<String, String> studentAttendance = {};
  final List<String> students = [
    'Alex Thompson',
    'Jamie Wilson',
    'Taylor Smith',
    'Jordan Lee',
    'Casey Brown',
    'Riley Johnson',
    'Morgan Taylor',
    'Cameron Davis',
    'Avery Miller',
    'Skyler Wilson'
  ];

  void _showConfirmationDialog() {
    final absentCount =
        studentAttendance.values.where((status) => status == 'AB').length;
    final lateCount =
        studentAttendance.values.where((status) => status == 'LA').length;
    final presentCount = students.length - absentCount - lateCount;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Attendance'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Attendance Summary:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _buildStatusRow('Present', presentCount, Colors.green),
            _buildStatusRow('Late', lateCount, Colors.orange),
            _buildStatusRow('Absent', absentCount, Colors.red),
            const SizedBox(height: 20),
            const Text('Confirm these attendance records?'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Attendance saved successfully')),
              );
            },
            child: const Text('Confirm', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusRow(String status, int count, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 8),
          Text('$status: $count', style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Attendance',
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
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: AttendanceStyles.cardDecoration,
                child: Column(
                  children: [
                    // Attendance header
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Student',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('Status',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Student list with attendance selection
                    Expanded(
                      child: ListView.builder(
                        itemCount: students.length,
                        itemBuilder: (context, index) {
                          final student = students[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            elevation: 1,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: StudentAttendance(
                                studentName: student,
                                selectedStatus:
                                    studentAttendance[student] ?? 'PR',
                                onStatusChange: (newStatus) {
                                  setState(() {
                                    studentAttendance[student] = newStatus;
                                  });
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    // Legend and confirm button
                    AttendanceLegend(
                      onConfirm: _showConfirmationDialog,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StudentAttendance extends StatelessWidget {
  final String studentName;
  final ValueChanged<String> onStatusChange;
  final String selectedStatus;

  const StudentAttendance({
    Key? key,
    required this.studentName,
    required this.onStatusChange,
    required this.selectedStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              studentName,
              style: const TextStyle(fontSize: 14),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            children: [
              _buildStatusButton(
                  'PR', 'Present', AttendanceStyles.primaryColor),
              const SizedBox(width: 8),
              _buildStatusButton('LA', 'Late', AttendanceStyles.lateColor),
              const SizedBox(width: 8),
              _buildStatusButton('AB', 'Absent', AttendanceStyles.absentColor),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusButton(String code, String label, Color color) {
    final isSelected = selectedStatus == code;
    return Tooltip(
      message: label,
      child: InkWell(
        onTap: () => onStatusChange(code),
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: isSelected ? color : color.withOpacity(0.1),
            shape: BoxShape.circle,
            border: Border.all(
              color: isSelected ? color : Colors.transparent,
              width: 2,
            ),
          ),
          child: Center(
            child: Text(
              code,
              style: TextStyle(
                color: isSelected ? Colors.white : color,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AttendanceLegend extends StatelessWidget {
  final VoidCallback onConfirm;

  const AttendanceLegend({
    Key? key,
    required this.onConfirm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLegendItem('Present', AttendanceStyles.primaryColor),
              const SizedBox(width: 20),
              _buildLegendItem('Late', AttendanceStyles.lateColor),
              const SizedBox(width: 20),
              _buildLegendItem('Absent', AttendanceStyles.absentColor),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onConfirm,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[700],
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'CONFIRM ATTENDANCE',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
