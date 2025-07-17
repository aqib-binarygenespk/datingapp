import 'package:get/get.dart';

class AttachmentsController extends GetxController {
  final List<String> attachments = [
    'Secure',
    'Anxious',
    'avoidant',
    'Disorganized',
  ];

  var selectedAttachments = <String>[].obs;

  void onAttachmentSelected(String attachment) {
    if (selectedAttachments.contains(attachment)) {
      selectedAttachments.remove(attachment);
    } else {
      if (selectedAttachments.length < 1) {
        selectedAttachments.add(attachment);
      }
    }
  }
}
