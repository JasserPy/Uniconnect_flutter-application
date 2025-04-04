import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final TextInputType type;
  final Color labelColor;
  final TextEditingController controller;
  final bool isEditing;
  final ValueChanged<String>? onChanged;

  const CustomInputField({
    Key? key,
    required this.label,
    required this.type,
    required this.labelColor,
    required this.controller,
    required this.isEditing,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      enabled: isEditing,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: labelColor,
          fontSize: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
