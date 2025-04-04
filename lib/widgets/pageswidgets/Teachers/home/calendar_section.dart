import 'package:flutter/material.dart';
import 'package:student_dashboard/theme/Teacher/colors.dart';



class CalendarSection extends StatelessWidget {
  const CalendarSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Calendar',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.calendarBackground,
              borderRadius: BorderRadius.circular(54),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _DayItem('Mo', false),
                _DayItem('Tu', true),
                _DayItem('We', false),
                _DayItem('Th', false),
                _DayItem('Fr', false),
                _DayItem('Sa', false),
                _DayItem('Su', false),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DayItem extends StatelessWidget {
  final String day;
  final bool isSelected;

  const _DayItem(this.day, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Text(
      day,
      style: TextStyle(
        color: isSelected ? Colors.white : AppColors.textSecondary,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
