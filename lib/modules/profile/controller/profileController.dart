import 'dart:io';

import 'package:brent/modules/profile/view/components/profile.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  var isLoggedIn = true.obs;
  File imageFile;
  var state = AppState.free.obs;

  @override
  void onInit() {
    super.onInit();
  }
}
