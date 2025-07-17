import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dating_app/Dashbaord/dashboard/Dashboard.dart'; // Adjust path

class SignUpPhoneController extends GetxController {
  final TextEditingController phoneController = TextEditingController();

  @override
  void onClose() {
    phoneController.dispose();
    super.onClose();
  }

  void sendCode() {
    String phone = phoneController.text.trim();
    if (phone.isEmpty) {
      Get.snackbar("Error", "Please enter a valid phone number");
    } else {
      // Navigate to Dashboard using GetX
      Get.to(() => const DashboardScreen());
    }
  }
}
