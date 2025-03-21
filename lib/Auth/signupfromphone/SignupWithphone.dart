import 'package:dating_app/Dashbaord/Dashboard.dart';
import 'package:flutter/material.dart';

class SignUpWithPhoneScreen extends StatelessWidget {
  const SignUpWithPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sign-up with Phone",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "if you signed up with your phone number, Please\n "
                      "enter it to login",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 30),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.flag), // Placeholder for country code flag
                hintText: "Enter Phone Number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add navigation to code verification screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DashboardScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF111827),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Send Code"),
            ),
          ],
        ),
      ),
    );
  }
}
