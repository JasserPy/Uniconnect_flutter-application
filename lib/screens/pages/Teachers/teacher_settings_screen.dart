import 'package:flutter/material.dart';
import 'package:student_dashboard/data/notifiers.dart';

class TeacherSettingsScreen extends StatefulWidget {
  const TeacherSettingsScreen({Key? key}) : super(key: key);

  @override
  State<TeacherSettingsScreen> createState() => _TeacherSettingsScreenState();
}

class _TeacherSettingsScreenState extends State<TeacherSettingsScreen> {
  // Settings state variables
  bool _notificationsEnabled = true;
  bool _soundEffectsEnabled = true;
  bool _autoSaveEnabled = true;
  bool _emailUpdatesEnabled = true;
  String _selectedLanguage = 'English';
  String _defaultSubject = 'Mathematics';
  String _classroomMode = 'In-person';
  String _profilePrivacy = 'Public';

  // Options lists
  final List<String> _languages = ['English', 'French', 'Spanish'];
  final List<String> _subjects = ['Mathematics', 'Science', 'History', 'English'];
  final List<String> _classModes = ['In-person', 'Hybrid', 'Remote'];
  final List<String> _privacyOptions = ['Public', 'Private', 'Friends Only'];

  // Primary color constant
  static const Color _primaryColor = Color(0xFF4318D1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // General Settings Section
              _buildSettingsSection(
                title: 'General Settings',
                children: [
                  _buildSettingItem(
                    title: 'Notifications',
                    description: 'Enable push notifications',
                    trailing: Switch(
                      value: _notificationsEnabled,
                      onChanged: (value) => setState(() => _notificationsEnabled = value),
                      activeColor: _primaryColor,
                    ),
                  ),
                  _buildSettingItem(
                    title: 'Dark Mode',
                    description: 'Switch to dark theme',
                    trailing: ValueListenableBuilder<bool>(
                      valueListenable: selectedPageisdark,
                      builder: (context, isDark, child) {
                        return Switch(
                          value: isDark,
                          onChanged: (value) => selectedPageisdark.value = value,
                          activeColor: _primaryColor,
                        );
                      },
                    ),
                  ),
                  _buildSettingItem(
                    title: 'Language',
                    description: 'Select your preferred language',
                    trailing: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.4,
                      ),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: _selectedLanguage,
                        items: _languages.map((lang) => DropdownMenuItem(
                          value: lang,
                          child: Text(
                            lang,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )).toList(),
                        onChanged: (value) => setState(() => _selectedLanguage = value!),
                        underline: Container(),
                      ),
                    ),
                  ),
                  _buildSettingItem(
                    title: 'Email Updates',
                    description: 'Receive email notifications',
                    trailing: Switch(
                      value: _emailUpdatesEnabled,
                      onChanged: (value) => setState(() => _emailUpdatesEnabled = value),
                      activeColor: _primaryColor,
                    ),
                  ),
                  _buildSettingItem(
                    title: 'Profile Privacy',
                    description: 'Control who can see your profile',
                    trailing: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.4,
                      ),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: _profilePrivacy,
                        items: _privacyOptions.map((option) => DropdownMenuItem(
                          value: option,
                          child: Text(
                            option,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )).toList(),
                        onChanged: (value) => setState(() => _profilePrivacy = value!),
                        underline: Container(),
                      ),
                    ),
                  ),
                  _buildSettingItem(
                    title: 'Sound Effects',
                    description: 'Enable sound effects',
                    trailing: Switch(
                      value: _soundEffectsEnabled,
                      onChanged: (value) => setState(() => _soundEffectsEnabled = value),
                      activeColor: _primaryColor,
                    ),
                  ),
                  _buildSettingItem(
                    title: 'Auto-Save',
                    description: 'Automatically save changes',
                    trailing: Switch(
                      value: _autoSaveEnabled,
                      onChanged: (value) => setState(() => _autoSaveEnabled = value),
                      activeColor: _primaryColor,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Classroom Settings Section
              _buildSettingsSection(
                title: 'Classroom Settings',
                subtitle: 'Academic Year 2023-24',
                children: [
                  _buildSettingItem(
                    title: 'Default Subject',
                    description: 'Set primary teaching subject',
                    trailing: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.4,
                      ),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: _defaultSubject,
                        items: _subjects.map((subject) => DropdownMenuItem(
                          value: subject,
                          child: Text(
                            subject,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )).toList(),
                        onChanged: (value) => setState(() => _defaultSubject = value!),
                        underline: Container(),
                      ),
                    ),
                  ),
                  _buildSettingItem(
                    title: 'Classroom Mode',
                    description: 'Teaching environment',
                    trailing: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.4,
                      ),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: _classroomMode,
                        items: _classModes.map((mode) => DropdownMenuItem(
                          value: mode,
                          child: Text(
                            mode,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )).toList(),
                        onChanged: (value) => setState(() => _classroomMode = value!),
                        underline: Container(),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _resetToDefaults,
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: const BorderSide(color: _primaryColor),
                      ),
                      child: const Text(
                        'Reset Defaults',
                        style: TextStyle(color: _primaryColor),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _saveChanges,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text(
                        'Save Changes',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  // Helper Methods
  Widget _buildSettingsSection({
    required String title,
    String? subtitle,
    required List<Widget> children,
  }) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (subtitle != null)
                  Flexible(
                    child: Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required String title,
    required String description,
    required Widget trailing,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: trailing,
          ),
        ],
      ),
    );
  }

  void _resetToDefaults() {
    setState(() {
      _notificationsEnabled = true;
      _soundEffectsEnabled = true;
      _autoSaveEnabled = true;
      _emailUpdatesEnabled = true;
      _selectedLanguage = 'English';
      _defaultSubject = 'Mathematics';
      _classroomMode = 'In-person';
      _profilePrivacy = 'Public';
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Settings reset to defaults')),
    );
  }

  void _saveChanges() {
    // Here you would typically save to persistent storage
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Settings saved successfully')),
    );
  }
}