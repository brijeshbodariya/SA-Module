import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/FullApp/Music/mobile/MusicScreens/MusicHomeMobile.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitHome.dart';

// class MusicSplash extends StatefulWidget {
class MusicSplashMobile extends StatefulWidget {
  MusicSplashMobile({Key key}) : super(key: key);

  @override
  _MusicSplashStateMobile createState() => _MusicSplashStateMobile();
}

class _MusicSplashStateMobile extends State<MusicSplashMobile> {
  @override
  void initState() {
    super.initState();
    startTime();
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
          children: <Widget>[
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: back(),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.network(
                      'https://smartkit.wrteam.in/smartkit/MusicFlex.svg',
                      width: 150.0,
                      color: Colors.white,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "MUSIC",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 28),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  back() {
    return BoxDecoration(
      gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [music2, music3], stops: [0, 1]),
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
          builder: (context) => MusicHomeMobile(),
        ));
  }
}
