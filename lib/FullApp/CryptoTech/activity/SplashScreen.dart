import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/CryptoTech/activity/IntroSliderActivity.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/DesignConfig.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitHome.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => IntroSliderActivity()),
      );
    });
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
        body: new Container(
          decoration: BoxDecoration(
            gradient: DesignConfig.gradient,
          ),
          child: Center(
            child: CachedNetworkImage(
              imageUrl: 'https://smartkit.wrteam.in/smartkit/cryptotech/logo.png',
              height: MediaQuery.of(context).size.width - 130,
            ),
          ),
        ),
      ),
    );
  }
}
