import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/FullApp/SmartKey/mobile/SmartKeyScreens/SmartKeyLeaderboardMobile.dart';
import 'package:smartkit/FullApp/SmartKey/mobile/SmartKeyScreens/SmartKeyLoginMobile.dart';
import 'package:smartkit/FullApp/SmartKey/mobile/SmartKeyScreens/SmartKeyStatisticsMobile.dart';
import 'package:smartkit/FullApp/SmartKey/Widget/SmartKeyBtn.dart';
import 'package:smartkit/services/auth_service.dart';

import 'SmartKeyBookmarkListMobile.dart';
import 'SmartKeyHomeDataMobile.dart';
import 'SmartKeyInviteFriendMobile.dart';

class SmartKeyuserProfileMobile extends StatefulWidget {
  SmartKeyuserProfileMobile({Key key}) : super(key: key);

  @override
  _SmartKeyuserProfileMobileState createState() => _SmartKeyuserProfileMobileState();
}

class _SmartKeyuserProfileMobileState extends State<SmartKeyuserProfileMobile> {
  String name, mobile, email, profile, updateStatus;

  bool loading = true;
  bool hasError = false;
  bool editMode = false;

  final nameController = TextEditingController(text: "Name");
  final mobileController = TextEditingController(text: "Mobile");
  AuthServices authServices = AuthServices();
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
    return Container(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Column(
            children: [
              SizedBox(
                height: 15.0,
              ),
              Center(
                child: CircleAvatar(
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
              ),
              Padding(padding: EdgeInsets.only(bottom: 10.0)),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: SizedBox(
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(color: smartkey1, borderRadius: BorderRadius.circular(50.0)),
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
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: SizedBox(
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(color: smartkey1, borderRadius: BorderRadius.circular(50.0)),
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
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: SizedBox(
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(color: smartkey1, borderRadius: BorderRadius.circular(50.0)),
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
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmartKeyBtn(
                        btnwidth: MediaQuery.of(context).size.width / 2.2,
                        bg: Colors.white,
                        title: "Statistics",
                        titlecolor: Colors.black,
                        route: () {
                          Navigator.push(context, PageRouteBuilder(pageBuilder: (context, anim1, anim2) => (SmartKeyStatisticsMobile())));
                        },
                      ),
                      SmartKeyBtn(
                        btnwidth: MediaQuery.of(context).size.width / 2.2,
                        bg: Colors.white,
                        title: "Leaderboard",
                        titlecolor: Colors.black,
                        route: () {
                          Navigator.push(context, PageRouteBuilder(pageBuilder: (context, anim1, anim2) => (SmartKeyLeaderboardMobile())));
                        },
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(5.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmartKeyBtn(
                        btnwidth: MediaQuery.of(context).size.width / 2.2,
                        bg: Colors.white,
                        title: "Bookmark",
                        titlecolor: Colors.black,
                        route: () {
                          Navigator.push(context, PageRouteBuilder(pageBuilder: (context, anim1, anim2) => (SmartKeyBookmarkListMobile())));
                        },
                      ),
                      SmartKeyBtn(
                        btnwidth: MediaQuery.of(context).size.width / 2.2,
                        bg: Colors.white,
                        title: "Invite Friends",
                        titlecolor: Colors.black,
                        route: () {
                          Navigator.push(context, PageRouteBuilder(pageBuilder: (context, anim1, anim2) => (SmartKeyInviteFriendMobile())));
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: SmartKeyBtn(
                      bg: Colors.white,
                      title: "Log Out",
                      titlecolor: Colors.black,
                      route: () {
                        authServices.authSignOutUser(context);
                        Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (context, anim1, anim2) => (SmartKeyLoginMobile())));
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  )
                ],
              )
            ],
          ),
        ]),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => SmartKeyHomeDateMobile(),
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
