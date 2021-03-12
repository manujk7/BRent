import 'package:brent/extras/constants.dart';
import 'package:brent/modules/home/controller/homeController.dart';
import 'package:brent/modules/login/view/loginPage.dart';
import 'package:brent/modules/signUp/controller/signUpController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

import 'homePage.dart';

class HomeListView extends StatelessWidget {
  final HomeController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(12.0),
              color: blue,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  new Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: new BoxDecoration(
                      color: const Color(0xff7c94b6),
                      image: new DecorationImage(
                        image: new NetworkImage(
                            'https://miro.medium.com/max/560/1*MccriYX-ciBniUzRKAUsAw.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(50.0)),
                      border: new Border.all(
                        color: white,
                        width: 4.0,
                      ),
                    ),
                  ),
                  Text(
                    "Mr Devanur",
                    style: Theme.of(context).textTheme.headline5.copyWith(
                          color: white,
                        ),
                  ),
                  SizedBox(
                    width: spacing * 3,
                  ),
                  Icon(
                    Icons.settings,
                    size: 24.0,
                    color: white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
