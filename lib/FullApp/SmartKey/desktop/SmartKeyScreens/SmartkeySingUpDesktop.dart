import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';

import 'package:smartkit/FullApp/SmartKey/desktop/SmartKeyScreens/SmartKeyLoginDesktop.dart';
import 'package:smartkit/FullApp/SmartKey/Widget/SmartKeyBtn.dart';

import 'SmartKeyHomeDesktop.dart';

class SmartKeySingUpDesktop extends StatefulWidget {
  SmartKeySingUpDesktop({Key key}) : super(key: key);

  @override
  _SmartKeySingUpDesktopState createState() => _SmartKeySingUpDesktopState();
}

class _SmartKeySingUpDesktopState extends State<SmartKeySingUpDesktop>
    with TickerProviderStateMixin {
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
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 20));

    _signUpAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));

    _signInAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));

    Future.delayed(Duration.zero, () {
      _signUpAnimation =
          Tween(begin: MediaQuery.of(context).size.height, end: 500.0).animate(
              _signUpAnimationController
                  .drive(CurveTween(curve: Curves.easeOut)))
            ..addListener(() {
              setState(() {});
            })
            ..addStatusListener((animationStatus) {
              if (animationStatus == AnimationStatus.completed) {
                _signInAnimationController.forward();
              }
            });

      _signInAnimation = Tween(begin: -32.0, end: 16.0).animate(
          _signInAnimationController.drive(CurveTween(curve: Curves.easeOut)))
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
    //_handleOnTabBackButton();
    return Future.delayed(Duration.zero, () {
      _handleOnTabBackButton();
      //return true;
    });
  }

  void _handleOnTabBackButton() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
          pageBuilder: (context, anim1, anim2) => SmartKeyLoginDesktop()),
    );
  }

  Widget _form() {
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
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
              // showErrorMessage(),
              SizedBox(height: 25),
              showSignup(),
              showGoSignin()
            ],
          ),
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
                color: Colors.black,
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
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
          color: Colors.black,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.person,
            color: Colors.black,
          ),
          labelText: 'USERNAME',
          labelStyle: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            letterSpacing: 2,
            color: Colors.black,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
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
          color: Colors.black,
        ),
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.email,
              color: Colors.black,
            ),
            labelText: 'EMAIL',
            labelStyle: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              letterSpacing: 2,
              color: Colors.black,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
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
          color: Colors.black,
        ),
        obscureText: _obscureText,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.black,
            ),
            labelText: 'PASSWORD',
            labelStyle: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              letterSpacing: 2,
              color: Colors.black,
            ),
            suffixIcon: GestureDetector(
              child: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
                color: Colors.black,
              ),
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
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
          color: Colors.black,
        ),
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.confirmation_number,
              color: Colors.black,
            ),
            labelText: 'REFERRAL CODE (Optional)',
            labelStyle: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              letterSpacing: 2,
              color: Colors.black,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            )),
        onSaved: (value) => refercode = value.trim(),
      ),
    );
  }

  Widget showSignup() {
    return Positioned(
      left: 0,
      right: 0,
      top: _signUpAnimation?.value ?? double.maxFinite,
      child: Column(
        children: <Widget>[
          SmartKeyBtn(
            shadow: true,
            btnwidth: 300,
            title: 'Sign Up',
            titlecolor: Colors.white,
            bg: smartkey3,
            route: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SmartKeyHomeDesktop(),
                ),
              );
            },
          ),
          SizedBox(height: 16),
        ],
      ),
    );
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
              color: Colors.black,
            ),
          ),
          SizedBox(width: 2),
          CupertinoButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                    pageBuilder: (context, anim1, anim2) =>
                        SmartKeyLoginDesktop()),
              );
            },
            padding: EdgeInsets.all(0),
            child: Text(
              'Sign in',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          key: _scaffoldKey,
          resizeToAvoidBottomInset: false,
          body: Stack(
            alignment: Alignment.center,
            children: [
              showBackground(),
              IntrinsicHeight(
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: MediaQuery.of(context).size.width / 2.5,
                    alignment: Alignment.center,
                    child: _form()),
              ),
            ],
          )),
    );
  }
}
