import 'package:brent/modules/login/model/userModel.dart';
import 'package:brent/services/apiController.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLoggedIn = true.obs;
  var isHidden = true.obs;
  var userModel = UserModel().obs;
  var showLoader = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void togglePasswordView() {
    isHidden.value = !isHidden.value;
  }

  Future<UserModel> login(String email, String password) async {
    // ApiController().loginUser(email, password).then((response) {
    //   userModel.value = response;
    //   update(); // use update() to update counter variable on UI when increment be called
    // });
    return userModel.value = await ApiController().loginUser(email, password);
  }


}
