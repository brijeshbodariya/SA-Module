import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/NewsApp/activity/FeedbackPage.dart';
import 'package:smartkit/FullApp/NewsApp/activity/Home/HomePage.dart';
import 'package:smartkit/FullApp/NewsApp/activity/LiveVideos/LiveVideoList.dart';
import 'package:smartkit/FullApp/NewsApp/activity/Settings/SettingPage.dart';
import 'package:smartkit/FullApp/NewsApp/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/NewsApp/helper/RollingNavBar/circular_bottom_navigation.dart';
import 'package:smartkit/FullApp/NewsApp/helper/RollingNavBar/tab_item.dart';
import 'package:smartkit/FullApp/NewsApp/helper/StringsRes.dart';
import 'package:smartkit/FullApp/NewsApp/helper/VideoView/overlay_handler.dart';
import 'package:smartkit/FullApp/NewsApp/model/Article.dart';
import 'package:provider/provider.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitHome.dart';

import 'Profile/ProfilePage.dart';

Article selectednews;

class MainActivity extends StatefulWidget {
  @override
  _MainActivityState createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {
  int selectedPos = 0;

  double bottomNavBarHeight = 60;

  List<TabItem> tabItems = List.of([
    new TabItem(null, StringsRes.home, ColorsRes.appcolor, "home.png", labelStyle: TextStyle(fontWeight: FontWeight.bold)),
    new TabItem(null, StringsRes.settings, ColorsRes.appcolor, "setting.png", labelStyle: TextStyle(fontWeight: FontWeight.bold)),
    new TabItem(null, StringsRes.live, ColorsRes.appcolor, "live.png", labelStyle: TextStyle(fontWeight: FontWeight.bold)),
    new TabItem(null, StringsRes.profile, ColorsRes.appcolor, "profile.png", labelStyle: TextStyle(fontWeight: FontWeight.bold)),
    new TabItem(null, StringsRes.feedback, ColorsRes.appcolor, "bt_feedback.png", labelStyle: TextStyle(fontWeight: FontWeight.bold)),
  ]);

  CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController = new CircularBottomNavigationController(selectedPos);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Provider.of<OverlayHandlerProvider>(context, listen: false).overlayActive) {
          Provider.of<OverlayHandlerProvider>(context, listen: false).enablePip(1.77);

          Provider.of<OverlayHandlerProvider>(context, listen: false).removeOverlay(context);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MyHomePage(),
            ),
          );

          return false;
        }
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(),
          ),
        );
        return true;
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Padding(
              child: bodyContainer(),
              padding: EdgeInsets.only(bottom: bottomNavBarHeight),
            ),
            Align(alignment: Alignment.bottomCenter, child: bottomNav())
          ],
        ),
      ),
    );
  }

  Widget bodyContainer() {
    if (selectedPos == 0)
      return new HomePage();
    else if (selectedPos == 1)
      return new SettingPage();
    else if (selectedPos == 2)
      return new LiveVideoList();
    else if (selectedPos == 3)
      return new ProfilePage();
    else if (selectedPos == 4)
      return new FeedbackPage();
    else
      return Container();
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      iconsSize: MediaQuery.of(context).size.width / 16,
      barHeight: bottomNavBarHeight,
      barBackgroundColor: Colors.white,
      animationDuration: Duration(milliseconds: 300),
      selectedCallback: (int selectedPos) {
        setState(() {
          this.selectedPos = selectedPos;
          //print(_navigationController.value);
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }
}
