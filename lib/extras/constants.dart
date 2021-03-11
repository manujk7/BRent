import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Color blue = Colors.blue;
const Color white = Colors.white;
const Color grey = Colors.blueGrey;
const double spacing = 24.0;

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
