import 'package:brent/extras/constants.dart';
import 'package:brent/modules/home/controller/homeController.dart';
import 'package:brent/modules/home/controller/inboxController.dart';
import 'package:brent/modules/home/model/homeModel.dart';
import 'package:brent/modules/invite/controller/inviteController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageInvitePage extends StatelessWidget {
  final HomeController _controllerHome = Get.find();
  final InboxPageController _controller = Get.find();
  final InviteController _controllerInvite = Get.find();
  AllFlight data;

  @override
  Widget build(BuildContext context) {
    if (Get.arguments != null) {
      data = Get.arguments;
    }
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
                                      "${_controllerHome.getProfile().name}",
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
                                          image: new NetworkImage(_controllerHome
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
                            _controller.getAllUsersModel().allusers != null &&
                                    _controller
                                            .getAllUsersModel()
                                            .allusers
                                            .length >
                                        0
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    primary: false,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return new Container(
                                        padding: EdgeInsets.fromLTRB(
                                            0.0, 4.0, 0.0, 4.0),
                                        child: new ListTile(
                                          onTap: () {
                                            showAlert(
                                                Get.context,
                                                _controller
                                                    .getAllUsersModel()
                                                    .allusers[index]
                                                    .email);
                                          },
                                          title: new Text(
                                            "${_controller.getAllUsersModel().allusers[index].name}",
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
                                                image: new NetworkImage(_controller
                                                        .getAllUsersModel()
                                                        .allusers[index]
                                                        .profilePic
                                                        .isEmpty
                                                    ? "https://pngimage.net/wp-content/uploads/2018/05/dummy-profile-image-png-2.png"
                                                    : _controller
                                                        .getAllUsersModel()
                                                        .allusers[index]
                                                        .profilePic),
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius: new BorderRadius
                                                      .all(
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
                                    itemCount: _controller
                                        .getAllUsersModel()
                                        .allusers
                                        .length,
                                  )
                                : Container(
                                    child: Center(
                                      child: Text(
                                        "No data found..",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2
                                            .copyWith(
                                              color: orange,
                                            ),
                                      ),
                                    ),
                                  ),
                            SizedBox(
                              height: spacing,
                            ),
                            Container(
                              width: Get.width * 1,
                              height: 56.0,
                              decoration: new BoxDecoration(
                                color: blue,
                                border: new Border.all(color: blue, width: 2.0),
                                borderRadius: new BorderRadius.circular(6.0),
                              ),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: new Container(
                                  width: Get.width * 0.4,
                                  child: new Center(
                                    child: new Text(
                                      "Done",
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
                                  // Navigator.pop(context);
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

  showAlert(BuildContext context, String email) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Invite'),
          content: Text("Are you sure you want to invite this user?"),
          actions: <Widget>[
            TextButton(
              child: Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Yes"),
              onPressed: () {
                hitApi(email);

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  hitApi(String email) async {
    var statusMessageModel =
        await _controllerInvite.createNotification("$email", data.id);
    if (statusMessageModel.status == "true") {
      Get.snackbar("Sent", statusMessageModel.msg);
    } else {
      Get.snackbar("Error", statusMessageModel.msg);
    }
  }
}
