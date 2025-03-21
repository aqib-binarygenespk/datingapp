import 'package:flutter/material.dart';

class GetToKnowMeClipScreen extends StatefulWidget {
  @override
  _GetToKnowMeClipScreenState createState() => _GetToKnowMeClipScreenState();
}

class _GetToKnowMeClipScreenState extends State<GetToKnowMeClipScreen> {
  int _selectedOption = -1; // Track the selected option

  final List<String> options = [
    "Why do you think a double date is better than a one-on-one first date?",
    "What’s your favorite way to spend a weekend with friends?",
    "How do you make new people feel welcome in a group setting?",
    "What’s a shared activity you think is perfect for a double date?",
    "Describe your ideal group outing.",
    "What’s your go-to game or activity for breaking the ice with new friends?",
    "If you could plan the ultimate double date, what would it look like?",
    "What’s a fun fact about you that people might not guess?",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Get to Know Me Clip",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Share a bit about yourself with a live, recorded video from your device’s camera. Choose one of our fun prompt questions to answer and let your personality shine! This helps create a genuine connection right from the start.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: options.length,
                itemBuilder: (context, index) {
                  return RadioListTile<int>(
                    title: Text(
                      options[index],
                      style: TextStyle(
                        fontSize: 16,
                        color: _selectedOption == index
                            ? Colors.black // Selected option stays black
                            : (_selectedOption == -1
                            ? Colors.black // Default color for all options
                            : Colors.grey), // Unselected options turn grey
                      ),
                    ),
                    value: index,
                    groupValue: _selectedOption,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedOption = value!;
                      });
                    },
                    activeColor: Colors.black,
                  );
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/recordvideo');
                  if (_selectedOption != -1) {
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                        content: Text("Please select an option to proceed."),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF111827),
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  "Next",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
