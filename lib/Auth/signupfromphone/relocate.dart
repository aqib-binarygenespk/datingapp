import 'package:flutter/material.dart';

class RelocateLoveScreen extends StatefulWidget {
  const RelocateLoveScreen({Key? key}) : super(key: key);

  @override
  _RelocateLoveScreenState createState() => _RelocateLoveScreenState();
}

class _RelocateLoveScreenState extends State<RelocateLoveScreen> {
  final List<String> relocateOptions = [
    'Yes, open to relocating',
    'Maybe, depends on the situation',
    'No, prefer staying in my area',
  ];

  List<String> selectedRelocateOptions = [];

  void _onOptionSelected(String option) {
    setState(() {
      if (selectedRelocateOptions.contains(option)) {
        selectedRelocateOptions.remove(option);
      } else {
        if (selectedRelocateOptions.length < 1) {
          selectedRelocateOptions.add(option);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Relocate Love',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Are you open to relocating for love? Select up to two options that best describe your willingness to move. This helps in understanding your flexibility.",
              style: TextStyle(color: Colors.black54, fontSize: 14),
            ),
            const SizedBox(height: 24),
            Column(
              children: relocateOptions.map((option) {
                bool isSelected = selectedRelocateOptions.contains(option);
                return GestureDetector(
                  onTap: () => _onOptionSelected(option),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 12),
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected ? Colors.black : Colors.grey,
                              width: 2,
                            ),
                            color: isSelected ? Colors.black : Colors.grey[200],
                          ),
                          child: isSelected
                              ? const Icon(
                            Icons.check,
                            size: 16,
                            color: Colors.white,
                          )
                              : null,
                        ),
                        Text(
                          option,
                          style: TextStyle(
                            color: isSelected ? Colors.black87 : Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: selectedRelocateOptions.isNotEmpty
                    ? () {
                  // Handle next button press
                  print("Selected relocate options: $selectedRelocateOptions");
                }
                    : null,
                child: const Text(
                  'Next',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
