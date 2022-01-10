import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smartkit/SmartkitScreen/Widget/WrGlassmorphism.dart';

class GlassSingup extends StatefulWidget {
  GlassSingup({Key key}) : super(key: key);

  @override
  _GlassSingupState createState() => _GlassSingupState();
}

class _GlassSingupState extends State<GlassSingup> {
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
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        "https://smartkit.wrteam.in/smartkit/images/loginbg.png",
                      ),
                      fit: BoxFit.cover),
                ),
                // child: Padding(
                //   padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0, bottom: 20.0),
                child: SvgPicture.network(
                  "https://smartkit.wrteam.in/smartkit/images/bg1.svg",
                  height: height,
                  width: width,
                  fit: BoxFit.cover,
                ),
                // ),
              ),
              // Positioned(
              //   top: bottompos.toDouble(),
              //   left: leftpos.toDouble(),
              //   child: CachedNetworkImage(imageUrl:"https://smartkit.wrteam.in/smartkit/images/circle.png", height: width * 1),
              // ),
              // Positioned(
              //   top: 110.0,
              //   right: leftpos.toDouble(),
              //   child: CachedNetworkImage(imageUrl:"assets/images/circle.png", height: width / 1.4),
              // ),
              // WrGlassMorphism(),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: width / 6,
                      ),
                      Text(
                        "Create \naccount",
                        style: TextStyle(color: Colors.white70, fontFamily: 'Open Sans', fontSize: width / 10, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: width / 18,
                      ),
                      WrGlassMorphism(
                        borderRadius: 10.0,
                        borderwidth: 0.0,
                        blur: 15.0,
                        bgcolor: Color(0xFFEEB6EE),
                        // height: height,
                        width: width,
                        child: Column(
                          children: [
                            SizedBox(
                              height: width / 8,
                            ),
                            WrGlassMorphism(
                              width: width / 1.2,
                              // height: 80,
                              borderRadius: 30.0,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: TextField(
                                  cursorColor: Colors.white.withOpacity(0.2),
                                  cursorRadius: Radius.circular(30),
                                  decoration: InputDecoration(
                                    hintText: "Name",
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
                              // height: 80,
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
                              // height: 80,
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
                                    "Sign up",
                                    style: TextStyle(color: Colors.white, fontSize: width / 12, fontWeight: FontWeight.w700),
                                  ),
                                  Container(
                                      width: width / 7,
                                      height: width / 7,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40.0), color: Colors.white, boxShadow: [
                                        BoxShadow(
                                          color: Color(0xFF440d97).withOpacity(0.5),
                                          // spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0, 3),
                                        )
                                      ]),
                                      child: Icon(
                                        Icons.arrow_right_alt_rounded,
                                        size: width / 8,
                                        color: Color(0xFF440d97),
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
                                    onTap: () {
                                      return Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Sign in",
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
            ],
          )),
    );
  }
}
