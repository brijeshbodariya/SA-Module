import 'dart:async';
import 'package:smartkit/FullApp/eStudy/desktop/Activity/IntroductionDesktop.dart';
import 'package:smartkit/FullApp/eStudy/helper/ColorsRes.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitHome.dart';

class SplashScreenDesktop extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SplashScreenDesktopState();
  }
}

class SplashScreenDesktopState extends State<SplashScreenDesktop> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => IntroductionDesktop()));
    });
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
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
      child: new Scaffold(
        backgroundColor: ColorsRes.appcolor,
        resizeToAvoidBottomInset: false,
        body: new Container(child: Center(child: SvgPicture.network('https://smartkit.wrteam.in/smartkit/eStudy/splashlogo.svg', color: ColorsRes.white))),
      ),
    );
  }
}
