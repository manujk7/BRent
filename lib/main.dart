import 'package:brent/modules/firstPage/view/firstPage.dart';
import 'package:brent/modules/home/controller/homeController.dart';
import 'package:brent/modules/home/view/components/home.dart';
import 'package:brent/modules/signUp/controller/signUpController.dart';
import 'package:brent/modules/signUp/view/components/signUpPage.dart';
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
  final _controllerHome = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'BRent',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      //when initial Route is given no need to add home widget for initial start point of app
      //full app route structure
      routes: {
        '/': (context) => FirstPage(),
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUpPage(),
        '/home': (context) => Home()
      },
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
          dividerTheme: DividerThemeData(
              color: Colors.grey                               //  <--- change the divider's color
          )
      ),
    );
  }
}
