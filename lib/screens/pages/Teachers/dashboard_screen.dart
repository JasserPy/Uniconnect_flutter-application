import 'package:flutter/material.dart';
import '../../../theme/Teacher/colors.dart';
import '../../../widgets/pageswidgets/Teachers/home/calendar_section.dart';
import '../../../widgets/pageswidgets/Teachers/home/class_schedule_card.dart';
import '../../../widgets/pageswidgets/Teachers/home/quick_action.dart';
import '../../../widgets/pageswidgets/Teachers/home/recent_update.dart';
import '../../../widgets/pageswidgets/layout/profile_header.dart';
import 'notif_teache_add.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ProfileHeader(
                isTeacher: true,
                userName: 'Teacher Name',
                userInitial: 'T',
              ),
              _buildHeader(context), // Pass context here
              const Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    CalendarSection(),
                    SizedBox(height: 20),
                    RecentUpdatesCard(),
                    SizedBox(height: 20),
                    TeacherScheduleCard(),
                    SizedBox(height: 20),
                    QuickActionsGrid(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      color: AppColors.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome back!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  height: 1.5,
                ),
              ),
              Text(
                "Here's your daily overview",
                style: TextStyle(
                  color: Color(0xCCFFFFFF),
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.add_alert_sharp,
                  color: Colors.white,
                  size: 23,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotifTeachersAdd(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 6),
              const Text(
                'Add notification',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  height: 1.82,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
