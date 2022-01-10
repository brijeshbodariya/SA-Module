import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/Constant/SmartKitFunction.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitAppbar.dart';
import 'package:smartkit/SmartkitScreen/Widget/SmartKitListTile.dart';

import 'Nav_Bottom.dart';
import 'Nav_Collapse.dart';
import 'Nav_Iconic.dart';
import 'Nav_ProfileDrawer.dart';
import 'Nav_Right.dart';
import 'Nav_Scaler.dart';
import 'Nav_SlideHeader.dart';
import 'SimNavDrawer.dart';
import 'SimNavListDrawer.dart';

class NavigationDrawerRoute extends StatefulWidget {
  NavigationDrawerRoute({Key key}) : super(key: key);

  @override
  _NavigationDrawerRouteState createState() => _NavigationDrawerRouteState();
}

class _NavigationDrawerRouteState extends State<NavigationDrawerRoute> {
  List wrNewComponents = [
    {
      'route': SimNavListDrawer(),
      'title': "Simple List Drawer",
    },
    {
      'route': SimNavDrawer(),
      'title': "Simple Drawer",
    },
    {
      'route': NavProfileDrawer(),
      'title': "Profile Drawer",
    },
    {
      'route': NavDrawerIconic(),
      'title': "Iconic Drawer",
    },
    {
      'route': NavDrawerRight(),
      'title': "Right Drawer",
    },
    {
      'route': NavDrawerBottom(),
      'title': "Bottom Drawer",
    },
    {
      'route': DrawerScaleIcon(),
      'title': "Navigation Scaler",
    },
    {
      'route': DrawerSlideWithHeader(),
      'title': "Slide With Header",
    },
    {
      'route': TestesCollapsingContainer(),
      'title': "Collapsing Drawer",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(56),
            child: SmartKitAppbar(
              title: "Navigation Drawer",
            )),
        body: ScreenTypeLayout(
          mobile: appWidget(),
          desktop: webWidget(),
        ));
  }

  Widget appWidget() {
    return ListView.builder(
      itemCount: wrNewComponents.length,
      itemBuilder: (BuildContext context, int index) {
        Color bg = tilecolor[index % tilecolor.length];
        Color iconbg = tileiconbgcolor[index % tileiconbgcolor.length];
        Color textcolor = tiletextcolor[index % tiletextcolor.length];
        getletter(wrNewComponents[index]['title']);

        return Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: ListTileUI(
            iconTitle: strs,
            title: wrNewComponents[index]['title'],
            color: bg,
            iconbg: iconbg,
            textcolor: textcolor,
            ontap: wrNewComponents[index]['route'],
          ),
        );
      },
    );
  }

  Widget webWidget() {
    return GridView.count(
      crossAxisCount: 6,
      children: List.generate(wrNewComponents.length, (index) {
        Color bg = tilecolor[index % tilecolor.length];
        Color iconbg = tileiconbgcolor[index % tileiconbgcolor.length];
        Color textcolor = tiletextcolor[index % tiletextcolor.length];
        getletter(wrNewComponents[index]['title']);
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      wrNewComponents[index]['route']),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            margin: new EdgeInsets.all(6.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: iconbg,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: 130,
                  height: 100,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  alignment: Alignment.center,
                  child: Text(
                    strs,
                    style:
                        Theme.of(context).textTheme.headline5.merge(TextStyle(
                              fontWeight: FontWeight.bold,
                              color: textcolor,
                            )),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  wrNewComponents[index]['title'],
                  style: Theme.of(context).textTheme.subtitle1.merge(
                      TextStyle(fontWeight: FontWeight.bold, color: textcolor)),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
