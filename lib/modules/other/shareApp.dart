import 'package:brent/extras/constants.dart';
import 'package:brent/modules/home/controller/homeController.dart';
import 'package:brent/modules/login/view/loginPage.dart';
import 'package:brent/modules/signUp/controller/signUpController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

class ShareAppPage extends StatelessWidget {
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
              ClipRRect(
                child: Image.asset(
                  dummyPlaneHome,
                  fit: BoxFit.fitWidth,
                  width: double.maxFinite,
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
              Container(
                margin: EdgeInsets.all(32.0),
                child: inputField(
                    context, "Email Id", false, TextInputType.emailAddress),
              ),
              SizedBox(
                height: spacing * 1 / 2,
              ),
              Container(
                margin: EdgeInsets.all(32.0),
                height: spacing * 8,
                decoration: new BoxDecoration(
                  color: lightGreen,
                  border: new Border.all(color: lightGreen, width: 2.0),
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: 32.0,
                        right: 32.0,
                      ),
                      height: spacing * 2,
                      width: double.maxFinite,
                      decoration: new BoxDecoration(
                        color: white,
                        border: new Border.all(color: lightGreen, width: 2.0),
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        "wP2bz",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline4.copyWith(
                              color: grey,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 32.0, right: 32.0),
                      height: spacing * 2,
                      width: double.maxFinite,
                      decoration: new BoxDecoration(
                        color: white,
                        border: new Border.all(color: lightGreen, width: 2.0),
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Text(
                          "Generate Referral Code",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                                color: grey,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
