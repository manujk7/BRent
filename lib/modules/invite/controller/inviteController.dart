import 'package:brent/modules/login/model/userModel.dart';
import 'package:brent/services/apiController.dart';
import 'package:brent/services/commonMessageStatusModel.dart';
import 'package:brent/services/prefrences.dart';
import 'package:get/get.dart';

class InviteController extends GetxController {
  var statusModel = StatusMessageModel().obs;
  var showLoader = false.obs;
  final _prefs = SharedPrefs();

  @override
  void onInit() {
    super.onInit();
  }

  Future<StatusMessageModel> createNotification(
      String email, String bookingId) async {
    String auth = await _prefs.getAuthCode();
    return statusModel.value =
        await ApiController().createNotification(auth, email, bookingId);
  }
}
