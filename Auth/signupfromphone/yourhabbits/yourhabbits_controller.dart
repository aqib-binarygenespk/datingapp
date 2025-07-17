import 'package:get/get.dart';

class HabitsController extends GetxController {
  var smokingHabit = 'Non-Smoker'.obs;
  var drinkingHabit = 'Non-Drinker'.obs;
  var dietaryPreference = 'Omnivore'.obs;

  void updateSmoking(String value) => smokingHabit.value = value;
  void updateDrinking(String value) => drinkingHabit.value = value;
  void updateDiet(String value) => dietaryPreference.value = value;
}
