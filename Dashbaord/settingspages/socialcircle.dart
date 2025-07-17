import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../themesfolder/theme.dart';

class SocialConnectionsScreen extends StatelessWidget {
  const SocialConnectionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              "Social Connections",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 40),

            // Facebook
            Row(
              children: [
                Image.asset(
                  'assets/facebooklogo.png',
                  height: 24,
                  width: 24,
                ),
                const SizedBox(width: 10),
                const Text(
                  "Connect Your Facebook",
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Instagram
            Row(
              children: [
                Image.asset(
                  'assets/instalogo.png',
                  height: 24,
                  width: 24,
                ),
                const SizedBox(width: 10),
                const Text(
                  "Connect Your Instagram",
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ],
            ),
            const Spacer(),

            // Next button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate or perform next action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0D0F21),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Next",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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
