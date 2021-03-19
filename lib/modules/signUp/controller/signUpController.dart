import 'package:get/get.dart';

class SignUpController extends GetxController {
  var isLoggedIn = true.obs;
  var isHidden = true.obs;
  var isHiddenConfirm = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void togglePasswordView() {
    isHidden.value = !isHidden.value;
  }

  void toggleConfirmPasswordView() {
    isHiddenConfirm.value = !isHiddenConfirm.value;
  }
}
