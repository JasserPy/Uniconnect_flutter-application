import 'package:flutter/material.dart';
import 'package:student_dashboard/theme/Teacher/styles.dart';

enum AttendanceStatus {
  present,
  absent,
  late,
}

class StudentListItem extends StatelessWidget {
  final String studentName;
  final AttendanceStatus status;

  const StudentListItem({
    Key? key,
    required this.studentName,
    required this.status, required Null Function(dynamic newStatus) onStatusChanged,
  }) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: TeacherStyles.defaultPadding,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.circular(TeacherStyles.itemBorderRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 37,
                decoration: const BoxDecoration(
                  color: TeacherStyles.avatarBg,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                studentName,
                style: TeacherStyles.bodyText,
              ),
            ],
          ),
          Container(
            width: 36,
            height: 33,
            decoration: BoxDecoration(
              color: _getStatusColor(),
              border: _getBorder(),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Center(
              child: Text(
                _getStatusText(),
                style: TextStyle(
                  color: status == AttendanceStatus.absent
                      ? TeacherStyles.absentColor
                      : Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getBackgroundColor() {
    switch (status) {
      case AttendanceStatus.present:
        return TeacherStyles.presentBgColor;
      case AttendanceStatus.absent:
        return TeacherStyles.absentBgColor;
      case AttendanceStatus.late:
        return TeacherStyles.presentBgColor;
    }
  }

  Color _getStatusColor() {
    switch (status) {
      case AttendanceStatus.present:
        return TeacherStyles.presentColor;
      case AttendanceStatus.absent:
        return Colors.transparent;
      case AttendanceStatus.late:
        return TeacherStyles.lateColor;
    }
  }

  Border? _getBorder() {
    return status == AttendanceStatus.absent
        ? Border.all(color: TeacherStyles.absentColor)
        : null;
  }

  String _getStatusText() {
    switch (status) {
      case AttendanceStatus.present:
        return 'PR';
      case AttendanceStatus.absent:
        return 'AB';
      case AttendanceStatus.late:
        return 'LT';
    }
  }
}