import 'dart:convert';

import 'package:brent/modules/login/model/userModel.dart';
import 'package:get/get.dart';

import 'commonMessageStatusModel.dart';

class ApiController extends GetConnect {
  final baseUrl = "http://gendeep.com/dev/brent/Data_v1/";

  /// API call to get currency conversion
// Future<Currency> getCurrencyValues(String base, List<String> compares) async {
//   String currencies = compares.join(',');
//   print("CURR: $currencies");
//   var response = await get("base=$base&symbols=$currencies");
//   if (response.status.hasError) {
//     return Future.error(response.statusText);
//   } else {
//     var data = response.body;
//     print(data.toString());
//     var result = jsonEncode(data);
//     return currencyFromJson(result.toString());
//   }
// }
//

  /// API call to login
  Future<UserModel> loginUser(String email, String password) async {
    final form = FormData({
      'email': email,
      'password': password,
    });
    var response = await post("login", form);
    if (!response.status.isOk) {
      return Future.error("Something went wrong");
    } else {
      var data = response.body;
      print(data.toString());
      return userModelFromJson(response.body.toString());
    }
  }

  /// API call to login
  Future<UserModel> registerUser(
      String name,
      String email,
      String phone,
      String password,
      String confirmPassword,
      String address,
      String city,
      String state,
      String zipCode,
      String referCode) async {
    final form = FormData({
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'confirm_password': confirmPassword,
      'address': address,
      'city': city,
      'state': state,
      'zipcode': zipCode,
      "refer_code": referCode
    });
    var response = await post("register", form);
    if (!response.status.isOk) {
      return Future.error("Something went wrong");
    } else {
      var data = response.body;
      print(data.toString());
      return userModelFromJson(response.body.toString());
    }
  }

  /// API call to logout
  Future<StatusMessageModel> logout(String authCode) async {
    final form = FormData({
      'auth_code': authCode,
    });
    var response = await post("logout", form);
    if (!response.status.isOk) {
      return Future.error("Something went wrong");
    } else {
      var data = response.body;
      print(data.toString());
      return statusMessageModelFromJson(response.body.toString());
    }
  }
}
