import 'package:brent/modules/login/model/userModel.dart';
import 'package:brent/modules/signUp/model/statesModel.dart';
import 'package:brent/services/apiController.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  var isLoggedIn = true.obs;
  var isHidden = true.obs;
  var isHiddenConfirm = true.obs;
  var showLoader = false.obs;
  var userModel = UserModel().obs;
  var statesModel = StatesModel().obs;

  @override
  void onInit() {
    super.onInit();
    getAllStates();
  }

  void togglePasswordView() {
    isHidden.value = !isHidden.value;
  }

  void toggleConfirmPasswordView() {
    isHiddenConfirm.value = !isHiddenConfirm.value;
  }

  Future<UserModel> registerUser(
      String name,
      String email,
      String phone,
      String password,
      String confirmPassword,
      String address,
      String city,
      String state,
      String zipCode,
      String referCode) async {
    return userModel.value = await ApiController().registerUser(
        name,
        email,
        phone,
        password,
        confirmPassword,
        address,
        city,
        state,
        zipCode,
        referCode);
  }

  Future<StatesModel> getAllStates() async {
    return statesModel.value = await ApiController().getAllStates();
  }
}
