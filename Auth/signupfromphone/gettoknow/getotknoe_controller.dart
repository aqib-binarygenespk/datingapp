import 'package:get/get.dart';

class GetToKnowMeController extends GetxController {
  var selectedOption = (-1).obs;

  final List<String> options = [
    "Why do you think a double date is better than a one-on-one first date?",
    "What’s your favorite way to spend a weekend with friends?",
    "How do you make new people feel welcome in a group setting?",
    "What’s a shared activity you think is perfect for a double date?",
    "Describe your ideal group outing.",
    "What’s your go-to game or activity for breaking the ice with new friends?",
    "If you could plan the ultimate double date, what would it look like?",
    "What’s a fun fact about you that people might not guess?",
  ];

  void selectOption(int index) {
    selectedOption.value = index;
  }
}
