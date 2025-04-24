import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SocialCirclePhotoScreen extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();
  XFile? selectedImage;

  Future<void> pickImage(BuildContext context) async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => SocialCirclePhotoScreen(selectedImage: pickedImage),
        ),
      );
    }
  }

  SocialCirclePhotoScreen({Key? key, this.selectedImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE6E6),
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
            const Text(
              'Social Circle Photo',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "This photo will be used exclusively for Social Circle chats and friend requests.",
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 50),
            GestureDetector(
              onTap: () => pickImage(context),
              child: DottedBorder(
                color: Colors.black26,
                strokeWidth: 1,
                dashPattern: [8, 4], // Creates a dashed effect
                borderType: BorderType.RRect,
                radius: const Radius.circular(12),
                child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: selectedImage == null
                    ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.image, size: 50, color: Colors.black54),
                    SizedBox(height: 8),
                    Text("Upload Image", style: TextStyle(color: Colors.black54)),
                  ],
                )
                    : ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(
                    File(selectedImage!.path),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Add your next button functionality
                  Navigator.pushNamed(context, '/bonding');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text("Next"),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}