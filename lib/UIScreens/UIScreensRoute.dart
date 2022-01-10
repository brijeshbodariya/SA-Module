import 'dart:io';

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:smartkit/Constant/SmartKitFunction.dart';
import 'package:smartkit/FullApp/HappyShop/Helper/HappyShopString.dart';
import 'package:smartkit/SmartkitScreen/Widget/SmartKitListTile.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/UIScreens/Login/LoginRoute.dart';

import 'IntreactiveView/WRinteractiveView.dart';
import 'Leaderboard/LeaderboardRoute.dart';
import 'Navigation_Drawer/NavigationDrawerRout.dart';
import 'Onbording/OnbordingRoute.dart';
import 'Profile/ProfileRoute.dart';

class UIScreens extends StatefulWidget {
  UIScreens({Key key}) : super(key: key);

  @override
  _UIScreensState createState() => _UIScreensState();
}

class _UIScreensState extends State<UIScreens> {
  List wrNewComponents = [
    {
      'route': LeaderboardRoute(),
      'title': "Leader Board",
    },
    {
      'route': LoginRoute(),
      'title': "Login",
    },
    {
      'route': NavigationDrawerRoute(),
      'title': "Navigation Drawer",
    },
    {
      'route': ProfileRoute(),
      'title': "Profile",
    },
    {
      'route': OnBordingRoute(),
      'title': "OnBording",
    },
    {
      'route': ShoesDetail(),
      'title': "Interactive View",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: appWidget(),
      desktop: webWidget(),
    );

    /*  return Padding(
      padding: const EdgeInsets.all(10.0),
      child: isweb ? webWidget() : appWidget(),
    ); */
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
              MaterialPageRoute(builder: (BuildContext context) => wrNewComponents[index]['route']),
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
                    style: Theme.of(context).textTheme.headline5.merge(TextStyle(
                          fontWeight: FontWeight.bold,
                          color: textcolor,
                        )),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  wrNewComponents[index]['title'],
                  style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(fontWeight: FontWeight.bold, color: textcolor)),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
