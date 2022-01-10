import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/FullApp/SmartKey/desktop/SmartKeyScreens/SmartkeySingUpDesktop.dart';
import 'package:smartkit/FullApp/SmartKey/Widget/SmartKeyBtn.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitHome.dart';

import 'SmartKeyHomeDesktop.dart';

class SmartKeyLoginDesktop extends StatefulWidget {
  SmartKeyLoginDesktop({Key key}) : super(key: key);

  @override
  _SmartKeyLoginDesktopState createState() => _SmartKeyLoginDesktopState();
}

class _SmartKeyLoginDesktopState extends State<SmartKeyLoginDesktop> with TickerProviderStateMixin {
  AnimationController _animationController;
  AnimationController _signUpAnimationController;
  Animation<double> _signUpAnimation;
  AnimationController _signInAnimationController;
  Animation<double> _signInAnimation;
  String email;
  String password;
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    print("==login");
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 20));

    _signUpAnimationController = AnimationController(vsync: this, duration: Duration(milliseconds: 250));

    _signInAnimationController = AnimationController(vsync: this, duration: Duration(milliseconds: 250));

    Future.delayed(Duration.zero, () {
      _signUpAnimation = Tween(begin: MediaQuery.of(context).size.height, end: 420.0).animate(_signUpAnimationController.drive(CurveTween(curve: Curves.easeOut)))
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
    return Future.delayed(Duration.zero, () {
      _handleOnTabBackButton();
    });
  }

  void _handleOnTabBackButton() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(pageBuilder: (context, anim1, anim2) => MyHomePage()),
    );
  }

  Widget _showForm() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _showBackLogo(),
            SizedBox(height: 32),
            _showEmail(),
            SizedBox(height: 16),
            _showPwd(),
            SizedBox(height: 16),
            _showFPwd(),
            // showErrorMessage(),

            SizedBox(height: 16),
            _showSignIn(),
            SizedBox(height: 16),
            _showSocialMedia(),
            SizedBox(height: 8),
            _showGoSignup(),
          ],
        ),
      ),
    );
  }

  Widget _showBackground() {
    return Container(
        width: double.infinity,
        height: double.infinity,
        // Add box decoration
        decoration: BoxDecoration(
          // Box decoration takes a gradient
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.topRight,
            end: Alignment.bottomCenter,
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: [0.1, 0.9],
            colors: [smartkey3, smartkey2],
          ),
        ));
  }

  Widget _showBackLogo() {
    return Stack(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                'Sign In',
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

  Widget _showEmail() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32),
      child: TextFormField(
        style: TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
            labelText: 'EMAIL',
            prefixIcon: Icon(
              Icons.email,
              color: Colors.black,
            ),
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
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _showSignIn() {
    return Positioned(
      left: 20,
      right: 20,
      top: _signUpAnimation?.value ?? double.maxFinite,
      child: SmartKeyBtn(
          shadow: true,
          btnwidth: 300,
          title: 'Log In',
          titlecolor: Colors.white,
          bg: smartkey3,
          route: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => SmartKeyHomeDesktop(),
              ),
            );
          }),
    );
  }

  // Perform login
  void validateAndSubmit() async {
    if (validateAndSave()) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return new CupertinoAlertDialog(
              title: new Text("act_verify_1"),
              content: new Text("act_verify_2"),
              actions: [
                CupertinoDialogAction(
                    isDefaultAction: true,
                    child: new Text("Cancel"),
                    onPressed: () {
                      Navigator.pop(context, 'Cancel');
                    }),
                CupertinoDialogAction(
                    isDefaultAction: true,
                    child: new Text("Ok"),
                    onPressed: () {
                      // call another functions here ---
                      Navigator.pop(context, 'Cancel');
                    })
              ],
            );
          });
    }
  }

  // Check if form is valid before perform login
  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Widget _showSocialMedia() {
    double top = _signUpAnimation?.value ?? double.maxFinite;
    return Positioned(
      left: 20,
      right: 20,
      top: top + 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
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
                    /*child: SvgPicture.asset(
                      'assets/ggl.svg',
                      height: 40.0,
                      fit: BoxFit.fill,
                    ),*/
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
                    /*child: SvgPicture.asset(
                      'assets/fb.svg',
                      height: 40.0,
                      fit: BoxFit.fill,
                    ),*/
                  ),
                )),
            onTap: () {},
          ),
          Text(
            "  OR  ",
            style: TextStyle(color: Colors.black.withOpacity(0.8)),
          ),
          Card(
              color: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                Radius.circular(24.0),
              )),
              elevation: 0.0,
              child: Container(
                height: 40,
                width: 40,
                child: Card(
                    color: Colors.white,
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Icon(
                      Icons.person,
                      color: Colors.black,
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
      bottom: _signInAnimation?.value ?? double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Don't have account ?",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 2),
          CupertinoButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(pageBuilder: (context, anim1, anim2) => SmartKeySingUpDesktop()),
              );
            },
            padding: EdgeInsets.all(0),
            child: Text(
              'Sign Up',
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
            _showBackground(),
            IntrinsicHeight(
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  width: MediaQuery.of(context).size.width / 2.5,
                  //height: MediaQuery.of(context).size.width / 2.5,
                  alignment: Alignment.center,
                  child: _showForm()),
            ),
          ],
        ),
      ),
    );
  }
}
