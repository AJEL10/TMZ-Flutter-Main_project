import 'package:get/get.dart';
import 'package:mainproject/view/home_screen.dart';

class LoginController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;

  final String correctUsername = 'admin';
  final String correctPassword = 'abcd';

  void validateLogin() {
    if (username.value == correctUsername &&
        password.value == correctPassword) {
      Get.snackbar('Success', 'Logged in successfully!');
      Get.off(
        () => const ScreenHome(),
      );
    } else {
      Get.snackbar('Oops', 'Login failed!');
    }
  }
}
