
import 'package:dating_app/Auth/LoginWithEmailController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX
import 'package:dating_app/themesfolder/textfields.dart';
// Import the controller

class LoginWithEmailScreen extends StatelessWidget {
  // Inject the controller
  final LoginWithEmailController controller = Get.put(LoginWithEmailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(), // Use Get.back() instead of Navigator.pop()
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

            // Email Field
            const Text("Email", style: TextStyle(color: Color(0xFF4E3B31), fontSize: 16)),
            CustomTextField(
              labelText: "Email",
              hintText: "Enter your email",
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) => controller.email.value = value, // Bind to controller
            ),
            const SizedBox(height: 15),

            // Password Field
            const Text("Password"),
            CustomTextField(
              labelText: "Password",
              hintText: "Enter your password",
              obscureText: true,
              onChanged: (value) => controller.password.value = value, // Bind to controller
            ),
            const SizedBox(height: 0.7),

            // Forgot Password Button
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Navigate to reset password screen using Get.toNamed()
                  Get.toNamed('/reset-password');
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
                // Trigger login logic from the controller
                controller.login();
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