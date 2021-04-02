import 'package:brent/extras/constants.dart';
import 'package:brent/modules/home/controller/homeController.dart';
import 'package:brent/modules/home/controller/homePageController.dart';
import 'package:brent/modules/home/model/airportCodesModel.dart';
import 'package:brent/modules/home/model/createFlightModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_number_picker/flutter_number_picker.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class CreatePage extends StatelessWidget {
  final HomeController _controller = Get.find();
  final HomePageController _controllerHomePage = Get.find();
  final dateController = new TextEditingController();
  final timeOfDepartureController = new TextEditingController();
  final timeOfArrivalController = new TextEditingController();
  DateTime _selectedDate;
  TimeOfDay _selectedTimeDeparture;
  TimeOfDay _selectedTimeArrival;
  String departingFrom = "";
  String goingTo = "";
  final priceController = new TextEditingController();
  int passengers = 1;
  String stateValue = "";
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: SingleChildScrollView(
          child: Container(
            width: Get.width,
            margin: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
            child: Material(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              color: white,
              child: Container(
                margin: EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: spacing,
                    ),
                    Row(
                      children: [
                        Obx(
                          () => FlutterSwitch(
                            width: 80.0,
                            height: 45.0,
                            valueFontSize: 0.0,
                            toggleSize: 35.0,
                            value: _controller.isSwitched.value,
                            borderRadius: 30.0,
                            showOnOff: true,
                            onToggle: (val) {
                              print(val);
                              _controller.isSwitched.value = val;
                            },
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          "One way deal",
                          style: new TextStyle(
                              fontSize: 18.0, color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: spacing,
                    ),
                    Obx(
                      () => _controller.airportCodesModel != null &&
                              _controller.airportCodesModel().airport != null
                          ? DropdownButtonFormField<dynamic>(
                              isExpanded: true,
                              onChanged: (value) {
                                stateValue = value;
                              },
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: blue,
                              ),
                              decoration: InputDecoration(
                                hintText: "Departing from",
                                hintStyle: TextStyle(fontSize: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: BorderSide(
                                    width: 0.1,
                                    style: BorderStyle.solid,
                                    color: borderBg,
                                  ),
                                ),
                              ),
                              items: _controller
                                  .airportCodesModel()
                                  .airport
                                  .map((Airport map) {
                                return new DropdownMenuItem<String>(
                                  value: map.id,
                                  onTap: () async {
                                    departingFrom = map.fromTo;
                                    if (departingFrom == goingTo) {
                                      _controller.airportCodesModelFrom.value =
                                          AirportCodesModel();
                                    }
                                    print(map.code);
                                    var airportCodesModel = await _controller
                                        .getSelectedFlightFrom(map.code);
                                  },
                                  child: new Text(map.fromTo + " - " + map.code,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          new TextStyle(color: Colors.black)),
                                );
                              }).toList(),
                            )
                          : Container(),
                    ),
                    SizedBox(
                      height: spacing,
                    ),
                    Obx(
                      () => _controller.airportCodesModelFrom != null &&
                              _controller.airportCodesModelFrom().airport !=
                                  null
                          ? DropdownButtonFormField<String>(
                              onChanged: (value) {
                                // goingTo = value;
                              },
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: blue,
                              ),
                              decoration: InputDecoration(
                                hintText: "Going to",
                                hintStyle: TextStyle(fontSize: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: BorderSide(
                                    width: 0.1,
                                    style: BorderStyle.solid,
                                    color: borderBg,
                                  ),
                                ),
                              ),
                              items: _controller
                                  .airportCodesModelFrom()
                                  .airport
                                  .map((Airport map) {
                                return new DropdownMenuItem<String>(
                                  value: map.id,
                                  onTap: () {
                                    goingTo = map.fromTo;
                                  },
                                  child: new Text(map.fromTo + " - " + map.code,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          new TextStyle(color: Colors.black)),
                                );
                              }).toList(),
                            )
                          : Container(
                              child: TextField(
                                textAlign: TextAlign.start,
                                keyboardType: TextInputType.text,
                                obscureText: false,
                                onTap: () {
                                  FocusScope.of(context)
                                      .requestFocus(new FocusNode());
                                  Get.snackbar(
                                      "Error", "Please select departing from");
                                },
                                decoration: InputDecoration(
                                  hintText: "Going to",
                                  hintStyle: TextStyle(fontSize: 16),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: BorderSide(
                                      width: 0.1,
                                      style: BorderStyle.solid,
                                      color: borderBg,
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.all(20),
                                ),
                              ),
                            ),
                    ),
                    SizedBox(
                      height: spacing,
                    ),
                    TextField(
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.datetime,
                      obscureText: false,
                      controller: dateController,
                      onTap: () {
                        FocusScope.of(context).requestFocus(new FocusNode());
                        _selectDate(context);
                      },
                      decoration: InputDecoration(
                        hintText: "Date",
                        hintStyle: TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(
                            width: 0.1,
                            style: BorderStyle.solid,
                            color: borderBg,
                          ),
                        ),
                        contentPadding: EdgeInsets.all(20),
                      ),
                    ),
                    SizedBox(
                      height: spacing,
                    ),
                    TextField(
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.datetime,
                      obscureText: false,
                      controller: timeOfDepartureController,
                      onTap: () {
                        FocusScope.of(context).requestFocus(new FocusNode());
                        _selectTimeDeparture(context);
                      },
                      decoration: InputDecoration(
                        hintText: "Time of departure",
                        hintStyle: TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(
                            width: 0.1,
                            style: BorderStyle.solid,
                            color: borderBg,
                          ),
                        ),
                        contentPadding: EdgeInsets.all(20),
                      ),
                    ),
                    SizedBox(
                      height: spacing,
                    ),
                    TextField(
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.datetime,
                      obscureText: false,
                      controller: timeOfArrivalController,
                      onTap: () {
                        FocusScope.of(context).requestFocus(new FocusNode());
                        _selectTimeArrival(context);
                      },
                      decoration: InputDecoration(
                        hintText: "Time of arrival",
                        hintStyle: TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(
                            width: 0.1,
                            style: BorderStyle.solid,
                            color: borderBg,
                          ),
                        ),
                        contentPadding: EdgeInsets.all(20),
                      ),
                    ),
                    SizedBox(
                      height: spacing,
                    ),
                    Text(
                      "Please select number of seats",
                      style: new TextStyle(fontSize: 18.0, color: Colors.black),
                    ),
                    SizedBox(
                      height: spacing * 1 / 2,
                    ),
                    CustomNumberPicker(
                      initialValue: 1,
                      maxValue: 20,
                      minValue: 1,
                      step: 1,
                      valueTextStyle: TextStyle(fontSize: 16),
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
                                left: BorderSide(color: lightGrey, width: 0.5),
                              ),
                            ),
                            child: InkWell(
                              child: new Container(
                                width: Get.width * 0.4,
                                child: new Center(
                                  child: new Text(
                                    "+",
                                    style: new TextStyle(
                                        fontSize: 32.0, color: blue),
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
                            right: BorderSide(color: lightGrey, width: 0.5),
                          ),
                        ),
                        child: InkWell(
                          child: new Container(
                            width: Get.width * 0.4,
                            child: new Center(
                              child: new Text(
                                "-",
                                style:
                                    new TextStyle(fontSize: 32.0, color: blue),
                              ),
                            ),
                          ),
                        ),
                      ),
                      onValue: (value) {
                        // _controller.updateData(value);
                        passengers = value;
                        print(value.toString());
                      },
                    ),
                    SizedBox(
                      height: spacing,
                    ),
                    TextField(
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.number,
                      obscureText: false,
                      controller: priceController,
                      decoration: InputDecoration(
                        hintText: "Price of ticket",
                        hintStyle: TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(
                            width: 0.1,
                            style: BorderStyle.solid,
                            color: borderBg,
                          ),
                        ),
                        contentPadding: EdgeInsets.all(20),
                      ),
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
                      child: Obx(
                        () => InkWell(
                          onTap: () {
                            !_controller.showLoaderCreate.value
                                ? createFlightLogic()
                                : null;
                          },
                          child: new Container(
                            width: Get.width * 0.4,
                            child: new Center(
                              child: new Text(
                                !_controller.showLoaderCreate.value
                                    ? "Create flight"
                                    : "Please wait..",
                                style: new TextStyle(
                                    fontSize: 18.0, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: spacing * 1 / 2,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2040),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                primary: blue,
                onPrimary: white,
                surface: grey,
                onSurface: white,
              ),
              dialogBackgroundColor: textGrey,
            ),
            child: child,
          );
        });

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      dateController
        ..text = DateFormat("MM/dd/yyyy").format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: dateController.text.length,
            affinity: TextAffinity.upstream));
    }
  }

  _selectTimeDeparture(BuildContext context) async {
    TimeOfDay newSelectedTime = await showTimePicker(
        context: context,
        initialTime: _selectedTimeDeparture != null
            ? _selectedTimeDeparture
            : TimeOfDay.now(),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                primary: blue,
                onPrimary: white,
                surface: grey,
                onSurface: white,
              ),
              dialogBackgroundColor: lightGrey,
            ),
            child: child,
          );
        });
    if (newSelectedTime != null) {
      _selectedTimeDeparture = newSelectedTime;
      final localizations = MaterialLocalizations.of(context);
      timeOfDepartureController
        ..text = localizations.formatTimeOfDay(_selectedTimeDeparture,
            alwaysUse24HourFormat: false)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: timeOfDepartureController.text.length,
            affinity: TextAffinity.upstream));
    }
  }

  _selectTimeArrival(BuildContext context) async {
    TimeOfDay newSelectedTime = await showTimePicker(
        context: context,
        initialTime: _selectedTimeArrival != null
            ? _selectedTimeArrival
            : TimeOfDay.now(),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                primary: blue,
                onPrimary: white,
                surface: grey,
                onSurface: white,
              ),
              dialogBackgroundColor: lightGrey,
            ),
            child: child,
          );
        });

    if (newSelectedTime != null) {
      _selectedTimeArrival = newSelectedTime;
      final localizations = MaterialLocalizations.of(context);
      timeOfArrivalController
        ..text = localizations.formatTimeOfDay(_selectedTimeArrival,
            alwaysUse24HourFormat: false)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: timeOfArrivalController.text.length,
            affinity: TextAffinity.upstream));
    }
  }

  /// ------------------------------------------------------------
  /// Method that handles click of create button
  /// ------------------------------------------------------------
  Future<void> createFlightLogic() async {
    if (dateController.text.toString().trim().isEmpty) {
      Get.snackbar("Error", "Please enter date");
      return;
    }

    if (timeOfDepartureController.text.toString().trim().isEmpty) {
      Get.snackbar("Error", "Please enter time of departure");
      return;
    }

    if (timeOfArrivalController.text.toString().trim().isEmpty) {
      Get.snackbar("Error", "Please enter time of arrival");
      return;
    }

    if (priceController.text.toString().trim().isEmpty) {
      Get.snackbar("Error", "Please enter price for ticket");
      return;
    }

    if (goingTo.toString().trim().isEmpty) {
      Get.snackbar("Error", "Please select going to");
      return;
    }

    if (departingFrom.toString().trim().isEmpty) {
      Get.snackbar("Error", "Please select departing from");
      return;
    }

    String oneWaySwitch = "";
    if (_controller.isSwitched.value) {
      oneWaySwitch = "1";
    } else {
      oneWaySwitch = "2";
    }

    _controller.showLoaderCreate.value = true;

    CreateFlightModel createFlightModel = await _controller.createFlight(
        departingFrom,
        goingTo,
        DateFormat("yyyy/MM/dd HH:mm:ss").format(_selectedDate),
        timeOfDepartureController.text,
        timeOfArrivalController.text,
        oneWaySwitch,
        priceController.text.trim(),
        passengers.toString());

    if (createFlightModel.status == "true") {
      _controller.showLoaderCreate.value = false;
      Get.snackbar("Success", createFlightModel.msg);
      _controller.selectedIndex.value = 0;
      _controllerHomePage.hitHomeApi();
    } else {
      _controller.showLoaderCreate.value = false;
      Get.snackbar("Error", createFlightModel.msg);
    }
  }
}
