import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/FullApp/SmartKey/tablet/SmartKeyScreens/SmartKeyHomeDataTablet.dart';
import 'package:smartkit/FullApp/SmartKey/tablet/SmartKeyScreens/SmartKeyInstructionTablet.dart';
import 'package:smartkit/FullApp/SmartKey/tablet/SmartKeyScreens/SmartKeyLeaderboardTablet.dart';
import 'package:smartkit/FullApp/SmartKey/tablet/SmartKeyScreens/SmartKeyUserProfileTablet.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitHome.dart';

import 'SmartKeyBookmarkListTablet.dart';
import 'SmartKeyCategoryTablet.dart';
import 'SmartKeyNotificationListTablet.dart';
import 'SmartKeyStatisticsTablet.dart';

class SmartKeyHomeTablet extends StatefulWidget {
  SmartKeyHomeTablet({Key key}) : super(key: key);

  @override
  _SmartKeyHomeTabletState createState() => _SmartKeyHomeTabletState();
}

class _SmartKeyHomeTabletState extends State<SmartKeyHomeTablet> {
  int tabIndex = 0;
  List<Widget> body = [SmartKeyHomeDateTablet(), SmartKeyCategoryTablet(), SmartKeyLeaderboardTablet(), SmartKeyuserProfileTablet()];

  /// Curved Bottom Navigation Bar
  Widget bottomNavigationBar() {
    return CurvedNavigationBar(
        backgroundColor: smartkey2,
        items: <Widget>[
          Icon(Icons.home, size: 30, color: smartkey2),
          Icon(Icons.play_arrow_rounded, size: 30, color: smartkey2),
          Icon(Icons.leaderboard, size: 30, color: smartkey2),
          Icon(Icons.account_circle_outlined, size: 30, color: smartkey2),
        ],
        index: 0,
        animationDuration: Duration(milliseconds: 500),
        animationCurve: Curves.decelerate,
        height: 50.0,
        onTap: (index) {
          setState(() {
            tabIndex = index;
          });
        });
  }

  Widget drawerLayer() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [smartkey3, smartkey2], stops: [0.3, 0.8]),
      ),
      // color: smartkey2,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // loading
                        //     ? Center(
                        //         child: Loading(
                        //           indicator: BallSpinFadeLoaderIndicator(),
                        //           color: primary,
                        //           size: 50.0,
                        //         ),
                        //       )
                        //     :
                        InkWell(
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 45,
                              backgroundColor: smartkey2,
                              child: SvgPicture.asset(
                                "assets/smartkey.svg",
                                // width: 130,
                                // height: 130,
                                fit: BoxFit.cover,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          onTap: () {
                            // Navigator.push(context, PageRouteBuilder(pageBuilder: (context, anim1, anim2) => (UserProfile())));
                          },
                        ),
                        Padding(padding: EdgeInsets.only(top: 10.0)),
                        Row(
                          children: [
                            // loading
                            //     ? Center(
                            //         child: Loading(
                            //           indicator: BallSpinFadeLoaderIndicator(),
                            //           color: smartkey2,
                            //           size: 50.0,
                            //         ),
                            //       )
                            //     :

                            Center(
                              child: Text(
                                "Mac",
                                style: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
              Divider(
                color: smartkey2,
                thickness: 2,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text(
                      "Bookmark",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.push(context, PageRouteBuilder(pageBuilder: (context, anim1, anim2) => (SmartKeyBookmarkListTablet())));
                    },
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(bottom: 6.0),
                  // ),
                  ListTile(
                    title: Text(
                      "Notifications",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.push(context, PageRouteBuilder(pageBuilder: (context, anim1, anim2) => (SmartKeyNotificationListTablet())));
                    },
                  ),

                  // Padding(
                  //   padding: EdgeInsets.only(bottom: 8.0),
                  // ),
                  Divider(
                    color: smartkey2,
                    thickness: 2,
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(bottom: 8.0),
                  // ),
                  ListTile(
                    title: Text(
                      "Statistics",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.push(context, PageRouteBuilder(pageBuilder: (context, anim1, anim2) => (SmartKeyStatisticsTablet())));
                    },
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(bottom: 8.0),
                  // ),
                  ListTile(
                    title: Text(
                      "LeaderBoard",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     PageRouteBuilder(
                      //         pageBuilder: (context, anim1, anim2) =>
                      //             (Leaderboard())));
                    },
                  ),

                  ListTile(
                    title: Text(
                      "Instruction",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      // Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SmartKeyinstructionTablet(),
                        ),
                      );
                    },
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(bottom: 8.0),
                  // ),
                  Divider(
                    color: smartkey2,
                    thickness: 2,
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(bottom: 8.0),
                  // ),
                  ListTile(
                    title: Text(
                      "Settings",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      // showDialog(
                      //   context: context,
                      //   builder: (context) {
                      //     return ShowSettingDialog();
                      //   },
                      // );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(),
          ),
        );
      },
      child: Scaffold(
        body: Stack(
          children: [
            drawerLayer(),
            body[tabIndex],
          ],
        ),
        bottomNavigationBar: bottomNavigationBar(),
      ),
    );
  }
}
