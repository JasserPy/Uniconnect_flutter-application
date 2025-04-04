import 'package:flutter/material.dart';
import '../../../../theme/student/colors.dart';

class NewsCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final Color textColor; // Dynamic text color
  final Color secondaryTextColor;
  final VoidCallback? onTap; // Dynamic secondary text color

  const NewsCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
    this.textColor = AppColors.textPrimary, // Default value
    this.secondaryTextColor = AppColors.textSecondary,
    this.onTap, // Default value
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.asset(
              height: 100,
              imagePath,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: textColor, // Use dynamic text color
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    color:
                        secondaryTextColor, // Use dynamic secondary text color
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
