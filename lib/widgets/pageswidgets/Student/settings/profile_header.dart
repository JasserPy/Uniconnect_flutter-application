import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final Color backgroundColor;
  final Color textPrimaryColor;
  final Color textSecondaryColor;

  const ProfileHeader({
    Key? key,
    required this.backgroundColor,
    required this.textPrimaryColor,
    required this.textSecondaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final borderColor = isDarkMode ? Colors.grey[800]! : Colors.grey[300]!;
    final iconColor = isDarkMode ? Colors.grey[800]! : Colors.blue;

    return Container(
      padding: const EdgeInsets.fromLTRB(21, 12, 14.67, 14),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Profile Settings',
            style: TextStyle(
              color: textPrimaryColor,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: iconColor,
              minimumSize: const Size(103, 45),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Edit Profile',
              style: TextStyle(
                color: textPrimaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}