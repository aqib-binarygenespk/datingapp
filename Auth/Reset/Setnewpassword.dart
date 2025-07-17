import 'package:dating_app/themesfolder/textfields.dart';
import 'package:flutter/material.dart';
import 'package:dating_app/themesfolder/Alertmessages.dart'; // Assuming you put CustomAlert here

class SetNewPassword extends StatefulWidget {
  const SetNewPassword({super.key});

  @override
  _SetNewPasswordState createState() => _SetNewPasswordState();
}

class _SetNewPasswordState extends State<SetNewPassword> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  void _handleUpdatePassword() {
    final newPassword = _newPasswordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (newPassword.isEmpty || confirmPassword.isEmpty) {
      CustomAlert.show(
        context,
        title: "Missing Fields",
        message: "Please fill in both password fields.",
        onPressed: () => Navigator.pop(context),
      );
      return;
    }

    if (newPassword != confirmPassword) {
      CustomAlert.show(
        context,
        title: "Password Mismatch",
        message: "Both passwords must match.",
        onPressed: () => Navigator.pop(context),
      );
      return;
    }

    // Passwords match
    CustomAlert.show(
      context,
      title: "Success",
      message: "Password updated successfully!",
      onPressed: () {
        Navigator.pop(context);
        // You can navigate or perform logic here
      },
    );
  }

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
              "Set a new password",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Create a new password. Ensure it differs from\nprevious one for security",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
            ),
            const SizedBox(height: 20),

            const Text("New Password"),
            const SizedBox(height: 8),
            CustomTextField(
              controller: _newPasswordController,

              hintText: "Enter your new password",
              obscureText: !_isPasswordVisible,
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

            const Text("Confirm New Password"),
            const SizedBox(height: 8),
            CustomTextField(
              controller: _confirmPasswordController,

              hintText: "Confirm your new password",
              obscureText: !_isConfirmPasswordVisible,
              suffixIcon: IconButton(
                icon: Icon(_isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                  });
                },
              ),
            ),
            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: _handleUpdatePassword,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF111827),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Update Password"),
            ),
          ],
        ),
      ),
    );
  }
}
