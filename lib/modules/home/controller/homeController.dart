import 'package:get/get.dart';

class HomeController extends GetxController {
  var isLoggedIn = true.obs;
  var selectedIndex = 1.obs;
  var isSwitched = false.obs;
  var expandFlag = false.obs;

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
  }
}
