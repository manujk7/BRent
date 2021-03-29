import 'dart:convert';

import 'package:brent/extras/constants.dart';
import 'package:brent/modules/home/controller/homeController.dart';
import 'package:brent/modules/home/view/components/create.dart';
import 'package:brent/modules/home/view/components/homePage.dart';
import 'package:brent/modules/home/view/components/inbox.dart';
import 'package:brent/modules/home/view/components/settings.dart';
import 'package:brent/services/prefrences.dart';
import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    getProfile();
  }

  Future<void> getProfile() async {
    if (GetPlatform.isIOS) {
      deviceType = "2";
    } else {
      deviceType = "1";
    }
    _controller.userModel.value =
        await _controller.getProfileApi(deviceType, deviceId);
    if (_controller.userModel().status == "true") {
      _prefs.saveProfile(jsonEncode(_controller.userModel().profile));
    }
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
