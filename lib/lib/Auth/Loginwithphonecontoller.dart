import 'package:get/get.dart';

class LoginWithPhoneController extends GetxController {
  // Observable for phone number
  var phoneNumber = ''.obs;

  // Function to handle sending code
  void sendCode() {
    if (phoneNumber.value.isNotEmpty) {
      // Perform login logic here (e.g., API call)
      print('Sending code to Phone Number: ${phoneNumber.value}');
      Get.snackbar('Success', 'Code sent successfully!');

      // Navigate to the code verification screen
      Get.toNamed('/verification-code');
    } else {
      Get.snackbar('Error', 'Please enter a valid phone number');
    }
  }
}