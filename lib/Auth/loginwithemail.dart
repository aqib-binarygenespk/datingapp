import 'package:flutter/material.dart';

class LoginWithEmailScreen extends StatelessWidget {
  const LoginWithEmailScreen({super.key});

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
            Text(
              "Login with Email",
              style: Theme.of(context).textTheme.displayLarge, // Use theme textStyle
            ),
            const SizedBox(height: 20),

            // Email TextFormField
            const Text("Email", style: TextStyle(color: Color(0xFF4E3B31), fontSize: 16)),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "Enter your email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 15),

            // Password TextFormField
            const Text("Password"),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Enter your password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
              ),
              obscureText: true,
            ),
            const SizedBox(height: 0.7),
            // Forgot Password Button
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Navigate to reset password screen
                  Navigator.pushNamed(context, '/reset-password');
                },
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(fontSize: 14, color: Color(0xFF4E3B31)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Login Button
            ElevatedButton(
              onPressed: () {
                // Add login with email functionality
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF111827),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Login", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
