import 'package:get/get.dart';

class LoveLanguagesController extends GetxController {
  final List<String> loveLanguages = [
    'Words of Affirmation',
    'Acts of Service',
    'Receiving Gifts',
    'Quality Time',
    'Physical Touch',
  ];

  var selectedLanguages = <String>[].obs;

  void toggleLanguage(String language) {
    if (selectedLanguages.contains(language)) {
      selectedLanguages.remove(language);
    } else {
      if (selectedLanguages.length < 2) {
        selectedLanguages.add(language);
      }
    }
  }
}
