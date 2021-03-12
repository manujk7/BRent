import 'package:brent/extras/constants.dart';
import 'package:brent/modules/home/controller/homeController.dart';
import 'package:brent/modules/login/view/loginPage.dart';
import 'package:brent/modules/signUp/controller/signUpController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

class HomePage extends StatelessWidget {
  final HomeController _controller = Get.find();
  final ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: lightGrey, width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: white,
                  margin: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
                  child: Column(
                    children: [
                      Flexible(
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12.0),
                                topRight: Radius.circular(12.0),
                              ),
                              child: Image.asset(
                                dummyPlaneHome,
                                fit: BoxFit.fitWidth,
                                width: double.maxFinite,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Icon(
                                Icons.share,
                                size: 32.0,
                                color: white,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: spacing * 1 / 2,
                      ),
                      Center(
                        child: Text(
                          "One-Way Deal",
                          style: Theme.of(context).textTheme.subtitle2.copyWith(
                                color: orange,
                              ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Prague",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                    color: grey,
                                  ),
                            ),
                            Text(
                              "Berlin",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                    color: grey,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Monday Mar 15",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                    color: grey,
                                  ),
                            ),
                            Text(
                              "\$5403",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                    color: grey,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  margin: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
                  child: ListView.builder(
                    itemCount: 12,
                    shrinkWrap: true,
                    controller: _scrollController,
                    itemBuilder: (BuildContext context, int index) {
                      return homeListView(context, index);
                    },
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
