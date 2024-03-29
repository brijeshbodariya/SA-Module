import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/helper/Constant.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/helper/StringsRes.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/activity/authentication/SignupActivityMobile.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitHome.dart';
import 'package:smartkit/services/auth_model.dart';
import 'package:smartkit/services/auth_service.dart';
import 'package:toast/toast.dart';
import '../MainHomePageMobile.dart';
import 'LoginActivityMobile.dart';
import 'dart:io';

class LoginHomePageMobile extends StatefulWidget {
  final String from;
  const LoginHomePageMobile({
    Key key,
    this.from,
  }) : super(key: key);

  @override
  _LoginHomePageStateMobile createState() => _LoginHomePageStateMobile();
}

class _LoginHomePageStateMobile extends State<LoginHomePageMobile> {
  GlobalKey<ScaffoldState> scaffoldKey;

  AuthServices authServices = AuthServices();
  AuthModel authModel = AuthModel();
  @override
  void initState() {
    super.initState();
    scaffoldKey = GlobalKey<ScaffoldState>();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
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
        key: scaffoldKey,
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(image: CachedNetworkImageProvider('https://smartkit.wrteam.in/smartkit/foodmaster/background_image.png'), fit: BoxFit.cover),
          ),
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top, bottom: MediaQuery.of(context).padding.bottom, left: 15, right: 15),
          child: Column(children: [
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  if (widget.from == 'splash' || widget.from == 'intro') {
                    Constant.goToMainPage(widget.from, context);
                  } else {
                    Navigator.of(context).pop();
                  }
                },
                child: DesignConfig.shadowButton(Colors.white, StringsRes.lblskip, ColorsRes.IconColor, 20, Colors.white),
              ),
            ),
            SingleChildScrollView(
                padding: EdgeInsets.only(left: 15, top: 2 * kToolbarHeight),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    StringsRes.welcometitle,
                    style: Theme.of(context).textTheme.headline4.merge(TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold)),
                  ),
                  Text(
                    StringsRes.appname,
                    style: Theme.of(context).textTheme.headline4.merge(TextStyle(color: ColorsRes.IconColor, fontWeight: FontWeight.bold)),
                  ),
                  Text(
                    StringsRes.welcomeinfo,
                    style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.black.withOpacity(0.6))),
                  ),
                ])),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(children: [
                  Expanded(
                      child: Divider(
                    color: ColorsRes.white,
                    indent: 15,
                    endIndent: 15,
                  )),
                  Text(
                    StringsRes.signinwith,
                    style: TextStyle(color: ColorsRes.white),
                  ),
                  Expanded(
                      child: Divider(
                    color: ColorsRes.white,
                    indent: 15,
                    endIndent: 15,
                  )),
                ]),
                SizedBox(
                  height: 20,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                  GestureDetector(
                      onTap: () async {
                        try {
                          EasyLoading.show(
                              indicator: CircularProgressIndicator(
                              ));
                          authModel.foodMasterFacebookLogin(context);
                          EasyLoading.dismiss();
                        } catch (e) {
                          Toast.show(e.toString(), context,
                              duration: 10);
                        }
                      },
                      child: CachedNetworkImage(
                        width: width / 2.5,
                        imageUrl: "https://smartkit.wrteam.in/smartkit/foodmaster/button__facebook.png",
                      )),
                  GestureDetector(
                      onTap: () async {
                         await authServices.signWithGoogle(
                            context);
                         Navigator.of(context).pushAndRemoveUntil(
                             CupertinoPageRoute(
                                 builder: (context) => MainHomePageMobile(
                                   from: "pagefrom",
                                 )),
                                 (Route<dynamic> route) => false);

                        Toast.show("LogIn SuccessFully", context,
                            backgroundColor: ColorsRes.black,
                            textColor: ColorsRes.white,
                            duration: 5);
                      },
                      child: CachedNetworkImage(
                        imageUrl: "https://smartkit.wrteam.in/smartkit/foodmaster/button_google.png",
                        width: width / 2.5,
                      )),
                  if (Platform.isIOS)
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              CupertinoPageRoute(
                                  builder: (context) => MainHomePageMobile(
                                        from: "pagefrom",
                                      )),
                              (Route<dynamic> route) => false);
                        },
                        child: CachedNetworkImage(
                          imageUrl: "https://smartkit.wrteam.in/smartkit/foodmaster/button_apple.png",
                          width: width / 2.5,
                        )),
                ]),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(CupertinoPageRoute(builder: (context) => SignupActivityMobile(from: "loginhome")));
                    },
                    child: DesignConfig.shadowButtonFullwidgth(Colors.white.withOpacity(0.1), StringsRes.manuallogin, ColorsRes.white, 28, Colors.white, context),
                  ),
                ),
                RichText(
                    text: TextSpan(style: new TextStyle(color: ColorsRes.white), text: StringsRes.alreadyhvac, children: <TextSpan>[
                  TextSpan(
                      text: StringsRes.lblsignin,
                      style: TextStyle(decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).push(CupertinoPageRoute(builder: (context) => LoginActivityMobile()));
                        }),
                ])),
                SizedBox(
                  height: 50,
                ),
              ],
            ))
          ]),
        ),
      ),
    );
  }
}
