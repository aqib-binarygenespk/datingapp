import 'package:get/get.dart';
import 'package:flutter/material.dart';

class VerificationCodeController extends GetxController {
  var timerSeconds = 30.obs;
  var isTimeUp = false.obs;
  final maskedNumber = '01xxxxxxx'.obs;

  final List<TextEditingController> controllers =
  List.generate(4, (_) => TextEditingController());

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));
      if (timerSeconds.value > 0) {
        timerSeconds.value--;
        return true;
      } else {
        isTimeUp.value = true;
        return false;
      }
    });
  }

  @override
  void onClose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.onClose();
  }
}
