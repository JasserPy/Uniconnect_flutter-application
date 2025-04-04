import 'package:flutter/material.dart';

class AdministrativeControls extends StatelessWidget {
  final Color textColor;
  final Color cardBackgroundColor;
  final bool isEditing;
  final Function(bool) onChanged;

  const AdministrativeControls({
    Key? key,
    required this.textColor,
    required this.cardBackgroundColor,
    required this.isEditing,
    required this.onChanged,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? Colors.grey[800]! : Colors.white;
    final textColor = isDarkMode ? Colors.white : const Color(0xFF1A1A1A);
    final buttonColor = isDarkMode
        ? const Color.fromARGB(255, 42, 88, 187)
        : const Color.fromARGB(255, 43, 97, 213);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: isDarkMode
            ? []
            : [
                const BoxShadow(
                    color: Color(0x40000000),
                    offset: Offset(0, 4),
                    blurRadius: 4)
              ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Administrative Controls',
              style: TextStyle(
                  color: textColor, fontSize: 18, fontWeight: FontWeight.w700)),
          Switch(
            value: isEditing,
            onChanged: (value) => onChanged(value),
          ),
          const SizedBox(height: 18),
          _buildAdminButton(context, 'Manage Users', buttonColor),
          const SizedBox(height: 18),
          _buildAdminButton(context, 'System Settings', buttonColor),
          const SizedBox(height: 18),
          _buildAdminButton(context, 'View Logs', buttonColor),
          const SizedBox(height: 18),
          _buildAdminButton(context, 'Backup Data', buttonColor),
        ],
      ),
    );
  }

  Widget _buildAdminButton(
      BuildContext context, String text, Color buttonColor) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
        onPressed: () => _handleButtonPress(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
        ),
        child: Text(text,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500)),
      ),
    );
  }

  void _handleButtonPress(String action) {
    // Ajouter ici la logique spécifique pour chaque bouton
    print('Action exécutée : $action');
  }
}
