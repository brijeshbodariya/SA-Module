import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Login/Animated_Signup.dart';

import 'Animate_Login.dart';

class Animated_back extends StatefulWidget {
  @override
  Animated_backState createState() => Animated_backState();
}

class Animated_backState extends State<Animated_back> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _backgroundAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 20));

    _backgroundAnimation = CurvedAnimation(parent: _animationController, curve: Curves.linear)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((animationStatus) {
        if (animationStatus == AnimationStatus.completed) {
          _animationController.reset();
          _animationController.forward();
        }
      });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleOnPressedSignUp() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(pageBuilder: (context, anim1, anim2) => SignUpPage()),
    );
  }

  void _handleOnPressedSignIn() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(pageBuilder: (context, anim1, anim2) => Animated_Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: 'https://smartkit.wrteam.in/smartkit/images/anim_back.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            alignment: FractionalOffset(_backgroundAnimation.value, 0),
          ),
          Center(
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CachedNetworkImage(
                          imageUrl: 'https://smartkit.wrteam.in/smartkit/images/logo.png',
                          width: 100,
                          height: 70,
                        )
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                    child: Text(
                      'Flutter UI Component',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -2,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  //  Expanded(child: Container()),
                  SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                      width: 300,
                      child: CupertinoButton(
                        borderRadius: BorderRadius.circular(100.0),

                        child: const Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.pink),
                        ),
                        color: Colors.white,
                        onPressed: _handleOnPressedSignUp,

                        //  setState(() { _pressedCount += 1; });
                      )),
                  SizedBox(height: 16),
                  SizedBox(width: 300, child: CupertinoButton(borderRadius: BorderRadius.circular(100.0), color: Colors.white, child: const Text('Log in', style: TextStyle(color: Colors.pink)), onPressed: _handleOnPressedSignIn)),
                  //   CustomButton(text: 'Log in'),
                  SizedBox(height: 16),
                  CupertinoButton(
                    onPressed: () => {},
                    child: Text(
                      'See a demo of the app',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
