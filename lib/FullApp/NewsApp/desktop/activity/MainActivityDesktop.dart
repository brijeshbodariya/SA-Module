import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/NewsApp/desktop/activity/FeedbackPageDesktop.dart';
import 'package:smartkit/FullApp/NewsApp/desktop/activity/Home/HomePageDesktop.dart';
import 'package:smartkit/FullApp/NewsApp/desktop/activity/LiveVideos/LiveVideoListDesktop.dart';
import 'package:smartkit/FullApp/NewsApp/desktop/activity/Settings/SettingPageDesktop.dart';
import 'package:smartkit/FullApp/NewsApp/desktop/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/NewsApp/desktop/helper/RollingNavBar/circular_bottom_navigation.dart';
import 'package:smartkit/FullApp/NewsApp/desktop/helper/RollingNavBar/tab_item.dart';
import 'package:smartkit/FullApp/NewsApp/desktop/helper/StringsRes.dart';
import 'package:smartkit/FullApp/NewsApp/desktop/helper/VideoView/overlay_handler.dart';
import 'package:smartkit/FullApp/NewsApp/model/Article.dart';
import 'package:provider/provider.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitHome.dart';

import 'Profile/ProfilePageDesktop.dart';

Article selectednews;

class MainActivityDesktop extends StatefulWidget {
  @override
  _MainActivityStateDesktop createState() => _MainActivityStateDesktop();
}

class _MainActivityStateDesktop extends State<MainActivityDesktop> {
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
        if (Provider.of<OverlayHandlerProviderDesktop>(context, listen: false).overlayActive) {
          Provider.of<OverlayHandlerProviderDesktop>(context, listen: false).enablePip(1.77);

          Provider.of<OverlayHandlerProviderDesktop>(context, listen: false).removeOverlay(context);
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
      return new HomePageDesktop();
    else if (selectedPos == 1)
      return new SettingPageDesktop();
    else if (selectedPos == 2)
      return new LiveVideoListDesktop();
    else if (selectedPos == 3)
      return new ProfilePageDesktop();
    else if (selectedPos == 4)
      return new FeedbackPageDesktop();
    else
      return Container();
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      iconsSize: MediaQuery.of(context).size.width / 90,
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
