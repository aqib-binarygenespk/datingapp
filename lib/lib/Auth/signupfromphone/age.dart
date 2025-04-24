import 'package:flutter/material.dart';

class AgeSelection extends StatefulWidget {
  const AgeSelection({super.key});

  @override
  _AgeSelectionState createState() => _AgeSelectionState();
}

class _AgeSelectionState extends State<AgeSelection> {
  double _selectedAge = 18; // Default age

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Select Your Age",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              "Age",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 10),
            // Age Display
            Text(
              "${_selectedAge.toInt()} Years",
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),

            // Age Slider
            Slider(
              value: _selectedAge,
              min: 18,
              max: 60,
              divisions: 42, // From 18 to 60 (42 steps)
              label: "${_selectedAge.toInt()} Years",
              onChanged: (double newValue) {
                setState(() {
                  _selectedAge = newValue;
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
                  Navigator.pushNamed(context, '/nextScreen');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF111827), // Dark button color
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Next",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
