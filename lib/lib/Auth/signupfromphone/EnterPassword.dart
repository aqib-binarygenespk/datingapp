import 'package:flutter/material.dart';
import 'package:dating_app/themesfolder/textfields.dart';

class EnterPassword extends StatefulWidget {
  const EnterPassword({super.key});

  @override
  _EnterPasswordState createState() => _EnterPasswordState();
}

class _EnterPasswordState extends State<EnterPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Enter password",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Create a password to finish up signing up",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
            ),
            const SizedBox(height: 20),
            Text(
              "New password",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            // New Password Field
            CustomTextField(
              labelText: "New Password",
              hintText: "Enter your new password",
              obscureText: !_isPasswordVisible,
              controller: _passwordController,
              suffixIcon: IconButton(
                icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              ),
            ),
            const SizedBox(height: 15),
            Text(
              "Confirm New Password",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            // Confirm Password Field
            CustomTextField(
              labelText: "Confirm New Password",
              hintText: "Confirm your new password",
              obscureText: !_isConfirmPasswordVisible,
              controller: _confirmPasswordController,
              suffixIcon: IconButton(
                icon: Icon(_isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),

            // Update Password Button
            ElevatedButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/ProfileDetails');
                // Add update password functionality here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF111827),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Sign up"),
            ),
          ],
        ),
      ),
    );
  }
}
