import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/FullApp/SmartKey/Widget/SmartKeyBtn.dart';
import 'package:smartkit/UIScreens/Login/LoginRoute.dart';

import 'SmartKeySingleLogin.dart';

class SmartKeySingleSingUp extends StatefulWidget {
  SmartKeySingleSingUp({Key key}) : super(key: key);

  @override
  _SmartKeySingleSingUpState createState() => _SmartKeySingleSingUpState();
}

class _SmartKeySingleSingUpState extends State<SmartKeySingleSingUp> with TickerProviderStateMixin {
  AnimationController _animationController;
  AnimationController _signUpAnimationController;
  Animation<double> _signUpAnimation;
  AnimationController _signInAnimationController;
  Animation<double> _signInAnimation;

  final _formKey = GlobalKey<FormState>();
  String email;
  String password, name, refercode;
  String errorMessage;
  bool _obscureText = true;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 20));

    _signUpAnimationController = AnimationController(vsync: this, duration: Duration(milliseconds: 250));

    _signInAnimationController = AnimationController(vsync: this, duration: Duration(milliseconds: 250));

    Future.delayed(Duration.zero, () {
      _signUpAnimation = Tween(begin: MediaQuery.of(context).size.height, end: 500.0).animate(_signUpAnimationController.drive(CurveTween(curve: Curves.easeOut)))
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

    errorMessage = "";
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<bool> _onWillPop() {
    return Future.delayed(Duration.zero, () {
      _handleOnTabBackButton();
    });
  }

  void _handleOnTabBackButton() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(pageBuilder: (context, anim1, anim2) => LoginRoute()),
    );
  }

  Widget _form() {
    return Form(
        key: _formKey,
        child: Stack(
          children: <Widget>[
            showBackground(),
            SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  showLogoBack(),
                  SizedBox(height: 32),
                  showUsername(),
                  SizedBox(height: 16),
                  showEmail(),
                  SizedBox(height: 16),
                  showPassword(),
                  SizedBox(height: 16),
                  showReferral(),
                  SizedBox(height: 16),
                  showSignup(),
                ],
              ),
            ),
            showGoSignin()
          ],
        ));
  }

  Widget showBackground() {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.9],
            colors: [smartkey3, smartkey2],
          ),
        ));
  }

  Widget showLogoBack() {
    return Stack(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 50),
          child: Column(
            children: <Widget>[
              SvgPicture.asset(
                'assets/smartkey.svg',
                width: 50,
                height: 50,
                color: Colors.white,
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget showUsername() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32),
      child: TextFormField(
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.person,
            color: Colors.white,
          ),
          labelText: 'USERNAME',
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
          ),
        ),
        // validator: validateName,
        onSaved: (value) => name = value.trim(),
      ),
    );
  }

  Widget showEmail() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32),
      child: TextFormField(
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.email,
              color: Colors.white,
            ),
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
        keyboardType: TextInputType.emailAddress,
        // validator: validateName,
        onSaved: (value) => email = value.trim(),
      ),
    );
  }

  Widget showPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32),
      child: TextFormField(
        style: TextStyle(
          color: Colors.white,
        ),
        obscureText: _obscureText,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.white,
            ),
            labelText: 'PASSWORD',
            labelStyle: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              letterSpacing: 2,
              color: Colors.white,
            ),
            suffixIcon: GestureDetector(
              child: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
                color: Colors.white,
              ),
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            )),
        // validator: validatePassword,
        onSaved: (value) => password = value.trim(),
      ),
    );
  }

  Widget showReferral() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32),
      child: TextFormField(
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.confirmation_number,
              color: Colors.white,
            ),
            labelText: 'REFERRAL CODE (Optional)',
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
        onSaved: (value) => refercode = value.trim(),
      ),
    );
  }

  Widget showSignup() {
    return/* Positioned(
      left: 0,
      right: 0,
      top: _signUpAnimation?.value ?? double.maxFinite,
      child: Column(
        children: <Widget>[*/
          SmartKeyBtn(
            shadow: true,
            btnwidth: 300,
            title: 'Sign Up',
            titlecolor: smartkey3,
            bg: Colors.white,
            route: () {
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => SmartKeyHome(),
              //   ),
              // );
            },
          );
          //SizedBox(height: 16),
        /*],
      ),
    );*/
  }

  Widget showGoSignin() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: _signInAnimation?.value ?? double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Already have an account?',
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
                PageRouteBuilder(pageBuilder: (context, anim1, anim2) => SmartKeySingleLogin()),
              );
            },
            padding: EdgeInsets.all(0),
            child: Text(
              'Sign in',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            _form(),
          ],
        ));
  }
}
