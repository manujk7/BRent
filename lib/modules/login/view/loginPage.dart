import 'dart:convert';

import 'package:brent/extras/constants.dart';
import 'package:brent/modules/home/view/components/home.dart';
import 'package:brent/modules/login/controller/loginController.dart';
import 'package:brent/modules/login/model/userModel.dart';
import 'package:brent/modules/signUp/view/components/signUpPage.dart';
import 'package:brent/services/prefrences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final LoginController _controller = Get.find();
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
  final focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Log in",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: blue),
      ),
      backgroundColor: background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: Get.width,
            margin: EdgeInsets.fromLTRB(0.0, 24.0, 0.0, 16.0),
            child: Column(
              children: [
                Material(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  color: white,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
                    child: Column(
                      children: [
                        Image.asset(
                          logoImage,
                          height: 200.0,
                        ),
                        SizedBox(
                          height: spacing * 1 / 2,
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextField(
                                textAlign: TextAlign.start,
                                controller: emailController,
                                onSubmitted: (v) {
                                  FocusScope.of(context).requestFocus(focus);
                                },
                                keyboardType: TextInputType.emailAddress,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: "Email address",
                                  hintStyle: TextStyle(fontSize: 16),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: BorderSide(
                                      width: 0.1,
                                      style: BorderStyle.solid,
                                      color: borderBg,
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.all(20),
                                ),
                              ),
                              SizedBox(
                                height: spacing,
                              ),
                              Obx(
                                () => TextField(
                                  textAlign: TextAlign.start,
                                  keyboardType: TextInputType.text,
                                  focusNode: focus,
                                  controller: passwordController,
                                  textAlignVertical: TextAlignVertical.center,
                                  obscureText: _controller.isHidden.value,
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    hintStyle: TextStyle(fontSize: 16),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          width: 0.5,
                                          style: BorderStyle.none,
                                          color: lightGrey),
                                    ),
                                    contentPadding: EdgeInsets.all(20),
                                    suffix: InkWell(
                                      onTap: _controller.togglePasswordView,
                                      child: Icon(
                                        _controller.isHidden.value
                                            ? Icons.visibility_off_outlined
                                            : Icons.visibility_rounded,
                                        color: blue,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: spacing * 1,
                        ),
                        Container(
                          width: Get.width,
                          height: 56.0,
                          decoration: new BoxDecoration(
                            color: blue,
                            border: new Border.all(color: blue, width: 2.0),
                            borderRadius: new BorderRadius.circular(6.0),
                          ),
                          child: Obx(
                            () => InkWell(
                              onTap: () {
                                !_controller.showLoader.value
                                    ? loginLogic()
                                    : null;
                              },
                              child: new Container(
                                width: Get.width * 0.4,
                                child: new Center(
                                  child: new Text(
                                    !_controller.showLoader.value
                                        ? "Log in"
                                        : "Please wait..",
                                    style: new TextStyle(
                                        fontSize: 18.0, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: spacing * 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(em);
  }

  /// ------------------------------------------------------------
  /// Method that handles click of login button
  /// ------------------------------------------------------------
  Future<void> loginLogic() async {
    if (emailController.text.toString().trim().isEmpty) {
      Get.snackbar("Error", "Please enter email id");
      return;
    }

    if (!isEmail(emailController.text.toString().trim())) {
      Get.snackbar("Error", "Please enter valid email id");
      return;
    }

    if (passwordController.text.toString().trim().isEmpty) {
      Get.snackbar("Error", "Enter password");
      return;
    }
    _controller.showLoader.value = true;
    UserModel userModel =
        await _controller.login(emailController.text, passwordController.text);
    if (userModel.status == "true") {
      _controller.showLoader.value = false;
      Get.snackbar("Success", userModel.msg);
      final _prefs = SharedPrefs();
      _prefs.setAuthCode(userModel.authCode);
      _prefs.saveProfile(jsonEncode(userModel.profile));
      Get.offAll(() => Home());
    } else {
      _controller.showLoader.value = false;
      Get.snackbar("Error", userModel.msg);
    }
  }
}
