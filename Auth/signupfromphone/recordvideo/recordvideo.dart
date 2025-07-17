import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../themesfolder/theme.dart';
import 'recordvideo_controller.dart';

class RecordVideoScreen extends StatelessWidget {
  const RecordVideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RecordVideoController controller = Get.put(RecordVideoController());

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Record Your Video', style: Theme.of(context).textTheme.displayLarge),
            const SizedBox(height: 20),
            Text(
              'Questions:',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            Text(
              '1. How do you make new people feel welcome in a group setting?',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 32),

            // Video Box
            Obx(() {
              return GestureDetector(
                onTap: () => controller.showUploadDialog(context),
                child: Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: controller.videoFile.value == null
                      ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/video.png',
                        width: 40,
                        height: 40,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Record Video',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )
                      : controller.thumbnailPath.value != null
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.file(
                      File(controller.thumbnailPath.value!),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 180,
                    ),
                  )
                      : const Center(child: CircularProgressIndicator()),
                ),
              );
            }),

            const Spacer(),

            // Upload Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/uploadphoto');
                },
                child: Text(
                  controller.videoFile.value == null ? 'Upload Video' : 'Update',
                  style: Theme.of(context).textTheme.labelLarge,
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
