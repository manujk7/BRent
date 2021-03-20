import 'package:brent/extras/constants.dart';
import 'package:brent/modules/home/controller/homeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentPage extends StatelessWidget {
  final HomeController _controller = Get.find();
  final _radioValue1 = 0;
  final _radioValue2 = -1;

  void _handleRadioValueChange1(int value) {
    // _radioValue1 = value;

    switch (_radioValue1) {
      case 0:
        // Fluttertoast.showToast(msg: 'Correct !',toastLength: Toast.LENGTH_SHORT);

        break;
      case 1:
        // Fluttertoast.showToast(msg: 'Try again !',toastLength: Toast.LENGTH_SHORT);
        break;
      case 2:
        // Fluttertoast.showToast(msg: 'Try again !',toastLength: Toast.LENGTH_SHORT);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: white,
        title: new Text(
          "Make a payment",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: new IconThemeData(color: blue),
      ),
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
            child: Column(
              children: [
                Material(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: white, width: 0),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  color: white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12.0),
                                  topRight: Radius.circular(12.0),
                                  bottomLeft: Radius.circular(12.0),
                                  bottomRight: Radius.circular(12.0),
                                ),
                                child: Image.asset(
                                  dummyPlaneHome,
                                  fit: BoxFit.fitWidth,
                                  width: double.maxFinite,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: spacing * 1 / 2,
                            ),
                            Text(
                              "New York to San Francisco",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "One-Way Deal",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  .copyWith(
                                    color: orange,
                                  ),
                            ),
                            SizedBox(
                              height: spacing,
                            ),
                            Text(
                              "Departing: 03/14/2021 (9:00 a.m.)",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(
                                    color: Colors.black,
                                  ),
                            ),
                            SizedBox(
                              height: spacing,
                            ),
                            Text(
                              "Arriving: 03/14/2021 (3:00 p.m.)",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(
                                    color: Colors.black,
                                  ),
                            ),
                            SizedBox(
                              height: spacing,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: spacing,
                ),
                Material(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: white, width: 0),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  color: white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "1 passenger",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(
                                        color: Colors.black,
                                      ),
                                ),
                                Text(
                                  "\$7,500.00",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: spacing * 1 / 2,
                            ),
                            Divider(
                              color: lightGrey,
                              thickness: 1,
                            ),
                            SizedBox(
                              height: spacing * 1 / 2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total due",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(
                                        color: Colors.black,
                                      ),
                                ),
                                Text(
                                  "\$7,500.00",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: spacing,
                            ),
                            Text(
                              "Choose your payment method:",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            new Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    new Radio(
                                      value: 0,
                                      activeColor: blue,
                                      groupValue: _radioValue1,
                                      onChanged: _handleRadioValueChange1,
                                    ),
                                    new Text(
                                      'Mastercard ending in 0000',
                                      style: new TextStyle(fontSize: 16.0),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    new Radio(
                                      value: 1,
                                      groupValue: _radioValue2,
                                      onChanged: _handleRadioValueChange1,
                                    ),
                                    new Text(
                                      'Add a new card',
                                      style: new TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: spacing,
                            ),
                            Container(
                              width: Get.width,
                              height: 56.0,
                              decoration: new BoxDecoration(
                                color: blue,
                                border: new Border.all(color: blue, width: 2.0),
                                borderRadius: new BorderRadius.circular(6.0),
                              ),
                              child: InkWell(
                                onTap: () {
                                  Get.toNamed("/home");
                                },
                                child: new Container(
                                  width: Get.width * 0.4,
                                  child: new Center(
                                    child: new Text(
                                      "Pay now",
                                      style: new TextStyle(
                                          fontSize: 18.0, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: spacing,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
