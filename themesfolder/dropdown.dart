import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String label;
  final List<String> options;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;
  final String hintText;

  const CustomDropdown({
    super.key,
    required this.label,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
    this.hintText = "Select an option",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey),
            color: Colors.white,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: DropdownButtonHideUnderline(
            child: DropdownButtonFormField<String>(
              value: selectedValue,
              hint: Text(hintText),
              style: const TextStyle(fontSize: 16, color: Colors.black),
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 12),
              ),
              dropdownColor: Colors.white,
              borderRadius: BorderRadius.circular(10),
              items: options.map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option, style: const TextStyle(fontSize: 16, color: Colors.black)),
                );
              }).toList(),
              onChanged: onChanged,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select an option';
                }
                return null;
              },
            ),
          ),
        ),
      ],
    );
  }
}
