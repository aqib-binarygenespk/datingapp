import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';

class UploadYourPhotosScreen extends StatefulWidget {
  @override
  _UploadYourPhotosScreenState createState() => _UploadYourPhotosScreenState();
}

class _UploadYourPhotosScreenState extends State<UploadYourPhotosScreen> {
  final ImagePicker _picker = ImagePicker();
  List<XFile?> images = List<XFile?>.filled(6, null, growable: false);

  Future<void> pickImage(int index) async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      images[index] = pickedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE6E6), // Background color matching design
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Upload Your Photos',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              "Tap to replace, hold to reorder.",
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => pickImage(index),
                    child: DottedBorder(
                      color: Colors.black26,
                      strokeWidth: 1,
                      dashPattern: [8, 4], // Creates a dashed effect
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.all(43.5), // Padding inside the dotted border
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: images[index] == null
                            ? const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.image, size: 50, color: Colors.black54),
                            SizedBox(height: 8),
                            Text("Upload Image", style: TextStyle(color: Colors.black54)),
                          ],
                        )
                            : ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            File(images[index]!.path),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Add your next button functionality
                  Navigator.pushNamed(context, 'socialcircle');
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
