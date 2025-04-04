import 'package:flutter/material.dart';
import 'package:student_dashboard/theme/Teacher/attendesStyles.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(studentName, style: AttendanceStyles.studentName),
          Row(
            children: [
              _buildAttendanceButton('PR', AttendanceStyles.primaryColor),
              const SizedBox(width: 12),
              _buildAttendanceButton('LA', AttendanceStyles.lateColor),
              const SizedBox(width: 12),
              _buildAttendanceButton('AB', AttendanceStyles.absentColor),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAttendanceButton(String status, Color color) {
    final bool isSelected = selectedStatus == status;
    return GestureDetector(
      onTap: () => onStatusChange(status),
      child: Container(
        width: 48,
        height: 32,
        decoration: BoxDecoration(
          color: isSelected ? color : color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: isSelected ? color : Colors.transparent,
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            status,
            style: TextStyle(
              color: isSelected ? Colors.white : color,
              fontWeight: FontWeight.bold,
              fontSize: 12,
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
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _buildLegendItem('Present', AttendanceStyles.primaryColor),
              const SizedBox(width: 16),
              _buildLegendItem('Late', AttendanceStyles.lateColor),
              const SizedBox(width: 16),
              _buildLegendItem('Absent', AttendanceStyles.absentColor),
            ],
          ),
          ElevatedButton(
            onPressed: onConfirm,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            ),
            child: const Text(
              'Confirm',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
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
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
