import 'package:brent/modules/login/model/userModel.dart';
import 'package:brent/services/apiController.dart';
import 'package:brent/services/commonMessageStatusModel.dart';
import 'package:brent/services/prefrences.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isLoggedIn = true.obs;
  var selectedIndex = 1.obs;
  var isSwitched = false.obs;
  var expandFlag = false.obs;
  var logoutModel = StatusMessageModel().obs;
  final _prefs = SharedPrefs();
  var showLoader = false.obs;
  var getProfile = Profile().obs;
  var prefs = SharedPrefs();
  var totalPrice = 7500.obs;
  var ticketAmount = 7500;

  onItemTapped(int index) {
    selectedIndex.value = index;
    update();
  }

  onLayoutCollapsed(bool value) {
    expandFlag.value = !value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getProfileData();
  }

  getProfileData() async {
    getProfile.value = await prefs.getProfile();
    if (getProfile.value != null) {
      print(getProfile().name);
    }
  }

  Future<StatusMessageModel> logout() async {
    String auth = await _prefs.getAuthCode();
    return logoutModel.value = await ApiController().logout(auth);
  }

  updateData(int value) {
    totalPrice.value = ticketAmount * value;
    print(totalPrice.value);
  }
}
