import 'dart:io';

import 'package:brent/modules/home/model/airportCodesModel.dart';
import 'package:brent/modules/home/model/createFlightModel.dart';
import 'package:brent/modules/home/model/homeModel.dart';
import 'package:brent/modules/login/model/userModel.dart';
import 'package:brent/services/apiController.dart';
import 'package:brent/services/commonMessageStatusModel.dart';
import 'package:brent/services/prefrences.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;
  var isLoggedIn = true.obs;

  // var selectedIndex = 1.obs;
  var isSwitched = false.obs;
  var expandFlag = false.obs;
  var logoutModel = StatusMessageModel().obs;
  var homeModel = HomeModel().obs;
  var userModel = UserModel().obs;
  var createFlightModel = CreateFlightModel().obs;
  final _prefs = SharedPrefs();
  var showLoader = false.obs;
  var showHomeLoader = false.obs;
  var showLoaderCreate = false.obs;
  var getProfile = Profile().obs;
  var totalPrice = 1.obs;
  var ticketAmount = 1;
  var airportCodesModel = AirportCodesModel().obs;
  var airportCodesModelFrom = AirportCodesModel().obs;

  onLayoutCollapsed(bool value) {
    expandFlag.value = !value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getProfileData();
    getSelectedFlight("");
  }

  void changeRoute() {
    selectedIndex.value = 0;
  }

  getProfileData() async {
    getProfile.value = await _prefs.getProfile();
    if (getProfile.value != null) {
      print(getProfile().name);
    }
  }

  Future<StatusMessageModel> logout() async {
    String auth = await _prefs.getAuthCode();
    return logoutModel.value = await ApiController().logout(auth);
  }

  Future<HomeModel> home() async {
    String auth = await _prefs.getAuthCode();
    return homeModel.value = await ApiController().home(auth);
  }

  Future<CreateFlightModel> createFlight(
      String from,
      String to,
      String flightDate,
      String timeOfDeparture,
      String timeOfArrival,
      String oneWaySwitch,
      String price,
      String nSeats) async {
    String auth = await _prefs.getAuthCode();
    return createFlightModel.value = await ApiController().createFlight(
        auth,
        from,
        to,
        flightDate,
        timeOfDeparture,
        timeOfArrival,
        oneWaySwitch,
        price,
        nSeats);
  }

  Future<UserModel> getProfileApi(String deviceType, String deviceId) async {
    String auth = await _prefs.getAuthCode();
    print(auth);
    return userModel.value =
        await ApiController().getProfile(auth, deviceType, deviceId);
  }

  Future<UserModel> updateProfile(
    String phone,
    String address,
    String city,
    String state,
    String zipCode,
  ) async {
    String auth = await _prefs.getAuthCode();
    return userModel.value = await ApiController()
        .updateProfile(auth, phone, address, city, state, zipCode);
  }

  Future<UserModel> updateProfilePic(File profilePic) async {
    String auth = await _prefs.getAuthCode();

    return userModel.value =
        await ApiController().updateProfilePic(auth, profilePic);
  }

  updateData(int value) {
    totalPrice.value = ticketAmount * value;
    print(totalPrice.value);
  }

  Future<AirportCodesModel> getSelectedFlight(String fromTo) async {
    return airportCodesModel.value =
        await ApiController().getSelectedFlight(fromTo);
  }

  Future<AirportCodesModel> getSelectedFlightFrom(String fromTo) async {
    return airportCodesModelFrom.value =
        await ApiController().getSelectedFlight(fromTo);
  }
}
