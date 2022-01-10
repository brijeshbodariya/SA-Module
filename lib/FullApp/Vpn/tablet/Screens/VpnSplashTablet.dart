import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/FullApp/Vpn/tablet/Screens/VpnIntroTablet.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitHome.dart';

class VpnSplashTablet extends StatefulWidget {
  VpnSplashTablet({Key key}) : super(key: key);

  @override
  _VpnSplashStateTablet createState() => _VpnSplashStateTablet();
}

class _VpnSplashStateTablet extends State<VpnSplashTablet> {
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
                      'assets/lightvpn.svg',
                      color: Colors.white,
                      fit: BoxFit.cover,
                      width: 150,
                      height: 150,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "LIGHT VPN",
                      style: TextStyle(color: Colors.white, fontFamily: 'open sans', fontWeight: FontWeight.w700, fontSize: 28),
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
      gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [vpn22, vpn33], stops: [0, 1]),
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
        builder: (context) => VpnIntroTablet(),
      ),
    );
  }
}
