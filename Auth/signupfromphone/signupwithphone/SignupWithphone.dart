import 'package:dating_app/Auth/signupfromphone/signupwithphone/signupwithphone_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../themesfolder/theme.dart';

class SignUpWithPhoneScreen extends StatefulWidget {
  const SignUpWithPhoneScreen({super.key});

  @override
  State<SignUpWithPhoneScreen> createState() => _SignUpWithPhoneScreenState();
}

class _SignUpWithPhoneScreenState extends State<SignUpWithPhoneScreen> {
  final SignUpPhoneController controller = Get.put(SignUpPhoneController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? localPhoneNumber;

  String? _validatePhone(String? number) {
    if (number == null || number.trim().isEmpty) {
      return 'Phone number is required';
    }
    if (!RegExp(r'^03[0-9]{9}$').hasMatch(number.trim())) {
      return 'Phone must start with 03 and be 11 digits long';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Sign-up with Phone",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "If you signed up with your phone number, please\nenter it to login",
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 30),

              // Intl phone field with flag support
              IntlPhoneField(
                controller: controller.phoneController,
                initialCountryCode: 'PK',
                decoration: InputDecoration(
                  hintText: "03xxxxxxxxx",
                  labelText: "Phone Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                ),
                onChanged: (phone) {
                  localPhoneNumber = phone.number;
                },
                validator: (phone) => _validatePhone(phone?.number),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    controller.sendCode();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF111827),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text("Send Code",style: TextStyle(
                  color: AppTheme.backgroundColor,
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
