import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartkit/FullApp/NewsApp/mobile/helper/DesignConfig.dart';

import 'IntroSliderActivityMobile.dart';

class SplashScreenMobile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SplashScreenStateMobile();
  }
}

class SplashScreenStateMobile extends State<SplashScreenMobile> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    callNextPage();
  }

  callNextPage() {
    Timer(Duration(seconds: 3), () async {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => IntroSliderActivityMobile()),
      );
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        decoration: BoxDecoration(
          gradient: DesignConfig.gradient,
        ),
        child: Center(
          child: CachedNetworkImage(
            imageUrl: 'https://smartkit.wrteam.in/smartkit/newsapp/logo.png',
            width: MediaQuery.of(context).size.width / 2,
          ),
        ),
      ),
    );
  }
}
