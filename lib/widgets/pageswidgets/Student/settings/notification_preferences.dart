import 'package:flutter/material.dart';
import 'common/custom_checkbox.dart';

class NotificationPreferences extends StatefulWidget {
  final Color textColor;
  final Color secondaryTextColor;
  final bool isEditing;
  final Function(Map<String, bool>) onChanged; // Mettre à jour toutes les préférences

  const NotificationPreferences({
    Key? key,
    required this.textColor,
    required this.secondaryTextColor,
    required this.isEditing,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<NotificationPreferences> createState() => _NotificationPreferencesState();
}

class _NotificationPreferencesState extends State<NotificationPreferences> {
  // Map to store notification preferences
  late Map<String, bool> preferences;

  @override
  void initState() {
    super.initState();
    preferences = {
      'Email Notifications': true,
      'SMS Notifications': false,
      'Absence Alerts': true,
    };
  }

  void _updatePreference(String key, bool value) {
    setState(() {
      preferences[key] = value;
    });
    widget.onChanged(preferences); // Notifier le parent du changement
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? Colors.grey[800]! : Colors.white;
    final textColor = widget.textColor;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: isDarkMode ? [] : [const BoxShadow(color: Color(0x40000000), offset: Offset(0, 4), blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            'Notification Preferences',
            style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 24),

          // List of preferences with checkboxes
          ...preferences.entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Preference label
                  Text(
                    entry.key,
                    style: TextStyle(color: textColor, fontSize: 14),
                  ),

                  // Custom checkbox
                  CustomCheckbox(
                    value: entry.value,
                    onChanged: (bool? newValue) {
                      if (widget.isEditing) {
                        _updatePreference(entry.key, newValue ?? false);
                      }
                    },
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
