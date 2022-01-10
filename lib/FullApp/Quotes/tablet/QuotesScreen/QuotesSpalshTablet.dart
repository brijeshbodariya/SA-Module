import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/FullApp/Quotes/tablet/QuotesScreen/QuotesHomeTablet.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitHome.dart';


class QuotesSplashTablet extends StatefulWidget {
  QuotesSplashTablet({Key key}) : super(key: key);

  @override
  _QuotesSplashStateTablet createState() => _QuotesSplashStateTablet();
}

class _QuotesSplashStateTablet extends State<QuotesSplashTablet> {
  startTime() async {
    var _duration = new Duration(seconds: 1);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => new QuotesHomeTablet(),
        ));
  }

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
                    SvgPicture.asset(
                      'assets/WebApp.svg',
                      width: 150.0,
                      color: Colors.white,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "QUOTES",
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
      gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [quotes2, quotes3], stops: [0, 1]),
    );
  }
}
