import 'package:dating_app/Auth/signupfromphone/relocate/relocate_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../themesfolder/theme.dart';

class RelocateLoveScreen extends StatelessWidget {
  const RelocateLoveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RelocateLoveController controller = Get.put(RelocateLoveController());

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Relocate Love',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 20),
            Text(
              "Are you open to relocating for love? Select one option that best describes your willingness to move.",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 24),

            /// Options list
            Obx(() => Column(
              children: controller.relocateOptions.map((option) {
                bool isSelected = controller.selectedRelocateOptions.contains(option);
                return GestureDetector(
                  onTap: () => controller.toggleOption(option),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 12),
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected ? Colors.black : Colors.grey,
                              width: 2,
                            ),
                            color: isSelected ? Colors.black : Colors.grey[200],
                          ),
                          child: isSelected
                              ? const Icon(
                            Icons.check,
                            size: 16,
                            color: Colors.white,
                          )
                              : null,
                        ),
                        Text(
                          option,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: isSelected ? Colors.black87 : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            )),

            const SizedBox(height: 32),

            /// Next Button
            Obx(() => SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: controller.selectedRelocateOptions.isNotEmpty
                    ? () {
                  print("Selected relocate option: ${controller.selectedRelocateOptions}");
                  Navigator.pushNamed(context, '/nextScreen'); // Update route
                }
                    : null,
                child: Text(
                  'Next',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
