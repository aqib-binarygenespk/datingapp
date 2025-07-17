import 'package:dating_app/themesfolder/textfields.dart';
import 'package:flutter/material.dart';

import '../../themesfolder/theme.dart';


class Resetyourpassword extends StatelessWidget {
  const Resetyourpassword({super.key});

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
            const SizedBox(height: 20),

            // Reuse CustomTextField for Email
            const CustomTextField(

              hintText: "Enter your email",
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 15),

            const SizedBox(height: 20),

            // Send Login Link Button
            ElevatedButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/setnewpassword');
                // Add functionality for sending login link here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF111827),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("Send Login link",style: TextStyle(
                color: AppTheme.backgroundColor,
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
