import 'package:flutter/material.dart';
import 'package:student_dashboard/theme/Teacher/colors.dart';

class RecentUpdatesCard extends StatelessWidget {
  const RecentUpdatesCard({Key? key}) : super(key: key);

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
          const Text(
            'Latest Announcements',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: const [
                SizedBox(height: 15),
                _UpdateItem(
                  title: 'New Assignment Available',
                  timeAgo: '30 minutes ago',
                  imagePath: 'assets/images/emplois.png',
                ),
                SizedBox(height: 15),
                _UpdateItem(
                  title: 'Guest Lecture on AI',
                  timeAgo: '1 day ago',
                  imagePath: 'assets/images/orientation.png',
                ),
                SizedBox(height: 15),
                _UpdateItem(
                  title: 'Project Submission Deadline',
                  timeAgo: '3 days ago',
                  imagePath: 'assets/images/war.png',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _UpdateItem extends StatelessWidget {
  final String title;
  final String timeAgo;
  final String imagePath;

  const _UpdateItem({
    Key? key,
    required this.title,
    required this.timeAgo,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  timeAgo,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xFF6752FF),
                width: 2,
              ),
            ),
            child: Image.asset(imagePath),
          ),
        ],
      ),
    );
  }
}
