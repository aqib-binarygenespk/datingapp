import 'package:get/get.dart';
import '../../Dashbaord/dashboard/Dashboard.dart';
import 'package:flutter/material.dart';

import '../../themesfolder/Alertmessages.dart';
// ✅ import your alert dialog function

class LoginWithEmailController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;

  // Error messages
  var emailError = ''.obs;
  var passwordError = ''.obs;

  final String demoEmail = 'datingapptest@gmail.com';
  final String demoPassword = 'Date@321';

  void login() {
    emailError.value = '';
    passwordError.value = '';

    if (email.value.isEmpty) {
      emailError.value = 'Email is required';
    }

    if (password.value.isEmpty) {
      passwordError.value = 'Password is required';
    }

    // If any field is empty, return early
    if (emailError.value.isNotEmpty || passwordError.value.isNotEmpty) {
      return;
    }

    if (email.value != demoEmail || password.value != demoPassword) {
      // Show styled dialog if either is incorrect
      showLoginErrorDialog(Get.context!);
      return;
    }

    // Both are correct
    Get.snackbar('Success', 'Login successful!');
    Get.offAll(() => const DashboardScreen());
  }
}
