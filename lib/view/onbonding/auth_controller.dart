import 'package:get/get.dart';

class AuthController extends GetxController {
  var isSignUp = true.obs;

  void toggleForm() {
    isSignUp.value = !isSignUp.value;
  }

  void setSignUp(bool value) {
    isSignUp.value = value;
  }
}
