import 'package:flutter/material.dart';
import 'package:student_dashboard/data/notifiers.dart';
import 'package:student_dashboard/screens/pages/Student/student_settings_screen.dart';
import 'package:student_dashboard/screens/pages/StudentTeacherapp/signup_screen.dart';
import 'package:student_dashboard/screens/pages/Teachers/teacher_settings_screen.dart';

class ProfileHeader extends StatefulWidget {
  final Color backgroundColor;
  final Color borderColor;
  final Color textPrimaryColor;
  final Color textSecondaryColor;
  final Color iconColor;
  final String userName;
  final String userInitial;
  final bool isTeacher;

  const ProfileHeader({
    Key? key,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.white,
    this.textPrimaryColor = Colors.black,
    this.textSecondaryColor = Colors.grey,
    this.iconColor = Colors.blueAccent,
    this.userName = 'Student Name',
    this.userInitial = 'S',
    this.isTeacher = false,
  }) : super(key: key);

  @override
  _ProfileHeaderState createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        border: Border.all(color: widget.borderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Profile Info
          Row(
            children: [
              _buildProfileAvatar(),
              const SizedBox(width: 12),
              _buildUserDetails(),
            ],
          ),
          // Actions (Notifications & Settings)
          Row(
            children: [
              _buildNotificationIcon(),
              _buildSettingsMenu(),
            ],
          ),
        ],
      ),
    );
  }

  // Profile Avatar
  Widget _buildProfileAvatar() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: widget.iconColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          widget.userInitial,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  // User Details (Name & Role)
  Widget _buildUserDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.isTeacher ? 'Teacher' : 'Student',
          style: TextStyle(
            color: widget.textSecondaryColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          widget.userName,
          style: TextStyle(
            color: widget.textPrimaryColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  // Notification Icon
  Widget _buildNotificationIcon() {
    return GestureDetector(
      onTap: () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _showNotifications(context);
        });
      },
      child: Icon(
        Icons.notifications_outlined,
        color: widget.iconColor,
      ),
    );
  }

  // Settings Menu
  Widget _buildSettingsMenu() {
    return PopupMenuButton<String>(
      icon: Icon(Icons.more_vert, color: widget.iconColor),
      itemBuilder: (context) => [
        _buildPopupMenuItem('settings', Icons.settings, 'Settings'),
        _buildPopupMenuItem('theme', Icons.dark_mode, 'Dark Mode'),
        _buildPopupMenuItem('logout', Icons.logout, 'Logout'),
      ],
      onSelected: _handleMenuSelection,
    );
  }

  // Popup Menu Item
  PopupMenuItem<String> _buildPopupMenuItem(
      String value, IconData icon, String text) {
    return PopupMenuItem(
      value: value,
      child: ListTile(
        leading: Icon(icon, color: widget.textPrimaryColor),
        title: Text(text, style: TextStyle(color: widget.textPrimaryColor)),
      ),
    );
  }

  // Handle Menu Selection
  void _handleMenuSelection(String value) {
    switch (value) {
      case 'settings':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => widget.isTeacher
                ? const TeacherSettingsScreen()
                : const StudentSettingsScreen(),
          ),
        );
        break;

      case 'theme':
        selectedPageisdark.value =
            !selectedPageisdark.value; // Toggle dark mode
        break;

      case 'logout':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const SignupScreen()),
        );
        break;
    }
  }

  // Show Notifications Dialog
  void _showNotifications(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            widget.isTeacher
                ? 'Teacher Notifications'
                : 'Student Notifications',
            style: TextStyle(color: widget.iconColor),
          ),
          content: SizedBox(
            height: 300, // Set the height for ListView inside a Container
            child: ListView(
              children: [
                _notificationTile(
                  widget.isTeacher
                      ? 'New student message received'
                      : 'New assignment available',
                ),
                _notificationTile(
                  widget.isTeacher
                      ? 'Class schedule updated'
                      : 'Your grade has been updated',
                ),
                _notificationTile(
                  widget.isTeacher
                      ? 'Student performance report available'
                      : 'New event in your school',
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Close', style: TextStyle(color: widget.iconColor)),
            ),
          ],
        );
      },
    );
  }

  // Notification Tile
  Widget _notificationTile(String message) {
    return ListTile(
      title: Text(
        message,
        style: TextStyle(color: widget.textPrimaryColor),
      ),
    );
  }
}
