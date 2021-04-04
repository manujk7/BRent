import 'dart:convert';
import 'dart:io';
import 'package:brent/extras/constants.dart';
import 'package:brent/modules/home/controller/homeController.dart';
import 'package:brent/modules/home/view/components/create.dart';
import 'package:brent/modules/home/view/components/homePage.dart';
import 'package:brent/modules/home/view/components/inbox.dart';
import 'package:brent/modules/home/view/components/settings.dart';
import 'package:brent/services/prefrences.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'homePage.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  final HomeController _controller = Get.find();

  String pageTitle = "home";
  String deviceId = "123";
  String deviceType = "";
  final _prefs = SharedPrefs();
  final _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    getProfile();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('on message $message');
        // var jj = json.decode(message.toString());
        var body = message['notification']['body'];
        var title = message['notification']['title'];
        var bookingId = message['booking_id'];

        if(bookingId == null || bookingId == "null"){
          bookingId = "";
        }

        if (title == null || title == "null") {
          title = "Invite!";
        }
        showDialogPush(title, body, bookingId);
      },
      onResume: (Map<String, dynamic> message) async {
        print(message);
      },
      onLaunch: (Map<String, dynamic> message) async {
        print(message);
      },
    );
  }

  void showDialogPush(String title, String body, String bookingId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return Center(
            child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10),
                child: AlertDialog(
                  backgroundColor: Colors.white,
                  contentPadding: EdgeInsets.only(
                    left: 0,
                    right: 0,
                    top: 40,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  elevation: 0,
                  content: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(4),
                          child: Column(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(
                                  top: 12,
                                  left: 24,
                                  right: 24,
                                ),
                                // margin: EdgeInsets.all(20),
                                child: Text(
                                  title,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(
                                  top: 12,
                                  bottom: 12,
                                  left: 24,
                                  right: 24,
                                ),
                                // margin: EdgeInsets.all(20),
                                child: Text(
                                  body,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Container(
                                height: 15,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                  Get.toNamed('/bookFlightPage',
                                      arguments: ["2", bookingId]);
                                },
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(80)),
                                    color: blue,
                                  ),
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(
                                    top: 12,
                                    bottom: 12,
                                    left: 24,
                                    right: 24,
                                  ),
                                  margin: EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                    bottom: 12,
                                    top: 12,
                                  ),
                                  child: Text(
                                    "okay",
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
              ),
              Container(
                  padding: EdgeInsets.all(20),
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: borderBg,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: white,
                      width: 3,
                    ),
                  ),
                  child: SvgPicture.asset('assets/notification.svg')),
            ],
          ),
        ));
      },
    );
  }

  void iosPermission() {
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
  }

  Future<void> getProfile() async {
    if (Platform.isIOS) iosPermission();
    _firebaseMessaging.getToken().then((token) async {
      print("TTTTOOOKKEEENNNZZZZZZZZZZZZ : " + token);
      deviceId = token;
      if (Platform.isIOS) {
        deviceType = "2";
      } else {
        deviceType = "1";
      }
      _controller.userModel.value =
          await _controller.getProfileApi(deviceType, deviceId);
      if (_controller.userModel().status == "true") {
        _prefs.saveProfile(jsonEncode(_controller.userModel().profile));
      }
    });

    _controller.getProfileData();
  }

  /*
  * On Bottom Navigation item click Listener
  * */
  void _onItemTapped(int index) {
    setState(() {
      _controller.selectedIndex.value = index;
      getPageTitle(index);
      if (index == 1) {
      } else if (index == 2) {
      } else if (index == 3) {
      } else {}
    });
  }

  void getPageTitle(int index) {
    if (index == 0) {
      pageTitle = "Your upcoming flights";
    } else if (index == 1) {
      pageTitle = "Create a new flight";
    } else if (index == 2) {
      pageTitle = "Inbox";
    } else if (index == 3) {
      pageTitle = "Settings";
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
          pageTitle,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Column(
          children: [
            Obx(
              () => Expanded(
                child: IndexedStack(
                  index: _controller.selectedIndex.value,
                  children: [
                    HomePage(),
                    CreatePage(),
                    InboxPage(),
                    SettingsPage()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      /*
          * Bottom Navigation bar of Dashboard
          * */
      bottomNavigationBar: Obx(
        () => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(24), topLeft: Radius.circular(24)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/icons/home.png')),
                  activeIcon:
                      ImageIcon(AssetImage('assets/icons/home_selected.png')),
                  title: Text('Home'),
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/icons/create.png')),
                  activeIcon:
                      ImageIcon(AssetImage('assets/icons/create_selected.png')),
                  title: Text('Create'),
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/icons/inbox.png')),
                  title: Text('Inbox'),
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/icons/settings.png')),
                  activeIcon: ImageIcon(
                      AssetImage('assets/icons/settings_selected.png')),
                  title: Text('Settings'),
                ),
              ],

              currentIndex: _controller.selectedIndex.value,
              selectedFontSize: 10,
              unselectedFontSize: 10,
              type: BottomNavigationBarType.fixed,
              // unselectedIconTheme: ColorNames.colorLightGrey,
              unselectedItemColor: Colors.black,
              selectedItemColor: blue,
              onTap: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }
}
