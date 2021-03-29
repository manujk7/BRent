import 'package:brent/extras/constants.dart';
import 'package:brent/modules/home/controller/inboxController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:get/get.dart';

class InboxPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InboxPageState();
  }
}

class _InboxPageState extends State<InboxPage> {
  final InboxPageController _controller = Get.find();

  @override
  void initState() {
    super.initState();
    _controller.getAllUsersApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: SingleChildScrollView(
          child: !_controller.showLoader.value
              ? Container(
                  margin: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                  child: _controller.getAllUsersModel != null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                  SizedBox(
                                    height: spacing,
                                  ),
                                  Text(
                                    "List of all Users",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                        16.0, 16.0, 16.0, 0.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                          height: spacing * 1 / 2,
                                        ),
                                        _controller
                                                        .getAllUsersModel()
                                                        .allusers !=
                                                    null &&
                                                _controller
                                                        .getAllUsersModel()
                                                        .allusers
                                                        .length >
                                                    0
                                            ? ListView.builder(
                                                shrinkWrap: true,
                                                primary: false,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return new Container(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0.0, 4.0, 0.0, 4.0),
                                                    child: new ListTile(
                                                      onTap: () {
                                                        String message =
                                                            "This is a test message!";
                                                        List<String> recipents =
                                                            [
                                                          "${_controller.getAllUsersModel().allusers[index].phone}"
                                                        ];

                                                        _sendSMS(
                                                            message, recipents);
                                                      },
                                                      title: new Text(
                                                        "${_controller.getAllUsersModel().allusers[index].name}",
                                                        style: new TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      leading: Container(
                                                        width: 60.0,
                                                        height: 60.0,
                                                        decoration:
                                                            new BoxDecoration(
                                                          color: const Color(
                                                              0xff7c94b6),
                                                          image:
                                                              new DecorationImage(
                                                            image: new NetworkImage(_controller
                                                                    .getAllUsersModel()
                                                                    .allusers[
                                                                        index]
                                                                    .profilePic
                                                                    .isEmpty
                                                                ? 'https://miro.medium.com/max/560/1*MccriYX-ciBniUzRKAUsAw.png'
                                                                : _controller
                                                                    .getAllUsersModel()
                                                                    .allusers[
                                                                        index]
                                                                    .profilePic),
                                                            fit: BoxFit.cover,
                                                          ),
                                                          borderRadius:
                                                              new BorderRadius
                                                                  .all(new Radius
                                                                      .circular(
                                                                  50.0)),
                                                          border:
                                                              new Border.all(
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
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
                )
              : Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator()),
        ),
      ),
    );
  }

  void _sendSMS(String message, List<String> recipents) async {
    String _result = await sendSMS(message: message, recipients: recipents)
        .catchError((onError) {
      print(onError);
    });

    print(_result);
  }
}
