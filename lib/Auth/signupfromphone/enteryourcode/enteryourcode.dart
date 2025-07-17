import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dating_app/themesfolder/Alertmessages.dart';
import '../../../themesfolder/theme.dart';
import 'enteryourcode_controller.dart';

class VerificationCodeScreen extends StatelessWidget {
  const VerificationCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final VerificationCodeController controller = Get.put(VerificationCodeController());

    Widget _buildCodeBox(int index) {
      return Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: TextField(
            controller: controller.controllers[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            obscureText: true,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 24),
            decoration: const InputDecoration(
              border: InputBorder.none,
              counterText: '',
            ),
            onChanged: (value) {
              if (value.isNotEmpty && index < controller.controllers.length - 1) {
                FocusScope.of(context).nextFocus();
              } else if (value.isEmpty && index > 0) {
                FocusScope.of(context).previousFocus();
              }
            },
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Enter Your Code",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 8),
            Obx(() => Text(
              "Enter the verification code we sent to ${controller.maskedNumber}",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.black54),
            )),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) => _buildCodeBox(index)),
            ),
            const SizedBox(height: 30),
            Obx(() => ElevatedButton(
              onPressed: controller.isTimeUp.value
                  ? null
                  : () {
                String enteredCode = controller.controllers.map((e) => e.text).join();
                if (enteredCode.length == 4) {
                  Navigator.popAndPushNamed(context, '/EnterPassword');
                } else {
                  Get.snackbar('Error', 'Please enter a valid 4-digit code');
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: controller.isTimeUp.value ? Colors.grey : const Color(0xFF111827),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Verify"),
            )),
            const SizedBox(height: 20),
            Obx(() => Text(
              "Resend Code in 00:${controller.timerSeconds.value.toString().padLeft(2, '0')}",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            )),
          ],
        ),
      ),
    );
  }
}
