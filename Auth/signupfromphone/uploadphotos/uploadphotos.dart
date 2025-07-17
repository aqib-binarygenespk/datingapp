import 'dart:io';
import 'package:dating_app/Auth/signupfromphone/uploadphotos/uploadsphotos_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../themesfolder/theme.dart';

class UploadYourPhotosScreen extends StatelessWidget {
  const UploadYourPhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UploadPhotosController controller = Get.put(UploadPhotosController());

    Widget buildImageContainer(int index) {
      return GestureDetector(
        onTap: () => controller.pickImage(index),
        child: Obx(() => DottedBorder(
          color: Colors.black45,
          strokeWidth: 1.5,
          dashPattern: [6, 3],
          borderType: BorderType.RRect,
          radius: const Radius.circular(12),
          child: Container(
            width: double.infinity,
            height: 170,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppTheme.backgroundColor, // ✅ updated to use app theme background
              borderRadius: BorderRadius.circular(12),
            ),
            child: controller.images[index] == null
                ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/image (7).png',
                  width: 50,
                  height: 50,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 8),
                Text(
                  "Upload Image",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.black54),
                ),
              ],
            )
                : ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.file(
                File(controller.images[index]!.path),
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
        )),
      );
    }

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
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Upload Your Photos',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 8),
            Text(
              "Tap to replace, hold to reorder.",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(5),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1,
                ),
                itemCount: controller.images.length,
                itemBuilder: (context, index) => buildImageContainer(index),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, 'socialcircle'),
                child: Text(
                  "Next",
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
