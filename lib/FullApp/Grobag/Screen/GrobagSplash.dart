import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/FullApp/Grobag/Screen/GrobagOnboarding.dart';

class GrobagSplash extends StatefulWidget {
  GrobagSplash({Key key}) : super(key: key);

  @override
  _GrobagSplashState createState() => _GrobagSplashState();
}

class _GrobagSplashState extends State<GrobagSplash> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: grobaggradient),
        child: Center(
          child: SvgPicture.network(
            'https://smartkit.wrteam.in/smartkit/grobag/splashlogo.svg',
          ),
        ),
      ),
    );
  }

  startTime() async {
    var _duration = Duration(milliseconds: 1000);
    return Timer(_duration, navigationPage);
  }

  Future<void> navigationPage() async {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => GrobagOnbording(),
        ));
  }
}
