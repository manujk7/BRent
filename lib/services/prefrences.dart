import 'dart:convert';

import 'package:brent/modules/login/model/userModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  final String _auth = "auth_code";
  final String _profile = "profile";

  /// ------------------------------------------------------------
  /// Method that returns the user authCode to hit web service
  /// ------------------------------------------------------------
  Future<String> getAuthCode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_auth) ?? "";
  }

  Future<bool> login() async {
    // Simulate a future for response after 2 second.
    String auth = await getAuthCode();
    if (auth.isNotEmpty) {
      return true;
    }
    return false;
  }

  /// ------------------------------------------------------------
  /// Method that save the user Auth
  /// ------------------------------------------------------------
  Future<bool> setAuthCode(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_auth, value);
  }


  /// ------------------------------------------------------------
  /// Method that save the user Profile
  /// ------------------------------------------------------------
  Future<bool> saveProfile(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_profile, value);
  }


  /// ------------------------------------------------------------
  /// Method that get user Profile
  /// ------------------------------------------------------------
  Future<Profile> getProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String profile = prefs.getString(_profile) ?? "";
    return profile == "" ? null : Profile.fromJson(jsonDecode(profile));
  }

  /// ------------------------------------------------------------
  /// Method that clear user Profile
  /// ------------------------------------------------------------
  Future<bool> clearPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }
}
