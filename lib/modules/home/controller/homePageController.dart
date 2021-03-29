import 'package:brent/modules/home/model/homeModel.dart';
import 'package:brent/modules/login/model/userModel.dart';
import 'package:brent/services/apiController.dart';
import 'package:brent/services/prefrences.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  var isLoggedIn = true.obs;
  var isHidden = true.obs;
  var userModel = UserModel().obs;
  var showLoader = false.obs;
  var showHomeLoader = false.obs;
  var expandFlag = false.obs;
  var homeModel = HomeModel().obs;
  final _prefs = SharedPrefs();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> hitHomeApi() async {
    showHomeLoader.value = true;
    homeModel.value = await home();
    if (homeModel().status == "true") {
      showHomeLoader.value = false;
    } else {
      showHomeLoader.value = false;
      Get.snackbar("Error", "Please check connection");
    }
  }

  onLayoutCollapsed(bool value) {
    expandFlag.value = !value;
    update();
  }

  Future<HomeModel> home() async {
    String auth = await _prefs.getAuthCode();
    return homeModel.value = await ApiController().home(auth);
  }
}
