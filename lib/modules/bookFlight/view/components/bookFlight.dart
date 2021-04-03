import 'package:brent/extras/constants.dart';
import 'package:brent/modules/bookFlight/controller/bookFlightController.dart';
import 'package:brent/modules/home/controller/homeController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_number_picker/flutter_number_picker.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class BookFlightPage extends StatelessWidget {
  final HomeController _controllerHome = Get.find();
  final BookFlightController _controller = Get.find();
  int passengers = 1;

  @override
  Widget build(BuildContext context) {
    if (Get.arguments != null) {
      if (Get.arguments[0] == "1") {
        _controller.data.value = Get.arguments[1];
        _controllerHome.ticketAmount = int.parse(_controller.data().price);
        _controllerHome.totalPrice.value = int.parse(_controller.data().price);
      } else {
        hitApi();
      }
    }

    return Scaffold(
      backgroundColor: background,
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: white,
        title: new Text(
          "Book flight",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: new IconThemeData(color: blue),
      ),
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: SingleChildScrollView(
          child: Obx(
            () => Container(
              margin: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
              child: !_controller.showLoader.value
                  ? Material(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: white, width: 0),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      color: white,
                      child: _controller.data != null &&
                              _controller.data().id != null
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      24.0, 24.0, 24.0, 0.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        "${_controller.data().from} to ${_controller.data().to}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5
                                            .copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        _controller.data().way == "1"
                                            ? "One-Way Deal"
                                            : "Two-Way Deal",
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
                                        "Departing: ${Constants.getFormattedDate(_controller.data().flightDepartureDate)} (${_controller.data().timeOfDeparture}) ",
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
                                        "Arriving: ${Constants.getFormattedDate(_controller.data().arrivalDate)} (${_controller.data().timeOfArrival})",
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
                                        "${_controller.data().seats} seats available",
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
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          CustomNumberPicker(
                                            initialValue: 1,
                                            maxValue: int.parse(
                                                _controller.data().seats),
                                            minValue: 1,
                                            step: 1,
                                            valueTextStyle:
                                                TextStyle(fontSize: 16),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(6),
                                              ),
                                              side: BorderSide(
                                                width: 0.5,
                                                color: lightGrey,
                                              ),
                                            ),
                                            customAddButton: Row(
                                              children: [
                                                Container(
                                                  width: Get.width * 1 / 8,
                                                  height: 56.0,
                                                  decoration: BoxDecoration(
                                                    border: Border(
                                                      left: BorderSide(
                                                          color: lightGrey,
                                                          width: 0.5),
                                                    ),
                                                  ),
                                                  child: InkWell(
                                                    child: new Container(
                                                      width: Get.width * 0.4,
                                                      child: new Center(
                                                        child: new Text(
                                                          "+",
                                                          style: new TextStyle(
                                                              fontSize: 32.0,
                                                              color: blue),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            customMinusButton: Container(
                                              width: Get.width * 1 / 8,
                                              height: 56.0,
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  right: BorderSide(
                                                      color: lightGrey,
                                                      width: 0.5),
                                                ),
                                              ),
                                              child: InkWell(
                                                child: new Container(
                                                  width: Get.width * 0.4,
                                                  child: new Center(
                                                    child: new Text(
                                                      "-",
                                                      style: new TextStyle(
                                                          fontSize: 32.0,
                                                          color: blue),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            onValue: (value) {
                                              _controllerHome.updateData(value);
                                              passengers = value;
                                              print(value.toString());
                                            },
                                          ),
                                          SizedBox(
                                            width: spacing,
                                          ),
                                          Text(
                                            "passengers",
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1
                                                .copyWith(
                                                  color: Colors.black,
                                                ),
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
                                        height: spacing,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Subtotal",
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1
                                                .copyWith(
                                                  color: Colors.black,
                                                ),
                                          ),
                                          Obx(
                                            () => Text(
                                              "\$${_controllerHome.totalPrice}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline4
                                                  .copyWith(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
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
                                          border: new Border.all(
                                              color: blue, width: 2.0),
                                          borderRadius:
                                              new BorderRadius.circular(6.0),
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            Get.toNamed("/paymentPage",
                                                arguments: [
                                                  passengers,
                                                  _controllerHome.totalPrice,
                                                  _controller.data()
                                                ]);
                                          },
                                          child: new Container(
                                            width: Get.width * 0.4,
                                            child: new Center(
                                              child: new Text(
                                                "Next",
                                                style: new TextStyle(
                                                    fontSize: 18.0,
                                                    color: Colors.white),
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
                            )
                          : Container(),
                    )
                  : Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator()),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> hitApi() async {
    await _controller.getFlightData();
    _controllerHome.ticketAmount = int.parse(_controller.data().price);
    _controllerHome.totalPrice.value = int.parse(_controller.data().price);
  }
}
