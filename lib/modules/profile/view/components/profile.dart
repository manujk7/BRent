import 'dart:io';
import 'package:brent/extras/constants.dart';
import 'package:brent/modules/home/controller/homeController.dart';
import 'package:brent/modules/profile/controller/profileController.dart';
import 'package:flutter/material.dart';
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
                                    child: InkWell(
                                      onTap: () {
                                        Get.toNamed("/home");
                                      },
                                      child: new Container(
                                        width: Get.width * 0.4,
                                        child: new Center(
                                          child: new Text(
                                            "Save changes",
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
      _controller.imageFile = File(image.path);
      _cropImage();
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
    }
  }

  void updatingPassword(BuildContext context) {
    TextEditingController oldPasswordController = new TextEditingController();
    TextEditingController newPasswordController = new TextEditingController();
    TextEditingController confirmPasswordController =
        new TextEditingController();
    var isShowDialog = false;
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        // return object of type Dialog
        return Center(
            child: SingleChildScrollView(
          child: AlertDialog(
            backgroundColor: Colors.white,
            contentPadding: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            elevation: 0,
            content: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Flexible(
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: blue,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8)),
                      ),
                      child: Text(
                        "Update Password",
                        style: TextStyle(color: white),
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding:
                              EdgeInsets.only(left: 24, right: 24, top: 24),
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: lightGrey),
                              hintText: 'Old Password',

                              /*icon: Image.asset(
                              "assets/icons/ic_email.png",
                              height: 24,
                            ),*/
                            ),
                            style: TextStyle(color: grey),
                            controller: oldPasswordController,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          height: 2,
                          color: white,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 24, right: 24, top: 24),
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: lightGrey),
                              hintText: 'New Password',

                              /*icon: Image.asset(
                              "assets/icons/ic_email.png",
                              height: 24,
                            ),*/
                            ),
                            style: TextStyle(color: lightGrey),
                            controller: newPasswordController,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          height: 2,
                          color: white,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 24, right: 24, top: 24),
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: lightGrey),
                              hintText: 'Confirm Password',

                              /*icon: Image.asset(
                              "assets/icons/ic_email.png",
                              height: 24,
                            ),*/
                            ),
                            style: TextStyle(color: lightGrey),
                            controller: confirmPasswordController,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          height: 2,
                          color: white,
                        ),
                        GestureDetector(
                          onTap: () async {
                            Constants.hideKeyBoard();
                            if (oldPasswordController.text.toString().isEmpty) {
                              Get.snackbar(
                                  "Invalid", "Please enter old password");
                              return;
                            }
                            if (newPasswordController.text.toString().isEmpty) {
                              Get.snackbar(
                                  "Invalid", "Please enter new password");
                              return;
                            }
                            if (newPasswordController.text.toString() !=
                                confirmPasswordController.text.toString()) {
                              Get.snackbar("Invalid",
                                  "New password and Confirm password do not match.");
                              return;
                            }
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: blue,
                            ),
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(
                              top: 12,
                              bottom: 12,
                              left: 24,
                              right: 24,
                            ),
                            margin: EdgeInsets.all(24),
                            child: Text(
                              !isShowDialog ? "DONE" : "Loading",
                              style: TextStyle(
                                color: white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
      },
    );
  }
}
