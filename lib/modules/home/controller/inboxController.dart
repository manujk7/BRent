import 'package:brent/modules/home/model/allUsersModel.dart';
import 'package:brent/services/apiController.dart';
import 'package:brent/services/commonMessageStatusModel.dart';
import 'package:brent/services/prefrences.dart';
import 'package:get/get.dart';

class InboxPageController extends GetxController {
  var getAllUsersModel = AllUsersModel().obs;
  final _prefs = SharedPrefs();
  var showLoader = false.obs;

  @override
  void onInit() {
    super.onInit();

  }

  Future<AllUsersModel> getAllUsersApi() async {
    String auth = await _prefs.getAuthCode();
    return getAllUsersModel.value = await ApiController().getAllUsers(auth);
  }
}
