import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/NewsApp/tablet/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/NewsApp/tablet/helper/RollingNavBar/circular_bottom_navigation.dart';
import 'package:smartkit/FullApp/NewsApp/tablet/helper/RollingNavBar/tab_item.dart';
import 'package:smartkit/FullApp/NewsApp/tablet/helper/StringsRes.dart';
import 'package:smartkit/FullApp/NewsApp/tablet/helper/VideoView/overlay_handler.dart';
import 'package:smartkit/FullApp/NewsApp/model/Article.dart';
import 'package:provider/provider.dart';
import 'package:smartkit/FullApp/NewsApp/tablet/activity/FeedbackPageTablet.dart';
import 'package:smartkit/FullApp/NewsApp/tablet/activity/Home/HomePageTablet.dart';
import 'package:smartkit/FullApp/NewsApp/tablet/activity/LiveVideos/LiveVideoListTablet.dart';
import 'package:smartkit/FullApp/NewsApp/tablet/activity/Settings/SettingPageTablet.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitHome.dart';

import 'Profile/ProfilePageTablet.dart';

Article selectednews;

class MainActivityTablet extends StatefulWidget {
  @override
  _MainActivityStateTablet createState() => _MainActivityStateTablet();
}

class _MainActivityStateTablet extends State<MainActivityTablet> {
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
        if (Provider.of<OverlayHandlerProviderTablet>(context, listen: false).overlayActive) {
          Provider.of<OverlayHandlerProviderTablet>(context, listen: false).enablePip(1.77);

          Provider.of<OverlayHandlerProviderTablet>(context, listen: false).removeOverlay(context);
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
      return new HomePageTablet();
    else if (selectedPos == 1)
      return new SettingPageTablet();
    else if (selectedPos == 2)
      return new LiveVideoListTablet();
    else if (selectedPos == 3)
      return new ProfilePageTablet();
    else if (selectedPos == 4)
      return new FeedbackPageTablet();
    else
      return Container();
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      iconsSize: MediaQuery.of(context).size.width / 30,
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
