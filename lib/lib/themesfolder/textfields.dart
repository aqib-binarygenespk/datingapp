import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextEditingController? controller; // Existing controller parameter
  final Function(String)? onChanged; // Add onChanged callback

  const CustomTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
    this.controller, // Accept controller
    this.onChanged, // Accept onChanged callback
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller, // Assign controller
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        suffixIcon: suffixIcon,
      ),
      onChanged: onChanged, // Pass onChanged to TextFormField
    );
  }
}