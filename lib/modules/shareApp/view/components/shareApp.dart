import 'package:brent/extras/constants.dart';
import 'package:brent/modules/shareApp/controller/shareAppController.dart';
import 'package:brent/modules/shareApp/model/shareAppModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';

class ShareAppPage extends StatelessWidget {
  final ShareAppController _controller = Get.find();
  final emailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: white,
        title: new Text(
          "Share app",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: new IconThemeData(color: blue),
      ),
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: SingleChildScrollView(
          child: Container(
            height: Get.height,
            child: Column(
              children: <Widget>[
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
                        Center(
                          child: Text(
                            "If you know a frequent flyer, share the app and earn a referral bonus.",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: spacing,
                        ),
                        Center(
                          child: Obx(
                            () => Text(
                              _controller.shareCodeModel().code.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: spacing,
                        ),
                        Container(
                          width: Get.width * 1,
                          height: 56.0,
                          decoration: new BoxDecoration(
                            color: white,
                            border:
                                new Border.all(color: Colors.black, width: 2.0),
                            borderRadius: new BorderRadius.circular(6.0),
                          ),
                          child: Obx(
                            () => InkWell(
                              onTap: () {
                                !_controller.showLoader.value ? hitApi() : null;
                                // Get.toNamed("/invitePage");
                              },
                              child: new Container(
                                width: Get.width * 0.4,
                                child: new Center(
                                  child: new Text(
                                    !_controller.showLoader.value
                                        ? "Generate code"
                                        : "Please Wait..",
                                    style: new TextStyle(
                                        fontSize: 18.0, color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: spacing * 2,
                        ),
                        TextField(
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: false,
                          controller: emailController,
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
                        Container(
                          width: Get.width * 1,
                          height: 56.0,
                          decoration: new BoxDecoration(
                            color: blue,
                            border: new Border.all(color: blue, width: 2.0),
                            borderRadius: new BorderRadius.circular(6.0),
                          ),
                          child: InkWell(
                            onTap: () {
                              sendEmail();
                            },
                            child: new Container(
                              width: Get.width * 0.4,
                              child: new Center(
                                child: new Text(
                                  "Share code",
                                  style: new TextStyle(
                                      fontSize: 18.0, color: Colors.white),
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

  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(em);
  }

  //send email
  Future<void> sendEmail() async {
    if (emailController.text.toString().trim().isEmpty) {
      Get.snackbar("Error", "Please enter email id");
      return;
    }

    if (!isEmail(emailController.text.toString().trim())) {
      Get.snackbar("Error", "Please enter valid email id");
      return;
    }

    final Email email = Email(
      body:
          "Here is your code to register into application, ${_controller.code.value}",
      subject: "REFERRAL CODE FOR LOOP..PLEASE JOIN AND FLY TOGETHER.",
      recipients: ["${emailController.text.trim()}"],
      isHTML: false,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
      Get.snackbar("shared", platformResponse);
    } catch (error) {
      platformResponse = error.toString();
      Get.snackbar("error", platformResponse);
    }
  }

  Future<void> hitApi() async {
    _controller.showLoader.value = true;
    ShareAppModel shareAppModel = await _controller.generateShareCode();
    _controller.showLoader.value = false;
  }
}
