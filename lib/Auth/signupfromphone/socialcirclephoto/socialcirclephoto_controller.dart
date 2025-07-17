import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SocialCirclePhotoController extends GetxController {
  final ImagePicker picker = ImagePicker();
  var selectedImage = Rxn<File>();

  Future<void> pickImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      selectedImage.value = File(pickedImage.path);
    }
  }
}
