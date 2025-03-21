import 'package:dating_app/Dashbaord/Dashboard.dart';
import 'package:dating_app/Dashbaord/pairup/addevent.dart';
import 'package:dating_app/Dashbaord/pairup/pairupdetailscreen.dart';
import 'package:dating_app/themesfolder/theme.dart';
import 'package:flutter/material.dart';

class PairUp extends StatefulWidget {
  const PairUp({super.key});

  @override
  State<PairUp> createState() => _PairUpState();
}

class _PairUpState extends State<PairUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.backgroundColor,
        // Light pink background
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "PairUp Events",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "PairUp Events",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),

                // **Fix: Wrap GestureDetector Around the Card Properly**
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DashboardScreen(
                          selectedIndex: 2, // Keep PairUp tab selected
                          detailScreen: const EventDetailsScreen(), // Show Event Details
                        ),
                      ),
                    );
                  },

                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Local Circular Image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: const CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.grey, // Placeholder image
                            ),
                          ),
                          const SizedBox(width: 20),

                          // Event Details
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Dinner at Javier's",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "5PM, OCT 1st, 2024",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54,
                                ),
                              ),
                              Text(
                                "San Diego, CA",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black54,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Description of the event will go here",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 80), // Add spacing so content doesn't hide behind the search bar
              ],
            ),
          ),

          // **Sticky Search Bar at Bottom**
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.black26),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search_sharp, color: Colors.black54),
                  const SizedBox(width: 6),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Create Your Own PairUp Event",
                        hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_circle, color: Colors.black),
                    onPressed: ()  {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DashboardScreen(
                            selectedIndex: 2, // Keep PairUp tab selected
                            detailScreen: const AddEventScreen(), // Show Add Event Screen
                          ),
                        ),
                      );

                      // Navigate to Privacy Policy Screen
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      )

    );
  }
}
