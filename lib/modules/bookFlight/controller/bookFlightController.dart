import 'package:brent/modules/home/model/homeModel.dart';
import 'package:brent/services/apiController.dart';
import 'package:brent/services/commonMessageStatusModel.dart';
import 'package:brent/services/prefrences.dart';
import 'package:get/get.dart';

class BookFlightController extends GetxController {
  var showLoader = false.obs;
  final _prefs = SharedPrefs();
  var homeModel = HomeModel().obs;
  var bookingSuccessModel = StatusMessageModel().obs;
  var data = AllFlight().obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<HomeModel> getFlightData(String bookingId) async {
    showLoader.value = true;
    String auth = await _prefs.getAuthCode();
    homeModel.value = await ApiController().homeBookingId(auth, bookingId);
    data.value = homeModel().allFlight[0];
    showLoader.value = false;
    return homeModel.value;
  }

  Future<StatusMessageModel> bookingSuccess(String bookingId, String tokenId,
      String noOfSeats, String amount, String totalAmount) async {
    showLoader.value = true;
    String auth = await _prefs.getAuthCode();
    return bookingSuccessModel.value = await ApiController().bookingSuccess(
        auth, bookingId, tokenId, noOfSeats, amount, totalAmount);
  }
}
