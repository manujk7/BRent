import 'package:get/get.dart';

class HomeController extends GetxController {
  var isLoggedIn = true.obs;
  var selectedIndex = 1.obs;
  var isSwitched = false.obs;

  onItemTapped(int index) {
    selectedIndex.value = index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
