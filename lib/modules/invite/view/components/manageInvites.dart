import 'package:brent/extras/constants.dart';
import 'package:brent/modules/home/controller/homeController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_number_picker/flutter_number_picker.dart';
import 'package:get/get.dart';

class ManageInvitePage extends StatelessWidget {
  final HomeController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: white,
        title: new Text(
          "Manage invitees",
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
                            Text(
                              "Originator",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: spacing * 1 / 2,
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemBuilder: (BuildContext context, int index) {
                                return new Container(
                                  padding:
                                      EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                                  child: new ListTile(
                                    title: new Text(
                                      "Cool $index",
                                      style: new TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    leading: Container(
                                      width: 60.0,
                                      height: 60.0,
                                      decoration: new BoxDecoration(
                                        color: const Color(0xff7c94b6),
                                        image: new DecorationImage(
                                          image: new NetworkImage(
                                              'https://miro.medium.com/max/560/1*MccriYX-ciBniUzRKAUsAw.png'),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: new BorderRadius.all(
                                            new Radius.circular(50.0)),
                                        border: new Border.all(
                                          color: white,
                                          width: 4.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              itemCount: 1,
                            ),
                            SizedBox(
                              height: spacing,
                            ),
                            Text(
                              "Invitees",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemBuilder: (BuildContext context, int index) {
                                return new Container(
                                  padding:
                                      EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                                  child: new ListTile(
                                    title: new Text(
                                      "Cool $index",
                                      style: new TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    leading: Container(
                                      width: 60.0,
                                      height: 60.0,
                                      decoration: new BoxDecoration(
                                        color: const Color(0xff7c94b6),
                                        image: new DecorationImage(
                                          image: new NetworkImage(
                                              'https://miro.medium.com/max/560/1*MccriYX-ciBniUzRKAUsAw.png'),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: new BorderRadius.all(
                                            new Radius.circular(50.0)),
                                        border: new Border.all(
                                          color: white,
                                          width: 4.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              itemCount: 3,
                            ),
                            SizedBox(
                              height: spacing,
                            ),
                            customButton(context, "Done", blue, 1, "/home"),
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
                            Text(
                              "Invite by email",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: spacing,
                            ),
                            inputField(context, "Email address", false,
                                TextInputType.emailAddress),
                            SizedBox(
                              height: spacing,
                            ),
                            Container(
                              width: Get.width * 1,
                              height: 56.0,
                              decoration: new BoxDecoration(
                                color: white,
                                border: new Border.all(
                                    color: Colors.black, width: 2.0),
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
                                      "Send invite",
                                      style: new TextStyle(
                                          fontSize: 18.0, color: Colors.black),
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
