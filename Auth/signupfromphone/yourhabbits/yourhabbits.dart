import 'package:dating_app/Auth/signupfromphone/yourhabbits/yourhabbits_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../themesfolder/theme.dart';

class GetToKnowYourHabitsScreen extends StatelessWidget {
  const GetToKnowYourHabitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HabitsController controller = Get.put(HabitsController());

    Widget buildRadioGroup({
      required String title,
      required List<String> options,
      required RxString groupValue,
      required Function(String) onChanged,
    }) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          ...options.map((option) => Obx(() => RadioListTile<String>(
            title: Text(
              option,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            value: option,
            groupValue: groupValue.value,
            onChanged: (value) => onChanged(value!),
            activeColor: Colors.black, // Use black instead of default blue
            contentPadding: EdgeInsets.zero,
          ))).toList(),
          const SizedBox(height: 20),
        ],
      );
    }

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Let's Get to Know Your Habits",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 8),
            Text(
              "These details help us match you with someone whose habits align with yours.",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 20),

            buildRadioGroup(
              title: "1. Smoking Habits:",
              options: ["Non-Smoker", "Occasional Smoker", "Regular Smoker"],
              groupValue: controller.smokingHabit,
              onChanged: controller.updateSmoking,
            ),

            buildRadioGroup(
              title: "2. Drinking Habits:",
              options: ["Non-Drinker", "Social Drinker", "Regular Drinker"],
              groupValue: controller.drinkingHabit,
              onChanged: controller.updateDrinking,
            ),

            buildRadioGroup(
              title: "3. Dietary Preferences:",
              options: [
                "Omnivore",
                "Vegetarian",
                "Vegan",
                "Gluten-Free",
                "Pescatarian",
                "Other"
              ],
              groupValue: controller.dietaryPreference,
              onChanged: controller.updateDiet,
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/lovelanguage');
                },
                child: Text("Next", style: Theme.of(context).textTheme.labelLarge),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
