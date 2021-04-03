import 'dart:io';

import 'package:brent/modules/home/model/homeModel.dart';
import 'package:brent/modules/profile/view/components/profile.dart';
import 'package:brent/modules/shareApp/model/shareAppModel.dart';
import 'package:brent/modules/signUp/model/statesModel.dart';
import 'package:brent/services/apiController.dart';
import 'package:brent/services/commonMessageStatusModel.dart';
import 'package:brent/services/prefrences.dart';
import 'package:get/get.dart';

class BookFlightController extends GetxController {
  var showLoader = false.obs;
  final _prefs = SharedPrefs();
  var homeModel = HomeModel().obs;
  var data = AllFlight().obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<HomeModel> getFlightData() async {
    showLoader.value = true;
    String auth = await _prefs.getAuthCode();
    homeModel.value = await ApiController().home(auth);
    data.value = homeModel().allFlight[0];
    showLoader.value = false;
    return homeModel.value;
  }
}
