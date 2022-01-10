import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:smartkit/FullApp/FoodMaster/activity/IntroSliderScreens.dart';
import 'package:smartkit/FullApp/FoodMaster/helper/ColorsRes.dart';
import 'package:flutter/material.dart';
//import 'package:smartkit/FullApp/FoodMaster/helper/DatabaseHelper.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitHome.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => IntroSliderScreens()));
    });
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
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
            color: ColorsRes.appcolor,
            alignment: Alignment.center,
            child: CachedNetworkImage(
              imageUrl: "https://smartkit.wrteam.in/smartkit/foodmaster/splash_logo.png",
              width: MediaQuery.of(context).size.width / 2,
            )
            // ExplodeViewMain(imagePath: 'https://smartkit.wrteam.in/smartkit/foodmaster/splash_logo.png', imagePosFromLeft: MediaQuery.of(context).size.width / 2, imagePosFromTop: MediaQuery.of(context).size.height / 2),
            ),
      ),
    );
  }
}
