import 'dart:async';
import 'package:smartkit/FullApp/eStudy/helper/ColorsRes.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit/FullApp/eStudy/activity/IntroductionMobile.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitHome.dart';

class SplashScreenMobile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SplashScreenMobileState();
  }
}

class SplashScreenMobileState extends State<SplashScreenMobile> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          new MaterialPageRoute(builder: (context) => IntroductionMobile()));
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
        body: new Container(
            child: Center(
                child: SvgPicture.asset('assets/eStudy/splashlogo.svg',
                    color: ColorsRes.white))),
      ),
    );
  }
}
