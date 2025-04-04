import 'package:flutter/material.dart';
import 'package:student_dashboard/screens/pages/Teachers/StudentListScreen.dart';
import '../../../../screens/pages/Teachers/absensegere.dart';
import '../../../../screens/pages/Teachers/student_elimination_screen.dart';
import '../../../../screens/pages/Teachers/teacher_settings_screen.dart';
import '../../../../utils/app_colors.dart';

class QuickActionsGrid extends StatelessWidget {
  const QuickActionsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(33),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Quick Actions',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 30),
          ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: 200,
              maxHeight: 400,
            ),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              padding: const EdgeInsets.all(0),
              children: const [
                _ActionItem(
                  emoji: '📝',
                  label: 'Eliminate Student',
                  id: 1,
                ),
                _ActionItem(
                  emoji: '📊',
                  label: 'Manage Absences',
                  id: 2,
                ),
                _ActionItem(
                  emoji: '📋',
                  label: 'Student List',
                  id: 3,
                ),
                _ActionItem(
                  emoji: '⚙️',
                  label: 'Settings',
                  id: 4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionItem extends StatelessWidget {
  final String emoji;
  final String label;
  final int id;

  const _ActionItem({
    required this.emoji,
    required this.label,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Material(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => _navigateBasedOnId(context),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  emoji,
                  style: const TextStyle(fontSize: 28),
                ),
                const SizedBox(height: 8),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateBasedOnId(BuildContext context) {
    switch (id) {
      case 1:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => const StudentEliminationScreen()));
        break;
      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const AbsenseGere()));
        break;
      case 3:
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => const StudentListScreen()));
        break;
      default:
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => const TeacherSettingsScreen()));
    }
  }
}
