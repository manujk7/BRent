import 'dart:io';
import 'package:brent/modules/home/model/allUsersModel.dart';
import 'package:brent/modules/home/model/createFlightModel.dart';
import 'package:brent/modules/home/model/homeModel.dart';
import 'package:brent/modules/login/model/userModel.dart';
import 'package:brent/modules/signUp/model/statesModel.dart';
import 'package:get/get.dart';
import 'commonMessageStatusModel.dart';

class ApiController extends GetConnect {
  final baseUrl = "http://gendeep.com/dev/brent/Data_v1/";

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

  /// API call to updatePassword
  Future<StatusMessageModel> updatePassword(
      String authCode, String oldPassword, String newPassword) async {
    final form = FormData({
      'auth_code': authCode,
      'old_password': oldPassword,
      'new_password': newPassword,
    });
    var response = await post("updatepassword", form);
    if (!response.status.isOk) {
      return Future.error("Something went wrong");
    } else {
      var data = response.body;
      print(data.toString());
      return statusMessageModelFromJson(response.body.toString());
    }
  }

  /// API call to getProfile
  Future<UserModel> getProfile(
      String authCode, String deviceType, String deviceId) async {
    final form = FormData({
      'auth_code': authCode,
      'device_type': deviceType,
      'device_id': deviceId,
    });
    var response = await post("getProfile", form);
    if (!response.status.isOk) {
      return Future.error("Something went wrong");
    } else {
      var data = response.body;
      print(data.toString());
      return userModelFromJson(response.body.toString());
    }
  }

  /// API call to updateProfile
  Future<UserModel> updateProfile(String authCode, String phone, String address,
      String city, String state, String zipCode) async {
    final form = FormData({
      'auth_code': authCode,
      'phone': phone,
      'address': address,
      'city': city,
      'state': state,
      'zipcode': zipCode,
    });
    var response = await post("updateProfile", form);
    if (!response.status.isOk) {
      return Future.error("Something went wrong");
    } else {
      var data = response.body;
      print(data.toString());
      return userModelFromJson(response.body.toString());
    }
  }

  /// API call to createFlight
  Future<CreateFlightModel> createFlight(
      String authCode,
      String from,
      String to,
      String flightDate,
      String timeOfDeparture,
      String timeOfArrival,
      String oneWaySwitch) async {
    final form = FormData({
      'auth_code': authCode,
      'from': from,
      'to': to,
      'flight_date': flightDate,
      'time_of_departure': timeOfDeparture,
      'time_of_arrival': timeOfArrival,
      'way': oneWaySwitch,
    });
    var response = await post("createFlight", form);
    if (!response.status.isOk) {
      return Future.error("Something went wrong");
    } else {
      var data = response.body;
      print(data.toString());
      return createFlightModelFromJson(response.body.toString());
    }
  }

  /// API call to updateProfilePic
  Future<UserModel> updateProfilePic(String authCode, File profilePic) async {
    final form = FormData({
      'auth_code': authCode,
      'profile_pic': MultipartFile(profilePic,
          filename: profilePic.path, contentType: "image/png")
    });
    print(form);
    var response = await post("updatefile", form);
    if (!response.status.isOk) {
      return Future.error("Something went wrong");
    } else {
      var data = response.body;
      print(data.toString());
      return userModelFromJson(response.body.toString());
    }
  }

  /// API call to register
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

  /// API call to homeData
  Future<HomeModel> home(String authCode) async {
    final form = FormData({
      'auth_code': authCode,
    });
    var response = await post("home", form);
    if (!response.status.isOk) {
      return Future.error("Something went wrong");
    } else {
      var data = response.body;
      print(data.toString());
      return homeModelFromJson(response.body.toString());
    }
  }

  /// API call to allUsers
  Future<AllUsersModel> getAllUsers(String authCode) async {
    final form = FormData({
      'auth_code': authCode,
    });
    var response = await post("getAllusers", form);
    if (!response.status.isOk) {
      return Future.error("Something went wrong");
    } else {
      var data = response.body;
      print(data.toString());
      return allUsersModelFromJson(response.body.toString());
    }
  }

  /// API call to allUsers
  Future<StatesModel> getAllStates() async {
    var response = await get("getState");
    if (!response.status.isOk) {
      return Future.error("Something went wrong");
    } else {
      var data = response.body;
      print(data.toString());
      return statesModelFromJson(response.body.toString());
    }
  }
}
