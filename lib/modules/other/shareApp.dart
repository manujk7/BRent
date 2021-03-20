import 'package:brent/extras/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShareAppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: white,
        title: new Text(
          "Share app",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: new IconThemeData(color: blue),
      ),
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Container(
          height: Get.height,
          child: Column(
            children: <Widget>[
              Container(
                height: 30,
              ),
              Material(
                elevation: 2,
                color: white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Container(
                  margin:
                      EdgeInsets.only(top: 32, left: 16, right: 16, bottom: 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: spacing,
                      ),
                      Center(
                        child: Text(
                          "If you know a frequent flyer, share the app and earn a referral bonus.",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: spacing,
                      ),
                      Center(
                        child: Text(
                          "wP2bz",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 32,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: spacing,
                      ),
                      Container(
                        width: Get.width * 1,
                        height: 56.0,
                        decoration: new BoxDecoration(
                          color: white,
                          border:
                              new Border.all(color: Colors.black, width: 2.0),
                          borderRadius: new BorderRadius.circular(6.0),
                        ),
                        child: InkWell(
                          onTap: () {
                            Get.toNamed("/invitePage");
                          },
                          child: new Container(
                            width: Get.width * 0.4,
                            child: new Center(
                              child: new Text(
                                "Generate code",
                                style: new TextStyle(
                                    fontSize: 18.0, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: spacing * 2,
                      ),
                      inputField(context, "Email address", false,
                          TextInputType.emailAddress),
                      SizedBox(
                        height: spacing,
                      ),
                      customButton(context, "Share code", blue, 1, "/home"),
                      SizedBox(
                        height: spacing,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
