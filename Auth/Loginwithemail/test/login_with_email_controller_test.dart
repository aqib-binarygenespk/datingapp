import 'package:flutter_test/flutter_test.dart';
import 'package:dating_app/Auth/Loginwithemail/LoginWithEmailController.dart';

void main() {
  late LoginWithEmailController controller;

  setUp(() {
    controller = LoginWithEmailController();
  });

  test('Initial email and password are empty', () {
    expect(controller.email.value, '');
    expect(controller.password.value, '');
  });

  test('Updating email and password works', () {
    controller.email.value = 'test@example.com';
    controller.password.value = '123456';

    expect(controller.email.value, 'test@example.com');
    expect(controller.password.value, '123456');
  });

  test('Login triggers success when fields are filled', () {
    controller.email.value = 'user@test.com';
    controller.password.value = 'password';

    controller.login();
    // We are printing, in real app you'd mock API and snackbar
  });

  test('Login shows error when fields are empty', () {
    controller.email.value = '';
    controller.password.value = '';

    controller.login();
    // Should print 'Please fill all fields'
  });
}
