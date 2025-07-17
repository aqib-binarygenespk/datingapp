import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadPhotosController extends GetxController {
  final ImagePicker picker = ImagePicker();
  var images = List<XFile?>.filled(6, null, growable: false).obs;

  Future<void> pickImage(int index) async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      images[index] = pickedImage;
      images.refresh(); // Force UI update
    }
  }
}
