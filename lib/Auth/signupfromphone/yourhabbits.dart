import 'package:flutter/material.dart';

class GetToKnowYourHabitsScreen extends StatefulWidget {
  @override
  _GetToKnowYourHabitsScreenState createState() => _GetToKnowYourHabitsScreenState();
}

class _GetToKnowYourHabitsScreenState extends State<GetToKnowYourHabitsScreen> {
  String smokingHabit = 'Non-Smoker';
  String drinkingHabit = 'Non-Drinker';
  String dietaryPreference = 'Omnivore';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE6E6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Let's Get to Know Your Habits",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "These details help us match you with someone whose habits align with yours. Here’s to finding your perfect lifestyle companion!",
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 20),

            // Smoking Habits Section
            const Text(
              "1. Smoking Habits:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            RadioListTile<String>(
              title: const Text("Non-Smoker"),
              value: "Non-Smoker",
              groupValue: smokingHabit,
              onChanged: (value) {
                setState(() {
                  smokingHabit = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text("Occasional Smoker"),
              value: "Occasional Smoker",
              groupValue: smokingHabit,
              onChanged: (value) {
                setState(() {
                  smokingHabit = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text("Regular Smoker"),
              value: "Regular Smoker",
              groupValue: smokingHabit,
              onChanged: (value) {
                setState(() {
                  smokingHabit = value!;
                });
              },
            ),

            const SizedBox(height: 20),

            // Drinking Habits Section
            const Text(
              "2. Drinking Habits:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            RadioListTile<String>(
              title: const Text("Non-Drinker"),
              value: "Non-Drinker",
              groupValue: drinkingHabit,
              onChanged: (value) {
                setState(() {
                  drinkingHabit = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text("Social Drinker"),
              value: "Social Drinker",
              groupValue: drinkingHabit,
              onChanged: (value) {
                setState(() {
                  drinkingHabit = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text("Regular Drinker"),
              value: "Regular Drinker",
              groupValue: drinkingHabit,
              onChanged: (value) {
                setState(() {
                  drinkingHabit = value!;
                });
              },
            ),

            const SizedBox(height: 20),

            // Dietary Preferences Section
            const Text(
              "3. Dietary Preferences:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            RadioListTile<String>(
              title: const Text("Omnivore"),
              value: "Omnivore",
              groupValue: dietaryPreference,
              onChanged: (value) {
                setState(() {
                  dietaryPreference = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text("Vegetarian"),
              value: "Vegetarian",
              groupValue: dietaryPreference,
              onChanged: (value) {
                setState(() {
                  dietaryPreference = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text("Vegan"),
              value: "Vegan",
              groupValue: dietaryPreference,
              onChanged: (value) {
                setState(() {
                  dietaryPreference = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text("Gluten-Free"),
              value: "Gluten-Free",
              groupValue: dietaryPreference,
              onChanged: (value) {
                setState(() {
                  dietaryPreference = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text("Pescatarian"),
              value: "Pescatarian",
              groupValue: dietaryPreference,
              onChanged: (value) {
                setState(() {
                  dietaryPreference = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text("Other (with an option to specify)"),
              value: "Other",
              groupValue: dietaryPreference,
              onChanged: (value) {
                setState(() {
                  dietaryPreference = value!;
                });
              },
            ),

            const SizedBox(height: 20),

            // Next Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Add your next button functionality
                  Navigator.pushNamed(context, '/lovelanguage');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text("Next"),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
