import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileDetailsController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  var selectedGender = ''.obs;

  final List<String> genderOptions = [
    'Male',
    'Female',
    'Non-binary/Intersex',
    'Prefer not to respond'
  ];

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    ageController.dispose();
    super.onClose();
  }
}
