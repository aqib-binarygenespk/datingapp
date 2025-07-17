import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dating_app/themesfolder/theme.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'addevent_controller.dart';

class AddEventScreen extends StatelessWidget {
  const AddEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AddEventController controller = Get.put(AddEventController());
    final TextEditingController inviteController = TextEditingController();
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Create A PairUp Event",
          style: AppTheme.textTheme.bodyLarge,
        ),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLabel("Name of the PairUp Event*", textTheme),
            TextField(
              controller: controller.nameController,
              style: textTheme.bodyMedium,
              decoration: _inputDecoration("Tap to Enter The Name", textTheme),
            ),
            const SizedBox(height: 15),

            _buildLabel("Location*", textTheme),
            TextField(
              controller: controller.locationController,
              style: textTheme.bodyMedium,
              decoration: _inputDecoration("Enter event location", textTheme),
            ),
            const SizedBox(height: 15),

            _buildLabel("Description", textTheme),
            TextField(
              controller: controller.descriptionController,
              style: textTheme.bodyMedium,
              maxLines: null, // ✅ allow multiline
              decoration: _inputDecoration("Enter event description", textTheme),
            ),
            const SizedBox(height: 15),

            _buildLabel("Time And Date*", textTheme),
            GestureDetector(
              onTap: () => controller.selectDateTime(context),
              child: Obx(() => Container(
                padding: const EdgeInsets.all(15),
                decoration: _inputBoxDecoration(),
                child: Text(
                  controller.selectedDateTime.value != null
                      ? DateFormat('MMM d, yyyy – hh:mm a').format(
                      controller.selectedDateTime.value!)
                      : "Select a date and time",
                  style: textTheme.bodySmall?.copyWith(
                    color: Colors.black54,
                  ),
                ),
              )),
            ),
            const SizedBox(height: 15),

            _buildLabel("Event Photo", textTheme),
            GestureDetector(
              onTap: () => _showImagePickerOptions(context, controller),
              child: Obx(() => Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppTheme.backgroundColor, // ✅ updated to app theme background color
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Color(0xFFD9D9D9), width: 1),
                ),
                child: controller.selectedImage.value == null
                    ? const Icon(Icons.add_a_photo,
                    size: 50, color: Colors.black54)
                    : ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(
                    controller.selectedImage.value!,
                    fit: BoxFit.cover,
                  ),
                ),
              )),
            ),

            const SizedBox(height: 15),

            _buildLabel("Invite People", textTheme),
            TextField(
              controller: inviteController,
              style: textTheme.bodyMedium,
              decoration: _inputDecoration("Tap to add more people", textTheme),
              onSubmitted: (value) {
                controller.addName(value);
                inviteController.clear();
              },
              onChanged: (value) {
                if (value.endsWith(" ")) {
                  controller.addName(value.trim());
                  inviteController.clear();
                }
              },
            ),
            const SizedBox(height: 10),

            Obx(() => Wrap(
              spacing: 6,
              children: controller.invitedPeople.map((name) {
                return Chip(
                  label: Text(name, style: textTheme.labelSmall),
                  deleteIcon: const Icon(Icons.close, size: 16),
                  onDeleted: () => controller.removeName(name),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(color: Colors.black26),
                  ),
                );
              }).toList(),
            )),

            const SizedBox(height: 30),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // ✅ updated to radius 8
                  ),
                ),
                child: const Text(
                  "Save",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.backgroundColor, // ✅ button text color
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text, TextTheme textTheme) {
    return Text(text,
        style: textTheme.labelLarge?.copyWith(color: Colors.black));
  }

  InputDecoration _inputDecoration(String hint, TextTheme textTheme) {
    return InputDecoration(
      hintText: hint,
      hintStyle: textTheme.bodySmall?.copyWith(color: Colors.black45),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8), // ✅ updated to radius 8
        borderSide: const BorderSide(color: Color(0xFFD9D9D9), width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8), // ✅ updated to radius 8
        borderSide: const BorderSide(color: Color(0xFFD9D9D9), width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8), // ✅ updated to radius 8
        borderSide: const BorderSide(color: Color(0xFFD9D9D9), width: 1),
      ),
      filled: true,
      fillColor: const Color(0xFFFFEFEF),
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
    );
  }

  BoxDecoration _inputBoxDecoration() {
    return BoxDecoration(
      color: const Color(0xFFFFEFEF),
      borderRadius: BorderRadius.circular(8), // ✅ updated to radius 8
      border: Border.all(color: const Color(0xFFD9D9D9), width: 1),
    );
  }

  void _showImagePickerOptions(
      BuildContext context, AddEventController controller) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from Gallery'),
              onTap: () {
                Get.back();
                controller.pickImage(ImageSource.gallery);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take a Picture'),
              onTap: () {
                Get.back();
                controller.pickImage(ImageSource.camera);
              },
            ),
          ],
        );
      },
    );
  }
}
