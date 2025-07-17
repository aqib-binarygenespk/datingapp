import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventDetailsController extends GetxController {
  final TextEditingController nameController = TextEditingController();

  var invitedPeople = <String>[].obs;
  var selectedDateTime = Rxn<DateTime>();

  void addName(String name) {
    if (name.isNotEmpty && invitedPeople.length < 5) {
      invitedPeople.add(name);
      nameController.clear();
    }
  }

  void removeName(String name) {
    invitedPeople.remove(name);
  }

  Future<void> selectDateTime(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        selectedDateTime.value = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
      }
    }
  }
}
