import 'package:flutter/material.dart';
import 'package:student_dashboard/theme/student/colors.dart';
import 'package:student_dashboard/widgets/pageswidgets/Student/settings/profile_info.dart';
import 'package:student_dashboard/widgets/pageswidgets/Student/settings/administrative_controls.dart'
    as admin;
import 'package:student_dashboard/widgets/pageswidgets/Student/settings/notification_preferences.dart'
    as notification;
import '../../../widgets/pageswidgets/layout/profile_header.dart';
import '../../../widgets/pageswidgets/layout/profiletheme.dart';

class ProfileSettingsScreen extends StatefulWidget {
  const ProfileSettingsScreen({Key? key}) : super(key: key);

  @override
  _ProfileSettingsScreenState createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  bool _isEditing = false;


  @override
  Widget build(BuildContext context) {
    final theme = _getTheme(context);

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            ProfileHeader(
              backgroundColor: theme.backgroundColor,
              textPrimaryColor: theme.textColor,
              textSecondaryColor: theme.secondaryTextColor,
              isTeacher: false,
            ),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.all(16.0),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        const SizedBox(height: 24),
                        _buildProfileInfo(theme),
                        const SizedBox(height: 24),
                        _buildNotificationPreferences(theme),
                        const SizedBox(height: 24),
                        _buildAdministrativeControls(theme),
                        const SizedBox(height: 32),
                        _buildSaveEditButton(theme),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSaveEditButton(ProfileTheme theme) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.highlightColor,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          if (_isEditing) {
            _saveChanges();
          } else {
            setState(() {
              _isEditing = true;
            });
          }
        },
        child: Text(
          _isEditing ? 'Save Changes' : 'Edit Profile',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void _saveChanges() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Changes saved successfully'),
        backgroundColor: Colors.green,
      ),
    );

    setState(() {
      _isEditing = false;
    
    });
  }

  ProfileTheme _getTheme(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return ProfileTheme(
      backgroundColor: isDarkMode ? Colors.grey[900]! : AppColors.background,
      textColor: isDarkMode ? Colors.white : AppColors.textPrimary,
      secondaryTextColor:
          isDarkMode ? Colors.grey[400]! : AppColors.textSecondary,
      cardBackgroundColor: isDarkMode ? Colors.grey[800]! : Colors.white,
      borderColor: isDarkMode ? Colors.grey[700]! : Colors.black,
      highlightColor: const Color(0xFF4318D1),
    );
  }

  Widget _buildProfileInfo(ProfileTheme theme) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: theme.borderColor),
      ),
      color: theme.cardBackgroundColor,
      child: ProfileInfo(
        textColor: theme.textColor,
        secondaryTextColor: theme.secondaryTextColor,
        isEditing: _isEditing,
        onChanged: (value) {
          setState(() {
            
          });
        },
      ),
    );
  }

  Widget _buildNotificationPreferences(ProfileTheme theme) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: theme.borderColor),
      ),
      color: theme.cardBackgroundColor,
      child: notification.NotificationPreferences(
        textColor: theme.textColor,
        secondaryTextColor: theme.secondaryTextColor,
        isEditing: _isEditing,
        onChanged: (value) {
          setState(() {
           
          });
        },
      ),
    );
  }

  Widget _buildAdministrativeControls(ProfileTheme theme) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: theme.borderColor),
      ),
      color: theme.cardBackgroundColor,
      child: admin.AdministrativeControls(
        textColor: theme.textColor,
        cardBackgroundColor: theme.cardBackgroundColor,
        isEditing: _isEditing,
        onChanged: (value) {
          setState(() {
            
          });
        },
      ),
    );
  }
}
