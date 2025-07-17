import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AboutMeController extends GetxController {
  final TextEditingController aboutMeController = TextEditingController();
  final int maxLength = 300;

  var aboutMeText = ''.obs;

  void onTextChanged(String value) {
    aboutMeText.value = value;
  }

  @override
  void onClose() {
    aboutMeController.dispose();
    super.onClose();
  }
}
