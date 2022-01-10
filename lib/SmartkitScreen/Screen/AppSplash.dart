import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitHome.dart';
import 'Intro.dart';

double devicewidth;

class Splash extends StatefulWidget {
  @override
  _SplashScreen createState() => new _SplashScreen();
}

class _SplashScreen extends State<Splash> with TickerProviderStateMixin {
  startTime() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationPage);
  }

  Future navigationPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool first = prefs.getBool('first_init');
    if (first == null) {
      first = false;
    }
    if (first) {
      // _controller.dispose();
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => new MyHomePage(),
          ));
    } else {
      // _controller.dispose();
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => new IntroSlider(),
          ));
      first = true;
      prefs.setBool("first_init", first);
    }
  }

  @override
  void initState() {
    startTime();
    super.initState();
    print('App Spalsh Start : ' + '***');
  }

  @override
  Widget build(BuildContext context) {
    devicewidth = MediaQuery.of(context).size.width;
    return new Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(
          'assets/Logo-05.gif',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
