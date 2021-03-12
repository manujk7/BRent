import 'package:brent/extras/constants.dart';
import 'package:brent/modules/home/controller/homeController.dart';
import 'package:brent/modules/home/view/components/create.dart';
import 'package:brent/modules/home/view/components/invite.dart';
import 'package:brent/modules/login/view/loginPage.dart';
import 'package:brent/modules/signUp/controller/signUpController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

import 'homePage.dart';

class Home extends StatelessWidget {
  final HomeController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              color: blue,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  new Container(
                    width: 72.0,
                    height: 72.0,
                    decoration: new BoxDecoration(
                      color: const Color(0xff7c94b6),
                      image: new DecorationImage(
                        image: new NetworkImage(
                            'https://miro.medium.com/max/560/1*MccriYX-ciBniUzRKAUsAw.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(50.0)),
                      border: new Border.all(
                        color: white,
                        width: 4.0,
                      ),
                    ),
                  ),
                  Text(
                    "Mr Devanur",
                    style: Theme.of(context).textTheme.headline5.copyWith(
                          color: white,
                        ),
                  ),
                  SizedBox(
                    width: spacing * 3,
                  ),
                  PopupMenuButton(
                    icon: Icon(
                      Icons.settings,
                      size: 32.0,
                      color: white,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0))),
                    padding: EdgeInsets.all(0.0),
                    itemBuilder: (context) {
                      var list = List<PopupMenuEntry<Object>>();
                      list.add(
                        PopupMenuDivider(
                          height: 20,
                        ),
                      );
                      list.add(
                        PopupMenuItem(
                          child: Text("Profile"),
                        ),
                      );
                      list.add(
                        PopupMenuDivider(
                          height: 20,
                        ),
                      );
                      list.add(
                        PopupMenuItem(
                          child: Text("About Us"),
                        ),
                      );
                      list.add(
                        PopupMenuDivider(
                          height: 20,
                        ),
                      );
                      list.add(
                        PopupMenuItem(
                          child: Text("Share App"),
                        ),
                      );
                      list.add(
                        PopupMenuDivider(
                          height: 20,
                        ),
                      );
                      list.add(
                        PopupMenuItem(
                          child: Text("Privacy Policy"),
                        ),
                      );
                      list.add(
                        PopupMenuDivider(
                          height: 20,
                        ),
                      );
                      return list;
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(
                () => IndexedStack(
                  index: _controller.selectedIndex.value,
                  children: [CreatePage(), HomePage(), InvitePage()],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.today_outlined,
              color: white,
            ),
            title: Text(
              'Create',
              style: TextStyle(color: white, fontSize: 16),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: white,
            ),
            title: Text(
              'Home',
              style: TextStyle(color: white, fontSize: 16),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.email,
              color: white,
            ),
            title: Text(
              'Inbox',
              style: TextStyle(color: white, fontSize: 16),
            ),
          ),
        ],
        currentIndex: _controller.selectedIndex.value,
        onTap: _controller.onItemTapped,
        backgroundColor: blue,
        iconSize: 36.0,
      ),
    );
  }
}
