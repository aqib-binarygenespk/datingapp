import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../themesfolder/theme.dart';
import 'getotknoe_controller.dart';

class GetToKnowMeClipScreen extends StatelessWidget {
  const GetToKnowMeClipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GetToKnowMeController controller = Get.put(GetToKnowMeController());

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Get to Know Me Clip",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Share a bit about yourself with a live, recorded video from your device’s camera. Choose one of our fun prompt questions to answer and let your personality shine! This helps create a genuine connection right from the start.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: controller.options.length,
                itemBuilder: (context, index) {
                  return Obx(() => RadioListTile<int>(
                    title: Text(
                      controller.options[index],
                      style: TextStyle(
                        fontSize: 16,
                        color: controller.selectedOption.value == index
                            ? Colors.black
                            : (controller.selectedOption.value == -1
                            ? Colors.black
                            : Colors.grey),
                      ),
                    ),
                    value: index,
                    groupValue: controller.selectedOption.value,
                    onChanged: (int? value) {
                      controller.selectOption(value!);
                    },
                    activeColor: Colors.black,
                  ));
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (controller.selectedOption.value != -1) {
                    Navigator.pushNamed(context, '/recordvideo');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please select an option to proceed."),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF111827),
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  "Next",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
