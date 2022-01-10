import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/FullApp/SmartKey/desktop/SmartKeyScreens/SmartKeyLeaderboardDesktop.dart';
import 'package:smartkit/FullApp/SmartKey/desktop/SmartKeyScreens/SmartKeyLoginDesktop.dart';
import 'package:smartkit/FullApp/SmartKey/desktop/SmartKeyScreens/SmartKeyStatisticsDesktop.dart';
import 'package:smartkit/FullApp/SmartKey/Widget/SmartKeyBtn.dart';

import 'SmartKeyBookmarkListDesktop.dart';
import 'SmartKeyHomeDataDesktop.dart';
import 'SmartKeyInviteFriendDesktop.dart';

class SmartKeyuserProfileDesktop extends StatefulWidget {
  SmartKeyuserProfileDesktop({Key key}) : super(key: key);

  @override
  _SmartKeyuserProfileDesktopState createState() =>
      _SmartKeyuserProfileDesktopState();
}

class _SmartKeyuserProfileDesktopState
    extends State<SmartKeyuserProfileDesktop> {
  String name, mobile, email, profile, updateStatus;

  bool loading = true;
  bool hasError = false;
  bool editMode = false;

  final nameController = TextEditingController(text: "Name");
  final mobileController = TextEditingController(text: "Mobile");
  Widget appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        decoration: BoxDecoration(gradient: smartkeygradient),
      ),
      title: editMode
          ? Center(
              child: Text(
                "Edit Profile",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          : Center(
              child: Text(
                "User Profile",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
      actions: [
        editMode
            ? IconButton(
                icon: Icon(
                  Icons.check,
                  color: Colors.greenAccent,
                ),
                onPressed: () {})
            : IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                onPressed: () {}),
      ],
    );
  }

  Widget mainBody() {
    return Center(
      child: Container(
          width: MediaQuery.of(context).size.width / 2,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 15.0,
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 45,
                    backgroundColor: smartkey2,
                    child: SvgPicture.asset(
                      "assets/smartkey.svg",
                      fit: BoxFit.cover,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: smartkey1,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 15.0)),
                      Icon(
                        Icons.account_circle_outlined,
                        size: 38.0,
                        color: smartkey2,
                      ),
                      Padding(padding: EdgeInsets.only(left: 15.0)),
                      Text(
                        "Mac",
                        style: TextStyle(
                          color: Colors.black,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: smartkey1,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 15.0)),
                      Icon(
                        Icons.phone_iphone,
                        size: 38.0,
                        color: smartkey2,
                      ),
                      Padding(padding: EdgeInsets.only(left: 15.0)),
                      Text(
                        "+19 0123456789",
                        style: TextStyle(
                          color: Colors.black,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: smartkey1,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 15.0)),
                      Icon(
                        Icons.email_outlined,
                        size: 38.0,
                        color: smartkey2,
                      ),
                      Padding(padding: EdgeInsets.only(left: 15.0)),
                      Text(
                        "mac@demo.com",
                        style: TextStyle(
                          color: Colors.black,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: SmartKeyBtn(
                      btnwidth: MediaQuery.of(context).size.width / 2.2,
                      bg: Colors.white,
                      title: "Statistics",
                      titlecolor: Colors.black,
                      route: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, anim1, anim2) =>
                                    (SmartKeyStatisticsDesktop())));
                      },
                    )),
                    SizedBox(width: 10),
                    Expanded(
                        child: SmartKeyBtn(
                      btnwidth: MediaQuery.of(context).size.width / 2.2,
                      bg: Colors.white,
                      title: "Leaderboard",
                      titlecolor: Colors.black,
                      route: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, anim1, anim2) =>
                                    (SmartKeyLeaderboardDesktop())));
                      },
                    )),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: SmartKeyBtn(
                      btnwidth: MediaQuery.of(context).size.width / 2.2,
                      bg: Colors.white,
                      title: "Bookmark",
                      titlecolor: Colors.black,
                      route: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, anim1, anim2) =>
                                    (SmartKeyBookmarkListDesktop())));
                      },
                    )),
                    SizedBox(width: 10),
                    Expanded(
                        child: SmartKeyBtn(
                      btnwidth: MediaQuery.of(context).size.width / 2.2,
                      bg: Colors.white,
                      title: "Invite Friends",
                      titlecolor: Colors.black,
                      route: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, anim1, anim2) =>
                                    (SmartKeyInviteFriendDesktop())));
                      },
                    )),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: SmartKeyBtn(
                    bg: Colors.white,
                    title: "Log Out",
                    titlecolor: Colors.black,
                    route: () {
                      Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (context, anim1, anim2) =>
                                  (SmartKeyLoginDesktop())));
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => SmartKeyHomeDateDesktop(),
            ),
            (Route<dynamic> route) => false);
      },
      child: Scaffold(
        backgroundColor: smartkey2,
        resizeToAvoidBottomInset: false,
        appBar: appBar(),
        body: mainBody(),
      ),
    );
  }
}
