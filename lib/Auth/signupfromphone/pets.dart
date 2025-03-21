import 'package:flutter/material.dart';

class PetsSelectionScreen extends StatefulWidget {
  const PetsSelectionScreen({Key? key}) : super(key: key);

  @override
  _PetsSelectionScreenState createState() => _PetsSelectionScreenState();
}

class _PetsSelectionScreenState extends State<PetsSelectionScreen> {
  String _selectedOption = '';

  final List<String> options = [
    "No Pets",
    "Dog Lover",
    "Cat Enthusiast",
    "Both Cats and Dogs",
    "Small Pet Parent (Rabbits, Hamsters, etc.)",
    "Exotic Animals (Birds, Reptiles, etc.)",
    "Open to Pets",
    "Allergic, but Love Animals"
  ];

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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              "Pets",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: options.length,
                itemBuilder: (context, index) {
                  return RadioListTile(
                    title: Text(
                      options[index],
                      style: TextStyle(
                        color: _selectedOption.isEmpty || _selectedOption == options[index]
                            ? Colors.black
                            : Colors.grey, // Initial black, turns gray if not selected
                        fontSize: 16,
                      ),
                    ),
                    value: options[index],
                    groupValue: _selectedOption,
                    activeColor: Colors.blueAccent,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value.toString();
                      });
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
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
                onPressed: () {
                  // Handle next button press
                  Navigator.pushNamed(context, '/habbits');
                },
                child: const Text(
                  'Next',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
