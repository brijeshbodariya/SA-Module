import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Animated_Signup.dart';
import 'Animated_back.dart';

class Animated_Login extends StatefulWidget {
  @override
  Animated_LoginState createState() => Animated_LoginState();
}

class Animated_LoginState extends State<Animated_Login> with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  AnimationController _signUpAnimationController;
  Animation<double> _signUpAnimation;

  AnimationController _signInAnimationController;
  Animation<double> _signInAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 20));

    _signUpAnimationController = AnimationController(vsync: this, duration: Duration(milliseconds: 250));

    _signInAnimationController = AnimationController(vsync: this, duration: Duration(milliseconds: 250));

    _animation = CurvedAnimation(parent: _animationController, curve: Curves.linear)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((animationStatus) {
        if (animationStatus == AnimationStatus.completed) {
          _animationController.reset();
          _animationController.forward();
        }
      });

    Future.delayed(Duration.zero, () {
      _signUpAnimation = Tween(begin: MediaQuery.of(context).size.height, end: 450.0).animate(_signUpAnimationController.drive(CurveTween(curve: Curves.easeOut)))
        ..addListener(() {
          setState(() {});
        })
        ..addStatusListener((animationStatus) {
          if (animationStatus == AnimationStatus.completed) {
            _signInAnimationController.forward();
          }
        });

      _signInAnimation = Tween(begin: -32.0, end: 16.0).animate(_signInAnimationController.drive(CurveTween(curve: Curves.easeOut)))
        ..addListener(() {
          setState(() {});
        });
    });

    _animationController.forward();

    _signUpAnimationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<bool> _onWillPop() {
    _handleOnTabBackButton();
    return Future.delayed(Duration.zero, () {
      _handleOnTabBackButton();
    });
  }

  void _handleOnTabBackButton() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(pageBuilder: (context, anim1, anim2) => Animated_back()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: 'https://smartkit.wrteam.in/smartkit/images/anim_back.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              alignment: FractionalOffset(_animation.value, 0),
            ),
            SafeArea(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          child: CachedNetworkImage(
                            imageUrl: 'https://smartkit.wrteam.in/smartkit/images/ic_launcher.png',
                            fit: BoxFit.cover,
                            width: 32,
                            height: 32,
                          ),
                          onTap: _handleOnTabBackButton,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 48),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 32),
                    child: TextField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                          labelText: 'EMAIL',
                          labelStyle: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2,
                            color: Colors.white,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          )),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 32),
                    child: TextField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'PASSWORD',
                          labelStyle: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2,
                            color: Colors.white,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              top: _signUpAnimation?.value ?? double.maxFinite,
              child: Container(
                width: 300,
                child: CupertinoButton(
                  borderRadius: BorderRadius.circular(100.0),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(color: Colors.pink),
                  ),
                  color: Colors.white,
                  onPressed: () {
                    //  setState(() { _pressedCount += 1; });
                  },
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: _signInAnimation?.value ?? double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Don't have account ?",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 2),
                  CupertinoButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(pageBuilder: (context, anim1, anim2) => SignUpPage()),
                      );
                    },
                    padding: EdgeInsets.all(0),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
