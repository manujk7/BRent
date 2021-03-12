import 'package:brent/extras/constants.dart';
import 'package:brent/modules/home/controller/homeController.dart';
import 'package:brent/modules/login/view/loginPage.dart';
import 'package:brent/modules/signUp/controller/signUpController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

class CreatePage extends StatelessWidget {
  final HomeController _controller = Get.find();
  final ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: SingleChildScrollView(
          child: Container(
            height: Get.height,
            child: Column(
              children: <Widget>[
                Flexible(
                  child: ClipRRect(
                    child: Image.asset(
                      dummyPlaneHome,
                      fit: BoxFit.fitWidth,
                      width: double.maxFinite,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(12.0),
                  child: Text(
                    "One-Way Deal",
                    style: Theme.of(context).textTheme.subtitle2.copyWith(
                          color: orange,
                        ),
                  ),
                ),
                SizedBox(
                  height: spacing * 1 / 2,
                ),
                inputFieldNoCurvedBorder(
                    context, "From-:", false, TextInputType.text),
                SizedBox(
                  height: spacing * 1 / 2,
                ),
                inputFieldNoCurvedBorder(
                    context, "Going To-:", false, TextInputType.text),
                SizedBox(
                  height: spacing * 1 / 2,
                ),
                inputFieldNoCurvedBorder(
                    context, "Date", false, TextInputType.text),
                SizedBox(
                  height: spacing * 1 / 2,
                ),
                inputFieldNoCurvedBorder(
                    context, "Time of Departure:-", false, TextInputType.text),
                SizedBox(
                  height: spacing * 1 / 2,
                ),
                inputFieldNoCurvedBorder(
                    context, "Time of Arrival:-", false, TextInputType.text),
                SizedBox(
                  height: spacing * 1 / 2,
                ),
                inputFieldNoCurvedBorder(
                    context, "Time of Duration:-", false, TextInputType.text),
                SizedBox(
                  height: spacing * 1 / 2,
                ),
                inputFieldNoCurvedBorder(
                    context, "Available Seat:-", false, TextInputType.text),
                SizedBox(
                  height: spacing * 1 / 2,
                ),
                inputFieldNoCurvedBorder(context, "Full fare for 1 seat:-",
                    false, TextInputType.text),
                SizedBox(
                  height: spacing * 1 / 2,
                ),
                customButton(context, "Submit", green, 0.4, "/login"),
                SizedBox(
                  height: spacing * 1 / 2,
                ),
                Container(
                  margin: const EdgeInsets.only(
                      left: 24.0, right: 24.0, bottom: 12.0),
                  child: Divider(
                    color: Colors.black,
                    thickness: 2.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
