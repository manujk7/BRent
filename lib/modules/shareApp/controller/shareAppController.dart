import 'dart:io';

import 'package:brent/modules/profile/view/components/profile.dart';
import 'package:brent/modules/shareApp/model/shareAppModel.dart';
import 'package:brent/modules/signUp/model/statesModel.dart';
import 'package:brent/services/apiController.dart';
import 'package:brent/services/commonMessageStatusModel.dart';
import 'package:brent/services/prefrences.dart';
import 'package:get/get.dart';

class ShareAppController extends GetxController {
  var showLoader = false.obs;
  final _prefs = SharedPrefs();
  var shareCodeModel = ShareAppModel().obs;
  var code = "".obs;

  @override
  void onInit() {
    generateShareCode();
    super.onInit();
  }

  Future<ShareAppModel> generateShareCode() async {
    String auth = await _prefs.getAuthCode();
    shareCodeModel.value = await ApiController().getShareCode(auth);
    if (shareCodeModel().status == "true") {
      code.value = shareCodeModel().code.toString();
    }
    return shareCodeModel.value;
  }
}
