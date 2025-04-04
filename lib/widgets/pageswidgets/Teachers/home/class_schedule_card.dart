import 'package:flutter/material.dart';

import '../../../../theme/Teacher/colors.dart';




class TeacherScheduleCard extends StatelessWidget {
  const TeacherScheduleCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black),
        boxShadow: const [
          BoxShadow(
            color: Color(0x40000000),
            offset: Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Today's Teaching Schedule",
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'View All',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          const Text(
            'You have 3 classes today',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: 240,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: const [
                SizedBox(height: 15),
                _TeacherClassItem(
                  subject: "Business Computing",
                  topic: "Introduction to Data Analytics",
                  time: "08:00 AM - 09:30 AM",
                  room: "Room 101",
                ),
                SizedBox(height: 15),
                _TeacherClassItem(
                  subject: "Computer Science",
                  topic: "Advanced Java Programming",
                  time: "10:00 AM - 11:30 AM",
                  room: "Room 205",
                ),
                SizedBox(height: 15),
                _TeacherClassItem(
                  subject: "Internet of Things (IoT)",
                  topic: "Embedded Systems & Sensors",
                  time: "02:00 PM - 03:30 PM",
                  room: "Lab 3",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TeacherClassItem extends StatelessWidget {
  final String subject;
  final String topic;
  final String time;
  final String room;

  const _TeacherClassItem({
    Key? key,
    required this.subject,
    required this.topic,
    required this.time,
    required this.room,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E5E5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.access_time, size: 16),
              const SizedBox(width: 6),
              Text(
                time,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            subject,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            topic,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.location_on, size: 16, color: Colors.grey),
              const SizedBox(width: 6),
              Text(
                room,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Details',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 14,
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: Colors.black,
                size: 16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
