import 'dart:io';
import 'dart:ui';
import 'package:dating_app/themesfolder/Alertmessages.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RecordVideoScreen extends StatefulWidget {
  const RecordVideoScreen({Key? key}) : super(key: key);

  @override
  State<RecordVideoScreen> createState() => _RecordVideoScreenState();
}

class _RecordVideoScreenState extends State<RecordVideoScreen> {
  File? _videoFile; // To store the selected or recorded video
  final ImagePicker _picker = ImagePicker();

  void _showUploadDialog(BuildContext context) {
    CustomAlert.show(
      context,
      title: "Update Video",
      message: "Clip must be less than 60 sec long.",
      onPressed: () {
        Navigator.pop(context);
        _pickVideo();
      },
      buttonText: "Upload Video",
    );
  }

  Future<void> _pickVideo() async {
    final XFile? pickedFile = await _picker.pickVideo(
      source: ImageSource.camera,
      maxDuration: const Duration(seconds: 60),
    );

    if (pickedFile != null) {
      setState(() {
        _videoFile = File(pickedFile.path);
      });
    }
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
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Record Your Video',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Questions:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '1. How do you make new people feel welcome in a group setting?',
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
            const SizedBox(height: 24),
            // Dashed Border Video Container
            Expanded(
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    _showUploadDialog(context);
                  },
                  child: CustomPaint(
                    painter: DashedBorderPainter(),
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                      ),
                      child: _videoFile != null
                          ? Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            'assets/video_thumbnail_placeholder.png',
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                          const Icon(
                            Icons.play_circle_outline,
                            size: 50,
                            color: Colors.white,
                          ),
                        ],
                      )
                          : const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.videocam_outlined,
                              size: 50, color: Colors.black),
                          SizedBox(height: 8),
                          Text(
                            'Record Video',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/uploadphoto');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF111827),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Upload Video',
                  style: TextStyle(color: Colors.white, fontSize: 16),
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

// Custom Painter for Dashed Border
class DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const double dashWidth = 6, dashSpace = 4, strokeWidth = 1.5;
    final Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        const Radius.circular(16),
      ));

    // Draw dashed border
    Path dashPath = Path();
    for (PathMetric pathMetric in path.computeMetrics()) {
      double distance = 0.0;
      while (distance < pathMetric.length) {
        final next = distance + dashWidth;
        dashPath.addPath(
          pathMetric.extractPath(distance, next),
          Offset.zero,
        );
        distance = next + dashSpace;
      }
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
