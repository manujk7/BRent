import 'package:brent/modules/login/view/loginPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const Color blue = Color(0xFF1c2c52);
const Color green = Color(0xFF35bf73);
const Color white = Colors.white;
const Color grey = Colors.blueGrey;
const double spacing = 24.0;
const String logoImage = 'assets/images/logo.png';
const String dummyPlane = 'assets/images/plane_dummy.jpg';

const textInputDecorationRect = InputDecoration(
  contentPadding: EdgeInsets.symmetric(
    horizontal: spacing / 2,
    vertical: 0,
  ),
  hintText: "Currency code (INR, USD, EUR, ...)",
  hintStyle: TextStyle(color: Colors.black26),
  fillColor: white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white24,
      width: 2,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(6),
    ),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white24,
      width: 2,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(6),
    ),
  ),
  /*focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: primaryColor,
      width: 2,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(6),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: primaryColor,
      width: 2,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(6),
    ),
  ),*/
);

Widget inputField(BuildContext context, String hintText, bool obscureText,
    TextInputType textInputType) {
  return TextField(
    textAlign: TextAlign.center,
    keyboardType: textInputType,
    obscureText: obscureText,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(fontSize: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          width: 0.5,
          style: BorderStyle.none,
        ),
      ),
      contentPadding: EdgeInsets.all(16),
    ),
  );
}

Widget customButton(BuildContext context, String title, Color color,
    double width, String route) {
  return Container(
    width: Get.width * width,
    height: 50.0,
    decoration: new BoxDecoration(
      color: blue,
      border: new Border.all(color: color, width: 2.0),
      borderRadius: new BorderRadius.circular(10.0),
    ),
    child: InkWell(
      onTap: () {
        print(route.toString());
        Get.toNamed(route);
      },
      child: new Container(
        width: Get.width * 0.4,
        decoration: new BoxDecoration(
          color: color,
          border: new Border.all(color: white, width: 2.0),
          borderRadius: new BorderRadius.circular(10.0),
        ),
        child: new Center(
          child: new Text(
            title,
            style: new TextStyle(fontSize: 18.0, color: Colors.white),
          ),
        ),
      ),
    ),
  );
}
