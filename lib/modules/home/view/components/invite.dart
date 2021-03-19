import 'package:brent/extras/constants.dart';
import 'package:brent/modules/home/controller/homeController.dart';
import 'package:brent/modules/login/view/loginPage.dart';
import 'package:brent/modules/signUp/controller/signUpController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

class InvitePage extends StatelessWidget {
  final HomeController _controller = Get.find();
  final ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Container(
          height: Get.height,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: ClipRRect(
                  child: Image.asset(
                    dummyPlaneHome,
                    fit: BoxFit.fitWidth,
                    width: double.maxFinite,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Invites",
                  style: Theme.of(context).textTheme.headline3.copyWith(
                        color: grey,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              // Expanded(
              //   flex: 4,
              //   child: Container(
              //     margin: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
              //     child: ListView.builder(
              //       itemCount: 2,
              //       shrinkWrap: true,
              //       controller: _scrollController,
              //       itemBuilder: (BuildContext context, int index) {
              //         return homeListView(context, index);
              //       },
              //     ),
              //   ),
              // ),
              SizedBox(
                height: spacing * 1 / 2,
              ),
              customButton(context, "Send", green, 0.4, "/login"),
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
    );
  }
}
