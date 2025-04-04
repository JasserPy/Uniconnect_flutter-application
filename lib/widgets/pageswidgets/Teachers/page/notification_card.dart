import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(23),
      decoration: BoxDecoration(
        color: const Color(0xFF4318D1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add Attendes Notification',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter',
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Submit your Attendes notice to notify students and administration',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              height: 1.5,
              fontFamily: 'Inter',
            ),
          ),
        ],
      ),
    );
  }
}
