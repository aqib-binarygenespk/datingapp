import 'package:dating_app/Auth/signupfromphone/personaldetails/personaldetails_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dating_app/themesfolder/dropdown.dart';
import 'package:dating_app/themesfolder/textfields.dart';

import '../../../themesfolder/theme.dart';


class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileDetailsController controller = Get.put(ProfileDetailsController());

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sign up",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 25),
                     Text(
                      "First Name",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 8),
                    CustomTextField(

                      hintText: "Enter your first name",
                      keyboardType: TextInputType.text,
                      controller: controller.firstNameController,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Last Name",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(

                      hintText: "Enter your last name",
                      keyboardType: TextInputType.text,
                      controller: controller.lastNameController,
                    ),
                    const SizedBox(height: 16),
                    Obx(() => CustomDropdown(
                      label: "Gender",
                      options: controller.genderOptions,
                      selectedValue: controller.selectedGender.value.isEmpty
                          ? null
                          : controller.selectedGender.value,
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          controller.selectedGender.value = newValue;
                        }
                      },
                      hintText: "Select your gender",
                    )),
                    const SizedBox(height: 16),
                    const Text(
                      "Age",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(

                      hintText: "Enter your age",
                      keyboardType: TextInputType.number,
                      controller: controller.ageController,
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              if (controller.formKey.currentState!.validate()) {
                Navigator.popAndPushNamed(context, '/height');
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF111827),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text("Next", style: TextStyle(fontSize: 16)),
          ),
        ),
      ),
    );
  }
}
