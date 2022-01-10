import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'dart:math' as math;

import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/FullApp/SmartKey/Widget/SmartKeyBtn.dart';

class LoginCurveAnimation extends StatefulWidget {
  @override
  _LoginCurveAnimationState createState() => _LoginCurveAnimationState();
}

class _LoginCurveAnimationState extends State<LoginCurveAnimation> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool _obscureText = true;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      value: 0.0,
      duration: Duration(seconds: 5),
      upperBound: 1,
      lowerBound: -1,
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: [
              AnimatedBuilder(
                animation: _controller,
                builder: (BuildContext context, Widget child) {
                  return ClipPath(
                    clipper: DrawClip(_controller.value),
                    child: Container(
                      height: size.height * 0.5,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          // Where the linear gradient begins and ends
                          begin: Alignment.topRight,
                          end: Alignment.bottomCenter,
                          // Add one stop for each color. Stops should increase from 0 to 1
                          stops: [0.1, 0.9],
                          colors: [smartkey3, smartkey2],
                        ),
                      ),
                    ),
                  );
                },
              ),
              Container(
                // padding: EdgeInsets.only(bottom: 60),
                child: Text(
                  'SmartKit',
                  style: TextStyle(color: Colors.white, fontSize: 46, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          ScreenTypeLayout(mobile: Container(child: _showForm()), desktop: Container(width: MediaQuery.of(context).size.width / 3, child: _showForm())),
        ],
      ),
    );
  }

  Widget _showForm() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // SizedBox(height: 32),
            _showEmail(),
            SizedBox(height: 16),
            _showPwd(),
            SizedBox(height: 16),
            _showFPwd(),
            SizedBox(height: 16),
            // showErrorMessage(),
            _showSignIn()
          ],
        ),
      ),

      // _showSignIn(),
      // _showSocialMedia(),
      // _showGoSignup(),
    );
  }

  Widget _showEmail() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32),
      child: TextFormField(
        style: TextStyle(
          color: Colors.grey,
        ),
        decoration: InputDecoration(
            labelText: 'EMAIL',
            prefixIcon: Icon(
              Icons.email,
              color: Colors.grey,
            ),
            labelStyle: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              letterSpacing: 2,
              color: Colors.grey,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            )),
        // validator: validateEmail,
        onSaved: (value) => email = value.trim(),
      ),
    );
  }

  Widget _showPwd() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32),
      child: TextFormField(
        style: TextStyle(
          color: Colors.grey,
        ),
        obscureText: _obscureText,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.grey,
            ),
            labelText: 'PASSWORD',
            labelStyle: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              letterSpacing: 2,
              color: Colors.grey,
            ),
            suffixIcon: GestureDetector(
              child: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            )),
        // validator: validatePassword,
        onSaved: (value) => password = value.trim(),
      ),
    );
  }

  Widget _showFPwd() {
    return Container(
      margin: EdgeInsets.only(right: 20),
      alignment: Alignment.centerRight,
      child: CupertinoButton(
        onPressed: () => {}, // Implement Forgot Password Functionality
        child: Text(
          'Forgot Password ? ',
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _showSignIn() {
    return SmartKeyBtn(
      shadow: true,
      btnwidth: 300,
      title: 'Log In',
      titlecolor: Colors.white,
      bg: smartkey3,
    );
  }

  Widget _showSocialMedia() {
    // double top = _signUpAnimation?.value ?? double.maxFinite;
    return Positioned(
      left: 20,
      right: 20,
      top: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
            child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(
                  Radius.circular(24.0),
                )),
                elevation: 0.0,
                child: Container(
                  height: 40,
                  width: 40,
                  child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: SvgPicture.network(
                      'https://smartkit.wrteam.in/smartkit/images/ggl.svg',
                      height: 40.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                )),
            onTap: () {},
          ),
          GestureDetector(
            child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(
                  Radius.circular(24.0),
                )),
                elevation: 0.0,
                child: Container(
                  height: 40,
                  width: 40,
                  child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: SvgPicture.network(
                      'https://smartkit.wrteam.in/smartkit/images/fb.svg',
                      height: 40.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                )),
            onTap: () {},
          ),
          Text(
            "OR",
            style: TextStyle(color: Colors.white.withOpacity(0.8)),
          ),
          Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                Radius.circular(24.0),
              )),
              elevation: 0.0,
              child: Container(
                height: 40,
                width: 40,
                child: Card(
                    color: smartkey2,
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 25,
                    )),
              )),
        ],
      ),
    );
  }

  Widget _showGoSignup() {
    return Positioned(
      left: 0,
      right: 0,
      // bottom: _signInAnimation?.value ?? double.maxFinite,
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
              // Navigator.push(
              //   context,
              //   PageRouteBuilder(pageBuilder: (context, anim1, anim2) => SmartKeySingleSingUp()),
              // );
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
    );
  }
}

class DrawClip extends CustomClipper<Path> {
  double move = 0;
  double slice = math.pi;
  DrawClip(this.move);
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.8);
    double xCenter = size.width * 0.5 + (size.width * 0.6 + 1) * math.sin(move * slice);
    double yCenter = size.height * 0.8 + 69 * math.cos(move * slice);
    path.quadraticBezierTo(xCenter, yCenter, size.width, size.height * 0.8);

    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
