import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String placeholder;
  final bool isPassword;
  final Color textColor;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Color? labelColor;
  final Color borderColor;
  final Color focusedBorderColor;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.placeholder,
    this.isPassword = false,
    this.textColor = Colors.black,
    this.controller,
    this.keyboardType,
    this.labelColor,
    this.borderColor = const Color(0xFFE6E6E6),
    this.focusedBorderColor = const Color(0xFF4318D1),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: labelColor ?? textColor,
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: isPassword,
          keyboardType: keyboardType,
          style: TextStyle(
            color: textColor,
            fontFamily: 'Inter',
            fontSize: 14,
          ),
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: TextStyle(
              color: Colors.grey[400],
              fontFamily: 'Inter',
              fontSize: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: focusedBorderColor),
            ),
            filled: true,
            fillColor: Colors.transparent,
          ),
        ),
      ],
    );
  }
}
