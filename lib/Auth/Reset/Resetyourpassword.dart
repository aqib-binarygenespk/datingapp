import 'package:flutter/material.dart';

class Resetyourpassword extends StatelessWidget {
  const Resetyourpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Reset your password",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "What email address is associated to your account?",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
            ),

            // Email TextFormField
            const SizedBox(height: 20),
            const Text("Email"),
            const SizedBox(height: 6),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter your email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 15),
            const SizedBox(height: 20),

            // Login Button
            ElevatedButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/setnewpassword');
                // Add login with email functionality
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF111827),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Send Login link"),
            ),
          ],
        ),
      ),
    );;
  }
}
