import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit/Constant/Slideanimation.dart';

import 'WRLogin1.dart';

String groupValue = '';
bool _obscureText = true;

class WRSingup1 extends StatefulWidget {
  @override
  _WRSingup1State createState() => _WRSingup1State();
}

class _WRSingup1State extends State<WRSingup1> with SingleTickerProviderStateMixin {
  final blueColor = Color(0XFF5e92f3);
  final yellowColor = Color(0XFFfdd835);

  TapGestureRecognizer _tapGestureRecognizer;
  // bool _showSignIn;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 2000));
    // _showSignIn = true;
    _tapGestureRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => WRLogin1()));
      };
  }

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  AnimationController _animationController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // margin: EdgeInsets.only(top: MediaQuery.of(context).size.width / 8),
                    height: MediaQuery.of(context).size.width / 1.4,
                    child: Stack(
                      children: [
                        SvgPicture.asset(
                          "assets/shape.svg",
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width / 1.4,
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/MusicFlex.svg",
                                // fit: BoxFit.cover,
                                color: Colors.white,
                                width: MediaQuery.of(context).size.width / 3.8,
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                "Music",
                                style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
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
                            "Sign Up",
                            style: TextStyle(color: Color(0xFF6CC2F1), fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Container(
                          child: SingleChildScrollView(
                            child: buildSignUpTextFieldSection(),
                          ),
                        ),
                        buildSingUpBottomSection(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }

  Container buildSingUpBottomSection() {
    return Container(
      child: Column(
        children: [
          SlideAnimation(
            position: 5,
            itemCount: 7,
            slideDirection: SlideDirection.fromBottom,
            animationController: _animationController,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                primary: Color(0xFF6CC2F1),
                elevation: 1.0,
                padding: EdgeInsets.symmetric(horizontal: 70, vertical: 12),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "SING UP",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 5,
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
              text: TextSpan(text: "Already have an account? ", style: TextStyle(color: Colors.black), children: [
                TextSpan(
                    text: "Log in",
                    recognizer: _tapGestureRecognizer,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Color(0xFF6CC2F1),
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
    );
  }

  Column buildSignUpTextFieldSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SlideAnimation(position: 2, itemCount: 8, slideDirection: SlideDirection.fromLeft, animationController: _animationController, child: buildTextField("USERNAME", "Demo", false)),
        SizedBox(
          height: 10,
        ),
        SlideAnimation(position: 3, itemCount: 8, slideDirection: SlideDirection.fromRight, animationController: _animationController, child: buildTextField("EMAIL ADDRESS", "test123@demo.com", false)),
        SizedBox(
          height: 10,
        ),
        SlideAnimation(position: 4, itemCount: 8, slideDirection: SlideDirection.fromLeft, animationController: _animationController, child: buildTextField("PASSWORD", "*******", true)),
        SlideAnimation(
          position: 5,
          itemCount: 8,
          slideDirection: SlideDirection.fromBottom,
          animationController: _animationController,
          child: Row(
            children: [
              Radio(
                  toggleable: true,
                  value: "demo",
                  groupValue: groupValue,
                  onChanged: (val) {
                    groupValue = val;
                    setState(() {});
                  }),
              Text(
                "I agree with",
                style: TextStyle(fontSize: 12),
              ),
              Text(
                " Private Policy",
                style: TextStyle(fontSize: 12, color: Color(0xFF6CC2F1)),
              ),
            ],
          ),
        ),
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
              style: TextStyle(color: Color(0xFF6CC2F1)),
              obscureText: _obscureText,
              decoration: InputDecoration(
                hintText: placeholder,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF6CC2F1)),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                suffixIcon: isPassword == true
                    ? GestureDetector(
                        child: Icon(
                          _obscureText ? Icons.visibility : Icons.visibility_off,
                          color: Color(0xFF6CC2F1),
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
