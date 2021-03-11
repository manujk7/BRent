import 'package:brent/extras/constants.dart';
import 'package:brent/modules/login/controller/loginController.dart';
import 'package:brent/modules/login/view/loginPage.dart';
import 'package:brent/modules/signUp/view/components/signUpPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstPage extends StatelessWidget {
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
                          height: spacing * 1 / 2,
                        ),
                        Expanded(
                          child: Image.asset(
                            dummyPlane,
                          ),
                        ),
                        SizedBox(
                          height: spacing * 1 / 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customButton(
                                context, "Sign Up", blue, 0.4, () => SignUpPage()),
                            customButton(
                                context, "Submit", green, 0.4, () => LoginPage()),
                          ],
                        ),
                        SizedBox(
                          height: spacing * 1,
                        ),
                        Container(
                          margin:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Divider(
                            color: Colors.black,
                            thickness: 2.0,
                          ),
                        ),
                      ],
                    ),
                    // Obx(
                    //   () => Center(
                    //     child: _controller.isLoggedIn.value
                    //         ? _controller.showHome.value
                    //             ? HomeView()
                    //             : _controller.hasBase.value
                    //                 ? CurrencyToCompare()
                    //                 : SelectBase()
                    //         : InkWell(
                    //             onTap: () {
                    //               _controller.googleLogin();
                    //             },
                    //             child: Container(
                    //               width: Get.width * 0.8,
                    //               color: white,
                    //               height: 40,
                    //               alignment: Alignment.center,
                    //               child: Text("Login Using Google"),
                    //             ),
                    //           ),
                    //   ),
                    // ),
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
