import 'package:dating_app/Auth/signupfromphone/pets/pets_controller.dart';
import 'package:dating_app/themesfolder/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PetsSelectionScreen extends StatelessWidget {
  const PetsSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PetsSelectionController controller = Get.put(PetsSelectionController());

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text("Pets", style: Theme.of(context).textTheme.displayLarge),
            const SizedBox(height: 24),

            // List of options
            Expanded(
              child: ListView.builder(
                itemCount: controller.options.length,
                itemBuilder: (context, index) {
                  final option = controller.options[index];
                  return Obx(() => RadioListTile(
                    title: Text(
                      option,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: controller.selectedOption.value == option
                            ? Colors.black
                            : Colors.grey.shade700,
                      ),
                    ),
                    value: option,
                    groupValue: controller.selectedOption.value,
                    activeColor: Colors.black, // ✅ Black highlight on select
                    onChanged: (value) {
                      controller.selectOption(value.toString());
                    },
                  ));
                },
              ),
            ),

            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () => Navigator.pushNamed(context, '/habbits'),
                child: Text(
                  'Next',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
