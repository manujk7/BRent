import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLoggedIn = true.obs;
  var isHidden = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void togglePasswordView() {
    isHidden.value = !isHidden.value;
  }
}
