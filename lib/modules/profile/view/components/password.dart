import 'dart:io';
import 'package:brent/extras/constants.dart';
import 'package:brent/modules/profile/controller/profileController.dart';
import 'package:brent/services/commonMessageStatusModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChangePasswordState();
  }
}

class _ChangePasswordState extends State<ChangePassword> {
  final ProfileController _controller = Get.find();
  bool isHiddenOld = true;
  bool isHiddenNew = true;
  bool isHiddenNewConfirm = true;
  final oldPasswordController = new TextEditingController();
  final newPasswordController = new TextEditingController();
  final confirmNewPasswordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: white,
        title: new Text(
          "Change password",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: new IconThemeData(color: blue),
      ),
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(bottom: 12),
            child: Column(
              children: [
                Container(
                  height: 30,
                ),
                Material(
                  elevation: 2,
                  color: white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(
                        top: 32, left: 16, right: 16, bottom: 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: spacing,
                        ),
                        TextField(
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.text,
                          textAlignVertical: TextAlignVertical.center,
                          obscureText: isHiddenOld,
                          controller: oldPasswordController,
                          decoration: InputDecoration(
                            hintText: "Current password",
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
                              onTap: togglePasswordOld,
                              child: Icon(
                                isHiddenOld
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_rounded,
                                color: blue,
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
                          textAlignVertical: TextAlignVertical.center,
                          obscureText: isHiddenNew,
                          controller: newPasswordController,
                          decoration: InputDecoration(
                            hintText: "New password",
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
                              onTap: togglePasswordNew,
                              child: Icon(
                                isHiddenNew
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_rounded,
                                color: blue,
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
                          textAlignVertical: TextAlignVertical.center,
                          obscureText: isHiddenNewConfirm,
                          controller: confirmNewPasswordController,
                          decoration: InputDecoration(
                            hintText: "Confirm new password",
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
                              onTap: togglePasswordNewConfirm,
                              child: Icon(
                                isHiddenNewConfirm
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_rounded,
                                color: blue,
                              ),
                            ),
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
                                    ? updatePasswordLogic()
                                    : null;
                              },
                              child: new Container(
                                width: Get.width * 0.4,
                                child: new Center(
                                  child: new Text(
                                    !_controller.showLoader.value
                                        ? "Save changes"
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
                          height: spacing,
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

  void togglePasswordOld() {
    setState(() {
      isHiddenOld = !isHiddenOld;
    });
  }

  void togglePasswordNew() {
    setState(() {
      isHiddenNew = !isHiddenNew;
    });
  }

  void togglePasswordNewConfirm() {
    setState(() {
      isHiddenNewConfirm = !isHiddenNewConfirm;
    });
  }

  /// ------------------------------------------------------------
  /// Method that handles click of updatePassword button
  /// ------------------------------------------------------------

  Future<void> updatePasswordLogic() async {
    if (oldPasswordController.text.toString().trim().isEmpty) {
      Get.snackbar("Error", "Enter old password");
      return;
    }
    if (newPasswordController.text.toString().trim().isEmpty) {
      Get.snackbar("Error", "Enter old password");
      return;
    }
    if (newPasswordController.text.toString().trim() !=
        confirmNewPasswordController.text.toString().trim()) {
      Get.snackbar("Error", "Enter enter the same new password");
      return;
    }
    _controller.showLoader.value = true;
    StatusMessageModel userModel = await _controller.updatePassword(
        oldPasswordController.text.trim(), newPasswordController.text.trim());
    if (userModel.status == "true") {
      _controller.showLoader.value = false;
      setState(() {
        oldPasswordController.text = "";
        newPasswordController.text = "";
        confirmNewPasswordController.text = "";
      });
      Get.snackbar("Success", userModel.msg);
    } else {
      _controller.showLoader.value = false;
      Get.snackbar("Error", userModel.msg);
    }
  }
}
