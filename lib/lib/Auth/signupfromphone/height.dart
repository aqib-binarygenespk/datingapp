import 'package:flutter/material.dart';

class HeightSelection extends StatefulWidget {
  const HeightSelection({super.key});

  @override
  _HeightSelectionState createState() => _HeightSelectionState();
}

class _HeightSelectionState extends State<HeightSelection> {
  double _heightInInches = 60; // Default height in inches (5 feet)

  // Convert height in inches to feet and inches
  String get heightInFeetAndInches {
    final int feet = (_heightInInches ~/ 12).toInt();
    final int inches = (_heightInInches % 12).toInt();
    return "$feet' $inches\"";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Select Your Height"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              "Height",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            // Height display
            Text(
              heightInFeetAndInches,
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),

            // Height slider
            Slider(
              value: _heightInInches,
              min: 36, // Minimum height in inches (3 feet)
              max: 84, // Maximum height in inches (7 feet)
              divisions: 48, // Each inch
              label: heightInFeetAndInches,
              onChanged: (double newValue) {
                setState(() {
                  _heightInInches = newValue;
                });
              },
              activeColor: Colors.black,
              inactiveColor: Colors.grey.shade300,
            ),
            const Spacer(),

            // Next Button

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle "Next" button action
                  Navigator.pushNamed(context, '/interestedin');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF111827),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text("Next", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
