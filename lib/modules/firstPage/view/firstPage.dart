import 'package:brent/extras/constants.dart';
import 'package:brent/modules/login/controller/loginController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class FirstPage extends StatelessWidget {
  final LoginController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    print(Get.height);
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Container(
          height: Get.height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                flex: 6,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: spacing,
                    vertical: spacing,
                  ),
                  width: Get.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        logoImage,
                        height: 288.0,
                      ),
                      SizedBox(
                        height: spacing * 1 / 2,
                      ),
                      Center(
                        child: Text(
                          "The best in business travel.",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline5.copyWith(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: spacing,
                      ),
                      customButton(context, "Login", blue, 1, "/login"),
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
                        child: InkWell(
                          onTap: () {
                            Get.toNamed("/signUp");
                          },
                          child: new Container(
                            width: Get.width * 0.4,
                            child: new Center(
                              child: new Text(
                                "Create an account",
                                style: new TextStyle(
                                    fontSize: 18.0, color: Colors.black),
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
              Flexible(
                flex: Get.height > 700 ? 2 : 1,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        firstPagePattern,
                        fit: BoxFit.fill,
                        height: 20,
                      ),
                      bottom: 0,
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
