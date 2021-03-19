import 'package:brent/extras/constants.dart';
import 'package:brent/modules/signUp/controller/signUpController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  final SignUpController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Create an account",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: blue),
      ),
      backgroundColor: background,
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: SingleChildScrollView(
          child: Container(
            color: background,
            width: Get.width,
            margin: EdgeInsets.fromLTRB(0.0, 24.0, 0.0, 16.0),
            child: Material(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              color: white,
              child: Container(
                margin: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
                child: Column(
                  children: [
                    Image.asset(
                      logoImage,
                      height: 200.0,
                    ),
                    SizedBox(
                      height: spacing * 1 / 2,
                    ),
                    SizedBox(
                      height: spacing,
                    ),
                    inputField(context, "Full Name", false, TextInputType.text),
                    SizedBox(
                      height: spacing,
                    ),
                    inputField(context, "Email address", false,
                        TextInputType.emailAddress),
                    SizedBox(
                      height: spacing,
                    ),
                    inputField(
                        context, "Phone Number", false, TextInputType.phone),
                    SizedBox(
                      height: spacing,
                    ),
                    Obx(
                      () => TextField(
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.text,
                        textAlignVertical: TextAlignVertical.center,
                        obscureText: _controller.isHidden.value,
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(fontSize: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                width: 0.5,
                                style: BorderStyle.none,
                                color: lightGrey),
                          ),
                          contentPadding: EdgeInsets.all(20),
                          suffix: InkWell(
                            onTap: _controller.togglePasswordView,
                            child: Icon(
                              _controller.isHidden.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_rounded,
                              color: blue,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: spacing,
                    ),
                    Obx(
                      () => TextField(
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.text,
                        textAlignVertical: TextAlignVertical.center,
                        obscureText: _controller.isHiddenConfirm.value,
                        decoration: InputDecoration(
                          hintText: "Confirm password",
                          hintStyle: TextStyle(fontSize: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                width: 0.5,
                                style: BorderStyle.none,
                                color: lightGrey),
                          ),
                          contentPadding: EdgeInsets.all(20),
                          suffix: InkWell(
                            onTap: _controller.toggleConfirmPasswordView,
                            child: Icon(
                              _controller.isHiddenConfirm.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_rounded,
                              color: blue,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: spacing,
                    ),
                    inputField(context, "Address", false, TextInputType.text),
                    SizedBox(
                      height: spacing,
                    ),
                    inputField(context, "City", false, TextInputType.text),
                    SizedBox(
                      height: spacing,
                    ),
                    Row(
                      children: [
                        Flexible(
                          flex: 3,
                          child: TextField(
                            onTap: () {},
                            textAlign: TextAlign.start,
                            readOnly: true,
                            keyboardType: TextInputType.text,
                            obscureText: false,
                            decoration: InputDecoration(
                              suffix: InkWell(
                                onTap: () {},
                                child: Icon(
                                  Icons.keyboard_arrow_down_sharp,
                                  color: blue,
                                ),
                              ),
                              hintText: "State",
                              hintStyle: TextStyle(fontSize: 16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    width: 0.5,
                                    style: BorderStyle.none,
                                    color: lightGrey),
                              ),
                              contentPadding: EdgeInsets.all(20),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: spacing,
                        ),
                        Flexible(
                          flex: 2,
                          child: inputField(
                              context, "Zip code", false, TextInputType.text),
                        )
                      ],
                    ),
                    SizedBox(
                      height: spacing,
                    ),
                    inputField(context, "Referral code (optional)", false,
                        TextInputType.text),
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
                        onTap: () {},
                        child: new Container(
                          width: Get.width * 0.4,
                          child: new Center(
                            child: new Text(
                              "Create an account",
                              style: new TextStyle(
                                  fontSize: 18.0, color: Colors.white),
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
}
