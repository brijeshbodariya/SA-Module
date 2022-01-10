import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smartkit/SmartkitScreen/Widget/WrGlassmorphism.dart';

import 'package:smartkit/integration/helper/ColorsRes.dart';

class FirebaseLoginUI extends StatefulWidget {
  FirebaseLoginUI({Key key}) : super(key: key);

  @override
  _FirebaseLoginUIState createState() => _FirebaseLoginUIState();
}

class _FirebaseLoginUIState extends State<FirebaseLoginUI> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Container(
                height: height,
                width: width,
                child: SvgPicture.network(
                  "https://smartkit.wrteam.in/smartkit/images/bg1.svg",
                  height: height,
                  width: width,
                  fit: BoxFit.cover,
                ),
              ),

              Positioned(
                top: 50.0,
                left: 15.0,
                child: Text(
                  "Welcome \nback",
                  style: TextStyle(color: Colors.white, fontSize: width / 10, fontWeight: FontWeight.w700),
                ),
              ),
              // WrGlassMorphism(),
              Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Column(
                      children: [
                        WrGlassMorphism(
                          borderRadius: 10.0,
                          borderwidth: 0.0,
                          blur: 15.0,
                          bgcolor: Color(0xFFEEB6EE),
                          width: width,
                          child: Column(
                            children: [
                              SizedBox(
                                height: width / 8,
                              ),
                              WrGlassMorphism(
                                width: width / 1.2,
                                borderRadius: 30.0,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: TextField(
                                    cursorColor: Colors.white.withOpacity(0.2),
                                    cursorRadius: Radius.circular(30),
                                    decoration: InputDecoration(
                                      hintText: "Email address",
                                      hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.transparent),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.transparent),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              WrGlassMorphism(
                                width: width / 1.2,
                                borderRadius: 30.0,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: TextField(
                                    cursorColor: Colors.white.withOpacity(0.2),
                                    cursorRadius: Radius.circular(30),
                                    obscuringCharacter: "*",
                                    obscureText: _obscureText,
                                    decoration: InputDecoration(
                                      hintText: "Password",
                                      hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.transparent),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.transparent),
                                      ),
                                      suffixIcon: GestureDetector(
                                        child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off, color: Colors.white.withOpacity(0.5)),
                                        onTap: () {
                                          setState(() {
                                            _obscureText = !_obscureText;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 20.0,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    WrGlassMorphism(
                                      borderRadius: 30.0,
                                      child: Container(
                                          width: width / 7,
                                          height: width / 7,
                                          child: Icon(
                                            FontAwesomeIcons.facebookF,
                                            color: Colors.white70,
                                          )),
                                    ),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    WrGlassMorphism(
                                      borderRadius: 30.0,
                                      child: Container(
                                          width: width / 7,
                                          height: width / 7,
                                          child: Icon(
                                            FontAwesomeIcons.googlePlusG,
                                            color: Colors.white70,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 35.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Sign in",
                                      style: TextStyle(color: Colors.white, fontSize: width / 12, fontWeight: FontWeight.w700),
                                    ),
                                    Container(
                                        width: width / 7,
                                        height: width / 7,
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(40.0), color: Colors.white, boxShadow: [
                                          BoxShadow(
                                            color: ColorsRes.appcolor,
                                            blurRadius: 7,
                                            offset: Offset(0, 3),
                                          )
                                        ]),
                                        child: Icon(
                                          Icons.arrow_right_alt_rounded,
                                          size: width / 8,
                                          color: ColorsRes.appcolor,
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 25.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: Text(
                                        "Sign up",
                                        style: TextStyle(
                                          fontSize: 16,
                                          decoration: TextDecoration.underline,
                                          color: Colors.white70,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Forgot password?",
                                      style: TextStyle(
                                        fontSize: 16,
                                        decoration: TextDecoration.underline,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: width / 12,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
