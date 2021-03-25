import 'package:brent/extras/constants.dart';
import 'package:brent/modules/firstPage/view/firstPage.dart';
import 'package:brent/modules/home/controller/homeController.dart';
import 'package:brent/services/commonMessageStatusModel.dart';
import 'package:brent/services/prefrences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  final HomeController _controller = Get.find();
  final profileOptions = [
    'Edit profile',
    'About us',
    'Share app',
    'Privacy policy',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Container(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Column(
                children: [
                  Container(
                    height: 70,
                  ),
                  Material(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(
                            height: spacing * 2,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 12,
                              bottom: 10,
                            ),
                            child: Obx(
                              () => _controller.getProfile.value != null
                                  ? Text(
                                      _controller.getProfile().name,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    )
                                  : Container(),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              bottom: 10,
                            ),
                            padding: EdgeInsets.only(top: 8),
                            child: ListView.builder(
                              itemCount: profileOptions.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext ctxt, int index) {
                                var model = profileOptions[index];
                                return profileItemView(model, index);
                              },
                            ),
                          ),
                          Container(
                            width: Get.width * 1,
                            height: 56.0,
                            margin: EdgeInsets.only(
                              top: 10,
                              bottom: 10,
                            ),
                            decoration: new BoxDecoration(
                              color: white,
                              border: new Border.all(
                                  color: Colors.black, width: 2.0),
                              borderRadius: new BorderRadius.circular(6.0),
                            ),
                            child: Obx(
                              () => InkWell(
                                onTap: () {
                                  !_controller.showLoader.value
                                      ? logout()
                                      : null;
                                },
                                child: new Container(
                                  width: Get.width * 0.4,
                                  child: new Center(
                                    child: new Text(
                                      !_controller.showLoader.value
                                          ? "Log out"
                                          : "Please Wait..",
                                      style: new TextStyle(
                                          fontSize: 18.0, color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 15.0,
                // (background container size) - (circle height / 2)
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 110.0,
                    width: 110.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://pngimage.net/wp-content/uploads/2018/05/dummy-profile-image-png-2.png"),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(
                        color: white,
                        width: 5,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /*
  * This is the list cell for profile item
  * */
  Widget profileItemView(String model, int index) {
    return Column(
      children: <Widget>[
        ListTile(
          contentPadding: EdgeInsets.only(top: 8, bottom: 8),
          onTap: () {
            if (index == 0) {
              Get.toNamed('/profile');
            } else if (index == 1) {
            } else if (index == 2) {
              Get.toNamed('/shareApp');
            } else if (index == 3) {
            } else {}
          },
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: blue,
          ),
          title: Text(
            model,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              //fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 0.5,
          margin: EdgeInsets.only(
            left: 12,
            right: 20,
          ),
          color: white,
        )
      ],
    );
  }

  /// ------------------------------------------------------------
  /// Method that handles click of logout button
  /// ------------------------------------------------------------
  Future<void> logout() async {
    _controller.showLoader.value = true;
    StatusMessageModel userModel = await _controller.logout();
    if (userModel.status == "true") {
      _controller.showLoader.value = false;
      final _prefs = SharedPrefs();
      _prefs.clearPrefs();
      Get.snackbar("Success", userModel.msg);
      Get.offAll(() => FirstPage());
    } else {
      _controller.showLoader.value = false;
      Get.snackbar("Error", userModel.msg);
    }
  }
}
