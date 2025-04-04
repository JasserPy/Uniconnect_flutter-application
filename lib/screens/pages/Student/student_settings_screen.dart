import 'package:flutter/material.dart';
import 'package:student_dashboard/widgets/pageswidgets/Student/settings/settings_section.dart';
import 'package:student_dashboard/widgets/pageswidgets/Student/settings/settings_item.dart';
import 'package:student_dashboard/data/notifiers.dart';

class StudentSettingsScreen extends StatefulWidget {
  const StudentSettingsScreen({Key? key}) : super(key: key);

  @override
  State<StudentSettingsScreen> createState() => _StudentSettingsScreenState();
}

class _StudentSettingsScreenState extends State<StudentSettingsScreen> {
  // State variables for toggles
  bool notificationsEnabled = false;
  bool darkModeEnabled = false;
  bool emailUpdatesEnabled = false;
  bool soundEffectsEnabled = false;
  bool autoSaveEnabled = false;
  bool classNotificationsEnabled = false;
  bool autoGradingEnabled = false;
  bool parentEmailsEnabled = false;
  bool lessonPlannerEnabled = false;
  bool homeworkRemindersEnabled = false;
  bool attendanceTrackingEnabled = false;

  // State variables for dropdowns
  String selectedLanguage = 'English';
  String selectedPrivacy = 'Public';
  double fontSize = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SettingsSection(
              title: 'General Settings',
              children: [
                SettingsItem(
                  title: 'Notifications',
                  subtitle: 'Enable push notifications',
                  trailing: Switch(
                    value: notificationsEnabled,
                    onChanged: (value) {
                      setState(() => notificationsEnabled = value);
                    },
                  ),
                ),
                SettingsItem(
                  title: 'Dark Mode',
                  subtitle: 'Switch to dark theme',
                  trailing: Switch(
                    value: selectedPageisdark.value,
                    onChanged: (value) {
                      setState(() {
                        selectedPageisdark.value = value;
                      });
                    },
                  ),
                ),
                SettingsItem(
                  title: 'Language',
                  subtitle: 'Select your preferred language',
                  trailing: DropdownButton<String>(
                    value: selectedLanguage,
                    items: ['English', 'French', 'Spanish'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() => selectedLanguage = value!);
                    },
                  ),
                ),
                SettingsItem(
                  title: 'Font Size',
                  subtitle: 'Adjust text size',
                  trailing: Slider(
                    value: fontSize,
                    min: 12.0,
                    max: 24.0,
                    onChanged: (value) {
                      setState(() => fontSize = value);
                    },
                  ),
                ),
                SettingsItem(
                  title: 'Email Updates',
                  subtitle: 'Receive email notifications',
                  trailing: Switch(
                    value: emailUpdatesEnabled,
                    onChanged: (value) {
                      setState(() => emailUpdatesEnabled = value);
                    },
                  ),
                ),
                SettingsItem(
                  title: 'Profile Privacy',
                  subtitle: 'Control who can see your profile',
                  trailing: DropdownButton<String>(
                    value: selectedPrivacy,
                    items: ['Public', 'Private', 'Friends Only']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() => selectedPrivacy = value!);
                    },
                  ),
                ),
                SettingsItem(
                  title: 'Sound Effects',
                  subtitle: 'Enable sound effects',
                  trailing: Switch(
                    value: soundEffectsEnabled,
                    onChanged: (value) {
                      setState(() => soundEffectsEnabled = value);
                    },
                  ),
                ),
                SettingsItem(
                  title: 'Auto-Save',
                  subtitle: 'Automatically save changes',
                  trailing: Switch(
                    value: autoSaveEnabled,
                    onChanged: (value) {
                      setState(() => autoSaveEnabled = value);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SettingsSection(
              title: 'Automation & Notifications',
              children: [
                SettingsItem(
                  title: 'Class Notifications',
                  subtitle: 'Alert students about updates',
                  trailing: Switch(
                    value: classNotificationsEnabled,
                    onChanged: (value) {
                      setState(() => classNotificationsEnabled = value);
                    },
                  ),
                ),
                SettingsItem(
                  title: 'Auto-Grading',
                  subtitle: 'Automatic assignment grading',
                  trailing: Switch(
                    value: autoGradingEnabled,
                    onChanged: (value) {
                      setState(() => autoGradingEnabled = value);
                    },
                  ),
                ),
                SettingsItem(
                  title: 'Parent Emails',
                  subtitle: 'Automatic parent updates',
                  trailing: Switch(
                    value: parentEmailsEnabled,
                    onChanged: (value) {
                      setState(() => parentEmailsEnabled = value);
                    },
                  ),
                ),
                SettingsItem(
                  title: 'Lesson Planner',
                  subtitle: 'Automated lesson scheduling',
                  trailing: Switch(
                    value: lessonPlannerEnabled,
                    onChanged: (value) {
                      setState(() => lessonPlannerEnabled = value);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SettingsSection(
              title: 'Class Management',
              children: [
                SettingsItem(
                  title: 'Homework Reminders',
                  subtitle: 'Automatic assignment reminders',
                  trailing: Switch(
                    value: homeworkRemindersEnabled,
                    onChanged: (value) {
                      setState(() => homeworkRemindersEnabled = value);
                    },
                  ),
                ),
                SettingsItem(
                  title: 'Attendance Tracking',
                  subtitle: 'Automated attendance system',
                  trailing: Switch(
                    value: attendanceTrackingEnabled,
                    onChanged: (value) {
                      setState(() => attendanceTrackingEnabled = value);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Reset all settings to defaults
                    setState(() {
                      notificationsEnabled = false;
                      darkModeEnabled = false;
                      emailUpdatesEnabled = false;
                      soundEffectsEnabled = false;
                      autoSaveEnabled = false;
                      classNotificationsEnabled = false;
                      autoGradingEnabled = false;
                      parentEmailsEnabled = false;
                      lessonPlannerEnabled = false;
                      homeworkRemindersEnabled = false;
                      attendanceTrackingEnabled = false;
                      selectedLanguage = 'English';
                      selectedPrivacy = 'Public';
                      fontSize = 16.0;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color(0xFF4318D1),
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Color(0xFF4318D1)),
                    minimumSize: const Size(188, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: const Text('Reset Defaults'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Save all settings
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Settings saved successfully')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFF4318D1),
                    minimumSize: const Size(185, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: const Text('Save Changes'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
