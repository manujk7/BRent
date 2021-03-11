import 'package:brent/extras/constants.dart';
import 'package:brent/modules/home/view/components/home.dart';
import 'package:brent/modules/login/controller/loginController.dart';
import 'package:brent/modules/signUp/view/components/signUpPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final LoginController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: spacing,
            vertical: spacing,
          ),
          width: Get.width,
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
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
                          height: spacing,
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(12.0, 24.0, 12.0, 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Login",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    .copyWith(
                                      color: blue,
                                    ),
                              ),
                              SizedBox(
                                height: spacing,
                              ),
                              inputField(context, "Email Id", false,
                                  TextInputType.emailAddress),
                              SizedBox(
                                height: spacing,
                              ),
                              inputField(context, "Password", true,
                                  TextInputType.text),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: spacing * 3,
                        ),
                        customButton(context, "Submit", green, 0.6, "/home"),
                        SizedBox(
                          height: spacing * 1,
                        ),
                        Container(
                          margin:
                              const EdgeInsets.only(left: 12.0, right: 12.0),
                          child: Divider(
                            color: Colors.black,
                            thickness: 2.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
