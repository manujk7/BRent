import 'dart:convert';
import 'dart:io';
import 'package:brent/extras/constants.dart';
import 'package:brent/modules/home/controller/homeController.dart';
import 'package:brent/modules/login/model/userModel.dart';
import 'package:brent/modules/profile/controller/profileController.dart';
import 'package:brent/services/prefrences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

enum AppState {
  free,
  picked,
  cropped,
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfilePage> {
  final ProfileController _controller = Get.find();
  final HomeController _controllerHome = Get.find();
  TextEditingController emailController = new TextEditingController();
  final numberController = new TextEditingController();
  final addressController = new TextEditingController();
  final cityController = new TextEditingController();
  final zipCodeController = new TextEditingController();
  String stateValue = "";
  final _prefs = SharedPrefs();

  @override
  void initState() {
    super.initState();
    setData();
  }

  void setData() {
    if (_controllerHome.getProfile != null) {
      emailController.text = _controllerHome.getProfile().email;
      numberController.text = _controllerHome.getProfile().phone;
      addressController.text = _controllerHome.getProfile().address;
      cityController.text = _controllerHome.getProfile().city;
      zipCodeController.text = _controllerHome.getProfile().zipcode;
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
          "Edit profile",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: new IconThemeData(color: blue),
      ),
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: SingleChildScrollView(
          child: _controllerHome.getProfile != null
              ? Container(
                  margin: EdgeInsets.only(bottom: 12),
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
                            color: white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: 32, left: 16, right: 16, bottom: 12),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: spacing * 5 / 4,
                                  ),
                                  Center(
                                    child: Obx(
                                      () => Text(
                                        _controllerHome.getProfile().name,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: spacing * 5 / 4,
                                  ),
                                  Text(
                                    "Email address",
                                    style: TextStyle(
                                        color: textGrey, fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: spacing * 1 / 2,
                                  ),
                                  TextField(
                                    textAlign: TextAlign.start,
                                    keyboardType: TextInputType.emailAddress,
                                    obscureText: false,
                                    controller: emailController,
                                    enabled: false,
                                    decoration: InputDecoration(
                                      hintText: "Email address",
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
                                    "Phone number",
                                    style: TextStyle(
                                        color: textGrey, fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: spacing * 1 / 2,
                                  ),
                                  TextField(
                                    textAlign: TextAlign.start,
                                    keyboardType: TextInputType.phone,
                                    obscureText: false,
                                    controller: numberController,
                                    decoration: InputDecoration(
                                      hintText: "Phone Number",
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
                                    "Address",
                                    style: TextStyle(
                                        color: textGrey, fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: spacing * 1 / 2,
                                  ),
                                  TextField(
                                    textAlign: TextAlign.start,
                                    keyboardType: TextInputType.text,
                                    obscureText: false,
                                    controller: addressController,
                                    decoration: InputDecoration(
                                      hintText: "Address",
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
                                    "City",
                                    style: TextStyle(
                                        color: textGrey, fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: spacing * 1 / 2,
                                  ),
                                  TextField(
                                    textAlign: TextAlign.start,
                                    keyboardType: TextInputType.text,
                                    obscureText: false,
                                    controller: cityController,
                                    decoration: InputDecoration(
                                      hintText: "City",
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
                                  Row(
                                    children: [
                                      Flexible(
                                        flex: 3,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "State",
                                              style: TextStyle(
                                                  color: textGrey,
                                                  fontSize: 16),
                                            ),
                                            SizedBox(
                                              height: spacing * 1 / 2,
                                            ),
                                            DropdownButtonFormField<String>(
                                              onChanged: (value) =>
                                                  stateValue = value,
                                              icon: Icon(
                                                Icons.arrow_drop_down,
                                                color: blue,
                                              ),
                                              decoration: InputDecoration(
                                                hintText: "Please select state",
                                                hintStyle:
                                                    TextStyle(fontSize: 16),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  borderSide: BorderSide(
                                                    width: 0.1,
                                                    style: BorderStyle.solid,
                                                    color: borderBg,
                                                  ),
                                                ),
                                              ),
                                              items: <DropdownMenuItem<String>>[
                                                DropdownMenuItem<String>(
                                                  value: "California",
                                                  child: Text("California"),
                                                ),
                                                DropdownMenuItem<String>(
                                                  value: "Texas",
                                                  child: Text("Texas"),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: spacing,
                                      ),
                                      Flexible(
                                        flex: 2,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Zip code",
                                              style: TextStyle(
                                                  color: textGrey,
                                                  fontSize: 16),
                                            ),
                                            SizedBox(
                                              height: spacing * 1 / 2,
                                            ),
                                            TextField(
                                              textAlign: TextAlign.start,
                                              keyboardType:
                                                  TextInputType.number,
                                              obscureText: false,
                                              controller: zipCodeController,
                                              decoration: InputDecoration(
                                                hintText: "Zip code",
                                                hintStyle:
                                                    TextStyle(fontSize: 16),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  borderSide: BorderSide(
                                                    width: 0.1,
                                                    style: BorderStyle.solid,
                                                    color: borderBg,
                                                  ),
                                                ),
                                                contentPadding:
                                                    EdgeInsets.all(20),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: spacing * 2,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed("/changePassword");
                                    },
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Change password",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            //fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_right,
                                          color: blue,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: spacing * 2,
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
                                    child: Obx(
                                      () => InkWell(
                                        onTap: () {
                                          !_controller.showLoader.value
                                              ? updateProfile()
                                              : null;
                                        },
                                        child: new Container(
                                          width: Get.width * 0.4,
                                          child: new Center(
                                            child: new Text(
                                              !_controller.showLoader.value
                                                  ? "Save changes"
                                                  : "Please Wait..",
                                              style: new TextStyle(
                                                  fontSize: 18.0,
                                                  color: Colors.white),
                                            ),
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
                          ),
                        ],
                      ),
                      Obx(
                        () => !_controller.showLoader.value
                            ? Positioned(
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
                                        image: NetworkImage(_controllerHome
                                                        .getProfile()
                                                        .profilePic !=
                                                    null &&
                                                _controllerHome
                                                    .getProfile()
                                                    .profilePic
                                                    .isNotEmpty
                                            ? _controllerHome
                                                .getProfile()
                                                .profilePic
                                            : "https://pngimage.net/wp-content/uploads/2018/05/dummy-profile-image-png-2.png"),
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
                            : Container(),
                      ),
                      Positioned(
                        top: 16,
                        right: 165,
                        child: GestureDetector(
                          onTap: () {
                            _pickImage(context);
                          },
                          child: SvgPicture.asset(
                            'assets/edit.svg',
                            height: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
        ),
      ),
    );
  }

  Future<Null> _pickImage(BuildContext context) async {
    final imageSource = await showDialog<ImageSource>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Select the image source"),
        actions: <Widget>[
          MaterialButton(
            child: Text("Camera"),
            onPressed: () => Navigator.pop(context, ImageSource.camera),
          ),
          MaterialButton(
            child: Text("Gallery"),
            onPressed: () => Navigator.pop(context, ImageSource.gallery),
          )
        ],
      ),
    );

    if (imageSource != null) {
      var image =
          await ImagePicker().getImage(source: imageSource, imageQuality: 60);
      if (image != null) {
        _controller.imageFile = File(image.path);
        _cropImage();
      }
    }
  }

  void _clearImage() {
    _controller.imageFile = null;
    _controller.state.value = AppState.free;
  }

  Future _cropImage() async {
    File croppedFile = await ImageCropper.cropImage(
      sourcePath: _controller.imageFile.path,
      aspectRatioPresets: Platform.isAndroid
          ? [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9
            ]
          : [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio5x3,
              CropAspectRatioPreset.ratio5x4,
              CropAspectRatioPreset.ratio7x5,
              CropAspectRatioPreset.ratio16x9
            ],
    );
    if (croppedFile != null) {
      _controller.imageFile = croppedFile;
      _controller.state.value = AppState.cropped;
      _controllerHome.userModel.value =
          await _controllerHome.updateProfilePic(_controller.imageFile);
      if (_controllerHome.userModel().status == "true") {
        _clearImage();
        _prefs.saveProfile(jsonEncode(_controllerHome.userModel().profile));
        _controllerHome.getProfile.value = _controllerHome.userModel().profile;
      }
    }
  }

  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(em);
  }

  /// ------------------------------------------------------------
  /// Method that handles click of update profile button
  /// ------------------------------------------------------------
  Future<void> updateProfile() async {
    if (emailController.text.toString().trim().isEmpty) {
      Get.snackbar("Error", "Please enter email id");
      return;
    }

    if (numberController.text.toString().trim().isEmpty) {
      Get.snackbar("Error", "Please enter number");
      return;
    }

    if (addressController.text.toString().trim().isEmpty) {
      Get.snackbar("Error", "Please enter address");
      return;
    }

    if (cityController.text.toString().trim().isEmpty) {
      Get.snackbar("Error", "Please enter city");
      return;
    }

    if (!isEmail(emailController.text.toString().trim())) {
      Get.snackbar("Error", "Please enter valid email id");
      return;
    }

    if (stateValue.isEmpty) {
      Get.snackbar("Error", "Please select state");
      return;
    }

    _controller.showLoader.value = true;

    UserModel userModel = await _controllerHome.updateProfile(
      numberController.text,
      addressController.text,
      cityController.text,
      stateValue,
      zipCodeController.text,
    );

    if (userModel.status == "true") {
      _controller.showLoader.value = false;
      Get.snackbar("Success", userModel.msg);
      _prefs.saveProfile(jsonEncode(_controllerHome.userModel().profile));
      _controllerHome.getProfile.value = _controllerHome.userModel().profile;
    } else {
      _controller.showLoader.value = false;
      Get.snackbar("Error", userModel.msg);
    }
  }
}
