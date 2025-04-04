import 'package:flutter/material.dart';

class NotificationHeader extends StatelessWidget {
  const NotificationHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Notifications',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1A1A1A),
                height: 1.5,
              ),
            ),
          
        
        Container(
          width: 50,
          height: 39,
          decoration: BoxDecoration(
            color: const Color(0xFF4318D1),
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          child: const Text(
            'All',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          width: 82,
          height: 39,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF4318D1)),
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          child: const Text(
            'Unread',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF4318D1),
            ),
          ),
        ),
        const SizedBox(width: 10),
        const Text(
          'Mark all as read',
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF4318D1),
          ),
        ),
      ],
    );
  }
}
