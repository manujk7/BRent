import 'package:brent/extras/constants.dart';
import 'package:brent/modules/home/view/components/home.dart';
import 'package:brent/modules/login/view/loginPage.dart';
import 'package:brent/modules/signUp/controller/signUpController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

class SignUpPage extends StatelessWidget {
  final SignUpController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                logoImage,
                height: 120.0,
              ),
              SizedBox(
                height: spacing * 1 / 2,
              ),
              Text(
                "BRent",
                style: Theme.of(context).textTheme.headline3.copyWith(
                      color: blue,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(
                height: spacing * 1 / 2,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(24.0, 12.0, 12.0, 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Create Account",
                      style: Theme.of(context).textTheme.headline5.copyWith(
                            color: blue,
                          ),
                    ),
                    SizedBox(
                      height: spacing * 1 / 2,
                    ),
                    inputField(context, "Full Name", false, TextInputType.text),
                    SizedBox(
                      height: spacing * 1 / 2,
                    ),
                    inputField(
                        context, "Email Id", false, TextInputType.emailAddress),
                    SizedBox(
                      height: spacing * 1 / 2,
                    ),
                    inputField(
                        context, "Phone Number", false, TextInputType.phone),
                    SizedBox(
                      height: spacing * 1 / 2,
                    ),
                    inputField(context, "Password", true, TextInputType.text),
                    SizedBox(
                      height: spacing * 1 / 2,
                    ),
                    inputField(
                        context, "Confirm Password", true, TextInputType.text),
                  ],
                ),
              ),
              SizedBox(
                height: spacing * 1 / 2,
              ),
              customButton(
                  context, "Referral Code", green, 0.5, "/login"),
              SizedBox(
                height: spacing * 1 / 2,
              ),
              customButton(context, "Submit", blue, 0.6, "/home"),
              SizedBox(
                height: spacing * 1 / 2,
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 12.0, right: 12.0, bottom: 12.0),
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
