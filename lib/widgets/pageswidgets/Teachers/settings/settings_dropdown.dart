import 'package:flutter/material.dart';

class SettingsDropdown extends StatelessWidget {
  final String value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const SettingsDropdown({
    Key? key,
    required this.value,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: DropdownButton<String>(
        value: value,
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontFamily: 'Inter',
              ),
            ),
          );
        }).toList(),
        onChanged: onChanged,
        underline: Container(),
        icon: const Icon(Icons.keyboard_arrow_down, size: 20),
        isExpanded: true,
      ),
    );
  }
}