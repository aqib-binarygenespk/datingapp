import 'package:get/get.dart';

class LoginWithEmailController extends GetxController {
  // Observables for email and password
  var email = ''.obs;
  var password = ''.obs;

  // Function to handle login
  void login() {
    if (email.value.isNotEmpty && password.value.isNotEmpty) {
      // Perform login logic here (e.g., API call)
      print('Logging in with Email: ${email.value}, Password: ${password.value}');
      Get.snackbar('Success', 'Login successful!');
    } else {
      Get.snackbar('Error', 'Please fill all fields');
    }
  }
}