import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit/Constant/Slideanimation.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/FullApp/DatingApp/Screens/LoginActivity.dart';
import 'package:smartkit/FullApp/DatingApp/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/DatingApp/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/DatingApp/helper/StringsRes.dart';
import 'package:smartkit/FullApp/Vpn/Screens/VpnIntro.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitHome.dart';

class DatingAppSplash extends StatefulWidget {
  DatingAppSplash({Key key}) : super(key: key);

  @override
  _DatingAppSplashState createState() => _DatingAppSplashState();
}

class _DatingAppSplashState extends State<DatingAppSplash> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 2000));
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
              decoration: DesignConfig.boxDecorationBackground(),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/datingapp/logo_white.svg',
                      color: Colors.white,
                      /*fit: BoxFit.cover,
                      width: 150,
                      height: 150,*/
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SlideAnimation(position: 3, itemCount: 8, slideDirection: SlideDirection.fromRight, animationController: _animationController,
                      child: Align(alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            StringsRes.splashScreenText,
                            style: TextStyle(color: ColorsRes.white, fontWeight: FontWeight.bold, fontSize: 35),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    SlideAnimation(position: 3, itemCount: 8, slideDirection: SlideDirection.fromRight, animationController: _animationController,
                      child: GestureDetector(
                        onTap: () {
                          //Navigator.pop(context);
                        },
                        child: Container(decoration: DesignConfig.boxDecorationButton(ColorsRes.white,ColorsRes.white),
                            margin: EdgeInsets.only(right: 20, left: 20),
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            alignment: Alignment.center,
                            child: Text(StringsRes.splashScreenButtonText,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: ColorsRes.gradientTwo,
                                ))),
                      ),
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
    var _duration = Duration(milliseconds: 3000);
    return Timer(_duration, navigationPage);
  }

  Future<void> navigationPage() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginActivity(),
      ),
    );
  }
}
