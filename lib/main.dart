import 'package:brent/modules/firstPage/view/firstPage.dart';
import 'package:brent/modules/signUp/controller/signUpController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'modules/login/controller/loginController.dart';
import 'modules/login/view/loginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _controller = Get.put(LoginController());
  final _controllerSignUp = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'BRent',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FirstPage(),
    );
  }
}
