import 'package:brent/extras/constants.dart';
import 'package:brent/modules/home/controller/homeController.dart';
import 'package:brent/modules/login/view/loginPage.dart';
import 'package:brent/modules/signUp/controller/signUpController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

class CreatePage extends StatelessWidget {
  final HomeController _controller = Get.find();
  final ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: SingleChildScrollView(
          child: Container(
            width: Get.width,
            margin: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
            child: Material(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              color: white,
              child: Container(
                margin: EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: spacing,
                    ),
                    Row(
                      children: [
                        Obx(
                          () => FlutterSwitch(
                            width: 80.0,
                            height: 45.0,
                            valueFontSize: 0.0,
                            toggleSize: 35.0,
                            value: _controller.isSwitched.value,
                            borderRadius: 30.0,
                            showOnOff: true,
                            onToggle: (val) {
                              _controller.isSwitched.value = val;
                            },
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          "One way deal",
                          style: new TextStyle(
                              fontSize: 18.0, color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: spacing,
                    ),
                    inputField(
                        context, "Departing from", false, TextInputType.text),
                    SizedBox(
                      height: spacing,
                    ),
                    inputField(context, "Going to", false, TextInputType.text),
                    SizedBox(
                      height: spacing,
                    ),
                    inputField(context, "Date", false, TextInputType.datetime),
                    SizedBox(
                      height: spacing,
                    ),
                    inputField(context, "Time of departure", false,
                        TextInputType.text),
                    SizedBox(
                      height: spacing,
                    ),
                    inputField(
                        context, "Time of arrival", false, TextInputType.text),
                    SizedBox(
                      height: spacing,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "15 seats available",
                          style: new TextStyle(
                              fontSize: 18.0, color: Colors.black),
                        ),
                        Text(
                          "\$7,500.00 per seat",
                          style: new TextStyle(
                              fontSize: 18.0, color: Colors.black),
                        )
                      ],
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
                      child: InkWell(
                        onTap: () {},
                        child: new Container(
                          width: Get.width * 0.4,
                          child: new Center(
                            child: new Text(
                              "Create flight",
                              style: new TextStyle(
                                  fontSize: 18.0, color: Colors.white),
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
}
