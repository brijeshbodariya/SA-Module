import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/NewsApp/mobile/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/NewsApp/mobile/helper/RollingNavBar/circular_bottom_navigation.dart';
import 'package:smartkit/FullApp/NewsApp/mobile/helper/RollingNavBar/tab_item.dart';
import 'package:smartkit/FullApp/NewsApp/mobile/helper/StringsRes.dart';
import 'package:smartkit/FullApp/NewsApp/mobile/helper/VideoView/overlay_handler.dart';
import 'package:smartkit/FullApp/NewsApp/mobile/activity/FeedbackPageMobile.dart';
import 'package:smartkit/FullApp/NewsApp/mobile/activity/Home/HomePageMobile.dart';
import 'package:smartkit/FullApp/NewsApp/mobile/activity/LiveVideos/LiveVideoListMobile.dart';
import 'package:smartkit/FullApp/NewsApp/mobile/activity/Settings/SettingPageMobile.dart';
import 'package:smartkit/FullApp/NewsApp/model/Article.dart';
import 'package:provider/provider.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitHome.dart';

import 'Profile/ProfilePageMobile.dart';

Article selectednews;

class MainActivityMobile extends StatefulWidget {
  @override
  _MainActivityStateMobile createState() => _MainActivityStateMobile();
}

class _MainActivityStateMobile extends State<MainActivityMobile> {
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
        if (Provider.of<OverlayHandlerProviderMobile>(context, listen: false).overlayActive) {
          Provider.of<OverlayHandlerProviderMobile>(context, listen: false).enablePip(1.77);

          Provider.of<OverlayHandlerProviderMobile>(context, listen: false).removeOverlay(context);
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
      return new HomePageMobile();
    else if (selectedPos == 1)
      return new SettingPageMobile();
    else if (selectedPos == 2)
      return new LiveVideoListMobile();
    else if (selectedPos == 3)
      return new ProfilePageMobile();
    else if (selectedPos == 4)
      return new FeedbackPageMobile();
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
