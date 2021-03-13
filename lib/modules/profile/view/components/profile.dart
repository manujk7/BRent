import 'dart:io';
import 'package:brent/extras/constants.dart';
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

class ProfilePage extends StatelessWidget {
  final ProfileController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(12.0),
                child: GestureDetector(
                  onTap: () {
                    if (_controller.state.value == AppState.free)
                      _pickImage(Get.context);
                    else if (_controller.state.value == AppState.cropped)
                      _clearImage();
                  },
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
              ),
              SizedBox(
                height: spacing * 1 / 2,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(32.0, 12.0, 32.0, 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: spacing * 1 / 2,
                    ),
                    inputField(context, "Full Name", false, TextInputType.text),
                    SizedBox(
                      height: spacing * 1 / 2,
                    ),
                    inputField(
                        context, "Email Id", false, TextInputType.emailAddress),
                    SizedBox(
                      height: spacing * 1 / 2,
                    ),
                    inputField(
                        context, "Phone Number", false, TextInputType.phone),
                    SizedBox(
                      height: spacing * 1 / 2,
                    ),
                    GestureDetector(
                      onTap: () {
                        updatingPassword(context);
                      },
                      child: TextField(
                        enabled: false,
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(fontSize: 14),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              width: 0.5,
                              style: BorderStyle.none,
                            ),
                          ),
                          contentPadding: EdgeInsets.all(20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: spacing * 1 / 2,
                    ),
                    Container(
                      height: 150,
                      child: TextField(
                        textAlign: TextAlign.start,
                        expands: true,
                        keyboardType: TextInputType.multiline,
                        minLines: null,
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: "Address",
                          hintStyle: TextStyle(fontSize: 14),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              width: 0.5,
                              style: BorderStyle.none,
                            ),
                          ),
                          contentPadding: EdgeInsets.all(20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: spacing * 1 / 2,
              ),
              SizedBox(
                height: spacing * 1 / 2,
              ),
              customButton(context, "Update", green, 0.6, "/home"),
              SizedBox(
                height: spacing * 1 / 2,
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 12.0, right: 12.0, bottom: 12.0),
                child: Divider(
                  color: Colors.black,
                  thickness: 2.0,
                ),
              ),
            ],
          ),
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
