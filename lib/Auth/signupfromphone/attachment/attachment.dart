import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../themesfolder/theme.dart';
import 'attachment_controller.dart';

class AttachmentsScreen extends StatelessWidget {
  const AttachmentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AttachmentsController controller = Get.put(AttachmentsController());

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
              'Attachments',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 20),
            Text(
              "Select one type of attachment you prefer to share. This helps in managing shared content better.",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 24),

            /// Options
            Obx(() => Column(
              children: controller.attachments.map((attachment) {
                bool isSelected = controller.selectedAttachments.contains(attachment);
                return GestureDetector(
                  onTap: () => controller.onAttachmentSelected(attachment),
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
                          attachment,
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
            Obx(
                  () => SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black87,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: controller.selectedAttachments.isNotEmpty
                      ? () {
                    Navigator.pushNamed(context, '/relocate');
                    print("Selected attachments: ${controller.selectedAttachments}");
                  }
                      : null,
                  child: Text(
                    'Next',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
