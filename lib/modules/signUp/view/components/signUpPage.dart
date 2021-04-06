import 'dart:convert';

import 'package:brent/extras/constants.dart';
import 'package:brent/modules/home/view/components/home.dart';
import 'package:brent/modules/login/model/userModel.dart';
import 'package:brent/modules/signUp/controller/signUpController.dart';
import 'package:brent/modules/signUp/model/statesModel.dart';
import 'package:brent/services/prefrences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  final SignUpController _controller = Get.find();
  final nameController = new TextEditingController();
  final emailController = new TextEditingController();
  final numberController = new TextEditingController();
  final addressController = new TextEditingController();
  final cityController = new TextEditingController();
  final passwordController = new TextEditingController();
  final confirmPasswordController = new TextEditingController();
  final zipCodeController = new TextEditingController();
  final referCodeController = new TextEditingController();
  final focusEmail = FocusNode();
  final focusPhone = FocusNode();
  final focusPass = FocusNode();
  final focusConfirmPass = FocusNode();
  final focusAddress = FocusNode();
  final focusCity = FocusNode();
  final focusZipCode = FocusNode();
  final focusReferral = FocusNode();
  String stateValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Create an account",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: blue),
      ),
      backgroundColor: background,
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: SingleChildScrollView(
          child: Container(
            color: background,
            width: Get.width,
            margin: EdgeInsets.fromLTRB(0.0, 24.0, 0.0, 16.0),
            child: Material(
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
                    SizedBox(
                      height: spacing,
                    ),
                    TextField(
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      controller: nameController,
                      onSubmitted: (v) {
                        FocusScope.of(context).requestFocus(focusEmail);
                      },
                      decoration: InputDecoration(
                        hintText: "Full Name",
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
                    TextField(
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                      controller: emailController,
                      focusNode: focusEmail,
                      onSubmitted: (v) {
                        FocusScope.of(context).requestFocus(focusPhone);
                      },
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
                    TextField(
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.phone,
                      obscureText: false,
                      focusNode: focusPhone,
                      onSubmitted: (v) {
                        FocusScope.of(context).requestFocus(focusPass);
                      },
                      controller: numberController,
                      decoration: InputDecoration(
                        hintText: "Phone Number",
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
                        controller: passwordController,
                        focusNode: focusPass,
                        onSubmitted: (v) {
                          FocusScope.of(context).requestFocus(focusConfirmPass);
                        },
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
                    SizedBox(
                      height: spacing,
                    ),
                    Obx(
                      () => TextField(
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.text,
                        focusNode: focusConfirmPass,
                        onSubmitted: (v) {
                          FocusScope.of(context).requestFocus(focusAddress);
                        },
                        textAlignVertical: TextAlignVertical.center,
                        controller: confirmPasswordController,
                        obscureText: _controller.isHiddenConfirm.value,
                        decoration: InputDecoration(
                          hintText: "Confirm password",
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
                            onTap: _controller.toggleConfirmPasswordView,
                            child: Icon(
                              _controller.isHiddenConfirm.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_rounded,
                              color: blue,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: spacing,
                    ),
                    TextField(
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      focusNode: focusAddress,
                      onSubmitted: (v) {
                        FocusScope.of(context).requestFocus(focusCity);
                      },
                      controller: addressController,
                      decoration: InputDecoration(
                        hintText: "Address",
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
                    TextField(
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      focusNode: focusCity,
                      controller: cityController,
                      onSubmitted: (v) {
                        FocusScope.of(context).requestFocus(focusReferral);
                      },
                      decoration: InputDecoration(
                        hintText: "City",
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
                    Row(
                      children: [
                        Flexible(
                          flex: 3,
                          child: DropdownButtonFormField<dynamic>(
                            onChanged: (value) => stateValue = value,
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: blue,
                            ),
                            decoration: InputDecoration(
                              hintText: "Please select state",
                              hintStyle: TextStyle(fontSize: 16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: BorderSide(
                                  width: 0.1,
                                  style: BorderStyle.solid,
                                  color: borderBg,
                                ),
                              ),
                            ),
                            isExpanded: true,
                            items: _controller
                                .statesModel()
                                .state
                                .map((States map) {
                              return new DropdownMenuItem<String>(
                                value: map.id,
                                child: new Text(map.name,
                                    style: new TextStyle(color: Colors.black)),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(
                          width: spacing,
                        ),
                        Flexible(
                          flex: 2,
                          child: TextField(
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.number,
                            obscureText: false,
                            focusNode: focusZipCode,
                            controller: zipCodeController,
                            decoration: InputDecoration(
                              hintText: "Zip code",
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
                        ),
                      ],
                    ),
                    SizedBox(
                      height: spacing,
                    ),
                    TextField(
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      controller: referCodeController,
                      focusNode: focusReferral,
                      onSubmitted: (v) {},
                      decoration: InputDecoration(
                        hintText: "Referral code",
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
                                ? registerLogic()
                                : null;
                          },
                          child: new Container(
                            width: Get.width * 0.4,
                            child: new Center(
                              child: new Text(
                                !_controller.showLoader.value
                                    ? "Create an account"
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
                      height: spacing * 1 / 2,
                    ),
                  ],
                ),
              ),
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
  /// Method that handles click of register button
  /// ------------------------------------------------------------
  Future<void> registerLogic() async {
    if (emailController.text.toString().trim().isEmpty) {
      Get.snackbar("Error", "Please enter email id");
      return;
    }

    if (nameController.text.toString().trim().isEmpty) {
      Get.snackbar("Error", "Please enter name");
      return;
    }

    if (numberController.text.toString().trim().isEmpty) {
      Get.snackbar("Error", "Please enter number");
      return;
    }

    if (addressController.text.toString().trim().isEmpty) {
      Get.snackbar("Error", "Please enter address");
      return;
    }

    if (cityController.text.toString().trim().isEmpty) {
      Get.snackbar("Error", "Please enter city");
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

    if (stateValue.isEmpty) {
      Get.snackbar("Error", "Please select state");
      return;
    }

    if (passwordController.text.toString().trim() !=
        confirmPasswordController.text.toString().trim()) {
      Get.snackbar("Error", "Enter enter the same password");
      return;
    }

    _controller.showLoader.value = true;

    UserModel userModel = await _controller.registerUser(
        nameController.text,
        emailController.text,
        numberController.text,
        passwordController.text,
        confirmPasswordController.text,
        addressController.text,
        cityController.text,
        stateValue,
        zipCodeController.text,
        referCodeController.text);

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
