import 'package:get/get.dart';

class PetsSelectionController extends GetxController {
  var selectedOption = ''.obs;

  final List<String> options = [
    "No Pets",
    "Dog Lover",
    "Cat Enthusiast",
    "Both Cats and Dogs",
    "Small Pet Parent (Rabbits, Hamsters, etc.)",
    "Exotic Animals (Birds, Reptiles, etc.)",
    "Open to Pets",
    "Allergic, but Love Animals"
  ];

  void selectOption(String option) {
    selectedOption.value = option;
  }
}
