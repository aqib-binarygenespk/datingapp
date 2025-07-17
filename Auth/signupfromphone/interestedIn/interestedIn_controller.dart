import 'package:get/get.dart';

class InterestedInController extends GetxController {
  var selectedInterest = 'Male'.obs;

  void updateInterest(String value) {
    selectedInterest.value = value;
  }
}
