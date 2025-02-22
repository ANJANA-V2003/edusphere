import 'package:get/get.dart';

class LoginController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;

  // Function to handle login
  void login() {
    if (username.value.isNotEmpty && password.value.isNotEmpty) {
      // Implement login functionality here, e.g., API calls.
      print('Logging in with: $username, $password');
    } else {
      print('Please enter both username and password');
    }
  }
}