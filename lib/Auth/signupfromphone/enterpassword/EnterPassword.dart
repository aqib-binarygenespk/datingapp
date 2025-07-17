import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dating_app/themesfolder/textfields.dart';
import '../../../themesfolder/theme.dart';
import 'enterpasword_controller.dart';

class EnterPassword extends StatelessWidget {
  const EnterPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final EnterPasswordController controller = Get.put(EnterPasswordController());

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              "Enter a password",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 10),

            // Subtitle
            Text(
              "Create a password to finish signing up.",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 32),

            // New Password Label
            Text(
              "New Password",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),

            // New Password Field
            Obx(() => CustomTextField(

              hintText: "Enter your new password",
              obscureText: !controller.isPasswordVisible.value,
              controller: controller.passwordController,
              suffixIcon: IconButton(
                icon: Icon(
                  controller.isPasswordVisible.value
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.black54,
                ),
                onPressed: controller.togglePasswordVisibility,
              ),
            )),

            const SizedBox(height: 24),

            // Confirm Password Label
            Text(
              "Confirm New Password",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),

            // Confirm Password Field
            Obx(() => CustomTextField(

              hintText: "Re-enter your password",
              obscureText: !controller.isConfirmPasswordVisible.value,
              controller: controller.confirmPasswordController,
              suffixIcon: IconButton(
                icon: Icon(
                  controller.isConfirmPasswordVisible.value
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.black54,
                ),
                onPressed: controller.toggleConfirmPasswordVisibility,
              ),
            )),

            const SizedBox(height: 32),

            // Sign Up Button
            ElevatedButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/ProfileDetails');
              },
              child: const Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
