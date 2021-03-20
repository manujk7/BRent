import 'package:brent/extras/constants.dart';
import 'package:brent/modules/home/controller/homeController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final HomeController _controller = Get.find();
  final ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: background,
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Container(
          margin: EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
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
    );
  }

  Widget homeListView(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/bookFlightPage');
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
        child: Material(
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
                    Flexible(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.0),
                          topRight: Radius.circular(12.0),
                          bottomLeft: Radius.circular(12.0),
                          bottomRight: Radius.circular(12.0),
                        ),
                        child: Image.asset(
                          dummyPlaneHome,
                          fit: BoxFit.fitWidth,
                          width: double.maxFinite,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: spacing * 1 / 2,
                    ),
                    Text(
                      "New York to San Francisco",
                      style: Theme.of(context).textTheme.headline5.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "One-Way Deal",
                      style: Theme.of(context).textTheme.subtitle2.copyWith(
                            color: orange,
                          ),
                    ),
                    SizedBox(
                      height: spacing,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "03/14/2021 (9:00 a.m.)",
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                                color: Colors.black,
                              ),
                        ),
                        Text(
                          "\$7,500.00 per seat",
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                                color: Colors.black,
                              ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: spacing,
                    ),
                    GestureDetector(
                      onTap: () {
                        _controller
                            .onLayoutCollapsed(_controller.expandFlag.value);
                      },
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "View Invitees",
                          style: Theme.of(context).textTheme.headline5.copyWith(
                                color: blue,
                                fontWeight: FontWeight.bold,
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
              Obx(
                () => ExpandableContainer(
                  expanded: _controller.expandFlag.value,
                  child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (BuildContext context, int index) {
                      return new Container(
                        padding: EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
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
                          trailing: SvgPicture.asset('assets/tick.svg'),
                        ),
                      );
                    },
                    itemCount: 2,
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

class ExpandableContainer extends StatelessWidget {
  final bool expanded;
  final double collapsedHeight;
  final double expandedHeight;
  final Widget child;

  ExpandableContainer({
    @required this.child,
    this.collapsedHeight = 0.0,
    this.expandedHeight = 180.0,
    this.expanded = true,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return new AnimatedContainer(
      duration: new Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      width: screenWidth,
      height: expanded ? expandedHeight : collapsedHeight,
      child: new Container(
        child: child,
      ),
    );
  }
}
