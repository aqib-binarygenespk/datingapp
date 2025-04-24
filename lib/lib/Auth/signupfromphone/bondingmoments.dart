import 'package:flutter/material.dart';

class BondingMomentsScreen extends StatefulWidget {
  const BondingMomentsScreen({Key? key}) : super(key: key);

  @override
  _BondingMomentsScreenState createState() => _BondingMomentsScreenState();
}

class _BondingMomentsScreenState extends State<BondingMomentsScreen> {
  final List<List<String>> bondingOptions = [
    ['Friday night in with a homemade meal', 'Exploring restaurants and bars'],
    ['Running a marathon on a Sunday', 'Grabbing brunch with your boo'],
    ['Cozy movie marathon', 'Outdoor movie night under the stars'],
    ['Camper adventure', 'Glamping experience'],
    ['Living in a downtown apartment', 'Living in a big house in the suburbs'],
    ['On a sunny day, lounging poolside', 'On a sunny day, taking a dip in the ocean'],
    ['Cooking at home together', 'Dining out for culinary adventure'],
    ['Wine tasting tour', 'Visiting local breweries for beer tasting'],
    ['Road trip exploration', 'Relaxing in an airport lounge'],
    ['Fall asleep cuddling with a TV on', 'Fall asleep cuddling in perfect silence'],
    ['Cooking over a campfire', 'Enjoying the luxury of room service'],
    ['Live music in the open air', 'Enjoying music at home'],
    ['Canoeing over crooks', 'Crossing over canals'],
    ['Taking your dog on a play date', 'Organizing a kid play date'],
  ];

  final Map<int, String?> selectedOptions = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE6E6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Bonding Moments",
          style: TextStyle(color: Colors.black87),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: bondingOptions.asMap().entries.map((entry) {
                    final index = entry.key;
                    final options = entry.value;

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: options.map((option) {
                        final isSelected = selectedOptions[index] == option;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedOptions[index] = isSelected ? null : option;
                            });
                          },
                          child: Container(
                            width: (MediaQuery.of(context).size.width - 48) / 2,
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            decoration: BoxDecoration(
                              color: isSelected ? Colors.black87 : Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: isSelected ? Colors.black87 : Colors.grey.shade300,
                              ),
                            ),
                            child: Row(
                              children: [
                                CustomCircularCheckBox(isSelected: isSelected),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    option,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: isSelected ? Colors.white : Colors.black87,
                                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  }).toList(),
                ),
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
                  // Handle the next button press
                  Navigator.pushNamed(context, '/aboutme');
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

class CustomCircularCheckBox extends StatelessWidget {
  final bool isSelected;

  const CustomCircularCheckBox({Key? key, required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? Colors.white : Colors.grey,
          width: 2,
        ),
      ),
      child: isSelected
          ? Center(
        child: Container(
          width: 12,
          height: 12,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        ),
      )
          : null,
    );
  }
}
