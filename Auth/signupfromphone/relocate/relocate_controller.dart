import 'package:get/get.dart';

class RelocateLoveController extends GetxController {
  final List<String> relocateOptions = [
    'Yes, open to relocating',
    'Maybe, depends on the situation',
    'No, prefer staying in my area',
  ];

  var selectedRelocateOptions = <String>[].obs;

  void toggleOption(String option) {
    if (selectedRelocateOptions.contains(option)) {
      selectedRelocateOptions.remove(option);
    } else {
      selectedRelocateOptions.value = [option]; // Only one option allowed
    }
  }
}
