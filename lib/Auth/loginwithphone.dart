import 'package:flutter/material.dart';

class LoginWithPhoneScreen extends StatelessWidget {
  const LoginWithPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Login with Phone",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "If you signed up with your phone number, please enter it to login",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.flag), // Placeholder for country code flag
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
                Navigator.pushNamed(context, '/dashboard');
              },
              style: ElevatedButton.styleFrom(
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
