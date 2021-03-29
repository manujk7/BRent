import 'dart:io';

import 'package:brent/modules/profile/view/components/profile.dart';
import 'package:brent/services/apiController.dart';
import 'package:brent/services/commonMessageStatusModel.dart';
import 'package:brent/services/prefrences.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var isLoggedIn = true.obs;
  File imageFile;
  var state = AppState.free.obs;
  var updatePasswordModel = StatusMessageModel().obs;
  final _prefs = SharedPrefs();
  var showLoader = false.obs;
  var showLoaderPic = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<StatusMessageModel> updatePassword(
      String oldPassword, String newPassword) async {
    String auth = await _prefs.getAuthCode();
    return updatePasswordModel.value =
        await ApiController().updatePassword(auth, oldPassword, newPassword);
  }
}
