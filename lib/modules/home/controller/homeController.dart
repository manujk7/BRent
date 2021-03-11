import 'package:get/get.dart';

class HomeController extends GetxController {
  var isLoggedIn = true.obs;
  var selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void onItemTapped(int index) {
    selectedIndex = index.obs;
    update();
  }
}