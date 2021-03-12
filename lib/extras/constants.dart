import 'package:brent/modules/login/view/loginPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const Color blue = Color(0xFF1c2c52);
const Color green = Color(0xFF35bf73);
const Color lightGrey = Color(0xFFbdbfc2);
const Color lightGreen = Color(0xFF90ceb0);
const Color orange = Colors.orange;
const Color white = Colors.white;
const Color grey = Colors.blueGrey;
const double spacing = 24.0;
const String logoImage = 'assets/images/logo.png';
const String dummyPlane = 'assets/images/planeDummy.jpg';
const String dummyPlaneHome = 'assets/images/homePagePlane.jpeg';

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

Widget inputFieldNoCurvedBorder(BuildContext context, String hintText, bool obscureText,
    TextInputType textInputType) {
  return TextField(
    textAlign: TextAlign.start,
    keyboardType: textInputType,
    obscureText: obscureText,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(fontSize: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0),
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

Widget homeListView(BuildContext context, int index) {
  return Container(
    margin: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 12.0),
    padding: EdgeInsets.all(2.0),
    decoration: new BoxDecoration(
      color: lightGreen,
      border: new Border.all(color: lightGreen, width: 2.0),
      borderRadius: new BorderRadius.circular(10.0),
    ),
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
            borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
            border: new Border.all(
              color: white,
              width: 2.0,
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
          Icons.check_circle_outline,
          size: 32.0,
          color: green,
        ),
      ],
    ),
  );
}
