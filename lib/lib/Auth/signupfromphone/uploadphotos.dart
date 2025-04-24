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

  Widget buildImageContainer(int index) {
    return GestureDetector(
      onTap: () => pickImage(index),
      child: DottedBorder(
        color: Colors.black45, // Darker color for better visibility
        strokeWidth: 1.5, // Slightly thicker border
        dashPattern: [6, 3], // Adjust dash pattern for better aesthetics
        borderType: BorderType.RRect,
        radius: const Radius.circular(12),
        child: Container(
          width: double.infinity,
          height: 170, // Ensuring a uniform size
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
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
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover, // Ensuring the image fills the box
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE6E6), // Light pink background
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
              'Upload Your Photos',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 8),
            const Text("Tap to replace, hold to reorder.", style: TextStyle(color: Colors.black54)),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(5), // Maintain proper spacing
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1, // Ensuring square boxes
                ),
                itemCount: images.length,
                itemBuilder: (context, index) => buildImageContainer(index),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, 'socialcircle'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
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
