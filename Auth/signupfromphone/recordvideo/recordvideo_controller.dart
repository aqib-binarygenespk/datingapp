import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:path_provider/path_provider.dart';

class RecordVideoController extends GetxController {
  var videoFile = Rxn<File>();
  var thumbnailPath = RxnString();
  final ImagePicker picker = ImagePicker();

  void showUploadDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text("Update Video", style: Theme.of(context).textTheme.titleLarge),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Clip must be less than 60 sec long.", style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Cancel", style: Theme.of(context).textTheme.bodyMedium),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      pickVideo();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text("Upload Video", style: Theme.of(context).textTheme.bodySmall),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> pickVideo() async {
    final XFile? pickedFile = await picker.pickVideo(
      source: ImageSource.camera,
      maxDuration: const Duration(seconds: 60),
    );

    if (pickedFile != null) {
      videoFile.value = File(pickedFile.path);
      await generateThumbnail(pickedFile.path);
    }
  }

  Future<void> generateThumbnail(String videoPath) async {
    final thumb = await VideoThumbnail.thumbnailFile(
      video: videoPath,
      thumbnailPath: (await getTemporaryDirectory()).path,
      imageFormat: ImageFormat.PNG,
      maxHeight: 180,
      quality: 75,
    );
    if (thumb != null) {
      thumbnailPath.value = thumb;
    }
  }
}
