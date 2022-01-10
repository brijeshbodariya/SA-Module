import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:smartkit/Constant/Slideanimation.dart';
import 'dart:math' as math;

import 'package:smartkit/Constant/SmartKitColor.dart';

String groupValue = '';
bool _obscureText = true;

class AnimatedLogin extends StatefulWidget {
  @override
  _AnimatedLoginState createState() => _AnimatedLoginState();
}

class _AnimatedLoginState extends State<AnimatedLogin> with SingleTickerProviderStateMixin {
  final blueColor = Color(0XFF5e92f3);
  final yellowColor = Color(0XFFfdd835);
  // TapGestureRecognizer _tapGestureRecognizer;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 2000));

    // _tapGestureRecognizer = TapGestureRecognizer()
    //   ..onTap = () {
    //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => WRSingup1()));
    //   };
  }

  @override
  void dispose() {
    // _tapGestureRecognizer.dispose();
    super.dispose();
  }

  AnimationController _animationController;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
          body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        ScreenTypeLayout(
                          mobile: Container(
                            height: MediaQuery.of(context).size.width / 2,
                            child: Stack(
                              children: [
                                ScreenTypeLayout(
                                  mobile: ClipPath(
                                    clipper: DrawClip(),
                                    child: Container(
                                      height: size.height * 0.5,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          // Where the linear gradient begins and ends
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomCenter,
                                          // Add one stop for each color. Stops should increase from 0 to 1
                                          stops: [0.1, 0.9],
                                          colors: [Color(0xffA0C5F7), Color(0xffB7ADF1)],
                                        ),
                                      ),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              "assets/MusicFlex.svg",
                                              // fit: BoxFit.cover,
                                              color: Colors.white,
                                              width: MediaQuery.of(context).size.width / 8,
                                              height: MediaQuery.of(context).size.width / 8,
                                            ),
                                            SizedBox(height: 10.0),
                                            Text(
                                              "Music",
                                              style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  desktop: ClipPath(
                                    clipper: DrawClip(),
                                    child: Container(
                                      height: size.height * 0.5,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          // Where the linear gradient begins and ends
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomCenter,
                                          // Add one stop for each color. Stops should increase from 0 to 1
                                          stops: [0.1, 0.9],
                                          colors: [Color(0xffA0C5F7), Color(0xffB7ADF1)],
                                        ),
                                      ),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              "assets/MusicFlex.svg",
                                              // fit: BoxFit.cover,
                                              color: Colors.white,
                                              width: MediaQuery.of(context).size.width / 8,
                                              height: MediaQuery.of(context).size.width / 8,
                                            ),
                                            SizedBox(height: 10.0),
                                            Text(
                                              "Music",
                                              style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          desktop: Container(
                            height: MediaQuery.of(context).size.width / 4,
                            child: Stack(
                              children: [
                                ScreenTypeLayout(
                                  mobile: ClipPath(
                                    clipper: DrawClip(),
                                    child: Container(
                                      height: size.height * 0.5,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          // Where the linear gradient begins and ends
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomCenter,
                                          // Add one stop for each color. Stops should increase from 0 to 1
                                          stops: [0.1, 0.9],
                                          colors: [Color(0xffA0C5F7), Color(0xffB7ADF1)],
                                        ),
                                      ),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              "assets/MusicFlex.svg",
                                              // fit: BoxFit.cover,
                                              color: Colors.white,
                                              width: MediaQuery.of(context).size.width / 8,
                                              height: MediaQuery.of(context).size.width / 8,
                                            ),
                                            SizedBox(height: 10.0),
                                            Text(
                                              "Music",
                                              style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  desktop: ClipPath(
                                    clipper: DrawClip(),
                                    child: Container(
                                      height: size.height * 0.5,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          // Where the linear gradient begins and ends
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomCenter,
                                          // Add one stop for each color. Stops should increase from 0 to 1
                                          stops: [0.1, 0.9],
                                          colors: [Color(0xffA0C5F7), Color(0xffB7ADF1)],
                                        ),
                                      ),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              "assets/MusicFlex.svg",
                                              // fit: BoxFit.cover,
                                              color: Colors.white,
                                              width: MediaQuery.of(context).size.width / 8,
                                              height: MediaQuery.of(context).size.width / 8,
                                            ),
                                            SizedBox(height: 10.0),
                                            Text(
                                              "Music",
                                              style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ScreenTypeLayout(
                          mobile: Container(
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 30,
                                right: 30,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 20.0),
                                  SlideAnimation(
                                    position: 1,
                                    itemCount: 8,
                                    slideDirection: SlideDirection.fromLeft,
                                    animationController: _animationController,
                                    child: Text(
                                      "Sign In",
                                      style: TextStyle(color: Color(0xffB7ADF1), fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25.0,
                                  ),
                                  Container(
                                    child: SingleChildScrollView(
                                      child: buildSignInTextFieldSection(),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25.0,
                                  ),
                                  buildSingInBottomSection(),
                                ],
                              ),
                            ),
                          ),
                          desktop: Container(
                            width: MediaQuery.of(context).size.width / 3,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 30,
                                right: 30,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 20.0),
                                  SlideAnimation(
                                    position: 1,
                                    itemCount: 8,
                                    slideDirection: SlideDirection.fromLeft,
                                    animationController: _animationController,
                                    child: Text(
                                      "Sign In",
                                      style: TextStyle(color: Color(0xffB7ADF1), fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25.0,
                                  ),
                                  Container(
                                    child: SingleChildScrollView(
                                      child: buildSignInTextFieldSection(),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25.0,
                                  ),
                                  buildSingInBottomSection(),
                                ],
                              ),
                            ),
                          ),
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

  Container buildSingInBottomSection() {
    return Container(
      child: ScreenTypeLayout(
        mobile: Column(
          children: [
            SizedBox(
              width: 5,
            ),
            SlideAnimation(
              position: 6,
              itemCount: 8,
              slideDirection: SlideDirection.fromBottom,
              animationController: _animationController,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  primary: Color(0xffB7ADF1),
                  elevation: 1.0,
                  padding: EdgeInsets.symmetric(horizontal: 70, vertical: 12),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "LOGIN",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SlideAnimation(
              position: 7,
              itemCount: 8,
              slideDirection: SlideDirection.fromBottom,
              animationController: _animationController,
              child: RichText(
                text: TextSpan(text: "Don't have an account? ", style: TextStyle(color: Colors.black), children: [
                  TextSpan(
                      text: "Sign up",
                      // recognizer: _tapGestureRecognizer,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color(0xffB7ADF1),
                        fontWeight: FontWeight.bold,
                      ))
                ]),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
        desktop: Column(
          children: [
            SizedBox(
              width: 5,
            ),
            SlideAnimation(
              position: 6,
              itemCount: 8,
              slideDirection: SlideDirection.fromBottom,
              animationController: _animationController,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  primary: Color(0xffB7ADF1),
                  elevation: 1.0,
                  padding: EdgeInsets.symmetric(horizontal: 70, vertical: 12),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SlideAnimation(
              position: 7,
              itemCount: 8,
              slideDirection: SlideDirection.fromBottom,
              animationController: _animationController,
              child: RichText(
                text: TextSpan(text: "Don't have an account? ", style: TextStyle(color: Colors.black), children: [
                  TextSpan(
                      text: "Sign up",
                      // recognizer: _tapGestureRecognizer,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color(0xffB7ADF1),
                        fontWeight: FontWeight.bold,
                      ))
                ]),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Column buildSignInTextFieldSection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 0.0),
          child: SlideAnimation(position: 2, itemCount: 8, slideDirection: SlideDirection.fromLeft, animationController: _animationController, child: buildTextField("EMAIL ADDRESS", "test123@demo.com", false)),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 0.0),
          child: SlideAnimation(position: 3, itemCount: 8, slideDirection: SlideDirection.fromRight, animationController: _animationController, child: buildTextField("PASSWORD", "*******", true)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SlideAnimation(
              position: 4,
              itemCount: 8,
              slideDirection: SlideDirection.fromLeft,
              animationController: _animationController,
              child: Row(
                children: [
                  Radio(
                      toggleable: true,
                      activeColor: Color(0xffB7ADF1),
                      value: "demo",
                      groupValue: groupValue,
                      onChanged: (val) {
                        groupValue = val;
                        setState(() {});
                      }),
                  Text(
                    "Remember me",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            SlideAnimation(position: 5, itemCount: 8, slideDirection: SlideDirection.fromRight, animationController: _animationController, child: Text("Forgot your password?", style: TextStyle(fontSize: 12)))
          ],
        )
      ],
    );
  }

  Container buildTextField(String labelText, String placeholder, bool isPassword) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
          ),
          TextField(
              obscuringCharacter: "*",
              style: TextStyle(color: Color(0xffB7ADF1)),
              obscureText: _obscureText,
              decoration: InputDecoration(
                hintText: placeholder,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffB7ADF1)),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                suffixIcon: isPassword == true
                    ? GestureDetector(
                        child: Icon(
                          _obscureText ? Icons.visibility : Icons.visibility_off,
                          color: Color(0xffB7ADF1),
                        ),
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      )
                    : Container(),
              ))
        ],
      ),
    );
  }
}

class DrawClip extends CustomClipper<Path> {
  double move = 0;
  double slice = math.pi;
  // DrawClip();
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
