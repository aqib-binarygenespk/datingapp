import 'package:get/get.dart';

class HeightSelectionController extends GetxController {
  var heightInInches = 60.0.obs; // Default height (5 feet)

  String get heightInFeetAndInches {
    final int feet = (heightInInches.value ~/ 12).toInt();
    final int inches = (heightInInches.value % 12).toInt();
    return "$feet' $inches\"";
  }

  void updateHeight(double value) {
    heightInInches.value = value;
  }
}
