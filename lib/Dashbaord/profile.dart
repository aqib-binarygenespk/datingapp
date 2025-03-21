import 'package:dating_app/themesfolder/theme.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Dating Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {
              // Handle favorite action
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Scrollable content with Scrollbar
          Scrollbar(
            thickness: 8.0,
            radius: const Radius.circular(8.0),
            thumbVisibility: true,
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 266, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    "Mark C",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "32, 6'1\"",
                    style: TextStyle(color: Colors.black54),
                  ),
                  const SizedBox(height: 16),
                  buildProfileSection('About Me',
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lacinia odio vitae vestibulum vestibulum.'),
                  const Divider(color: Colors.grey, thickness: 0.5),
                  buildProfileSection('Bonding Moments',
                      'Friday night in with a homemade meal, living in a downtown apartment.'),
                  const Divider(color: Colors.grey, thickness: 0.5),
                  buildProfileSection('Relationship Goals',
                      'Looking for a long-term meaningful relationship with someone who shares similar values.'),
                  const Divider(color: Colors.grey, thickness: 0.5),
                  buildProfileSection('Pets',
                      'I love dogs and have a Golden Retriever named Max.'),
                  const Divider(color: Colors.grey, thickness: 0.5),
                  buildProfileSection('Smoking Habits', 'Non-smoker'),
                  const Divider(color: Colors.grey, thickness: 0.5),
                  buildProfileSection('Drinking Habits', 'Occasional drinker'),
                  const Divider(color: Colors.grey, thickness: 0.5),
                  buildProfileSection('Dietary Preferences', 'Vegetarian'),
                  const Divider(color: Colors.grey, thickness: 0.5),
                  buildProfileSection(
                      'Love Languages', 'Quality Time, Acts of Service'),
                  const Divider(color: Colors.grey, thickness: 0.5),
                  buildProfileSection('Attachment Style', 'Secure'),
                  const Divider(color: Colors.grey, thickness: 0.5),
                  buildProfileSection(
                      'Relocate for Love', 'Yes, I am open to relocating.'),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          // Fixed image or video at the top with padding
          Positioned(
            top: 0,
            left: 16,
            right: 16,
            child: Container(
              height: 250,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12.0),
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://via.placeholder.com/600x250.png?text=Profile+Image/Video'),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Center(
                child: Icon(
                  Icons.play_circle_outline,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget to build each profile section with a title and content
  Widget buildProfileSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            content,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
