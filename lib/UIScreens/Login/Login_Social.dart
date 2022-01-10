import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/SmartkitScreen/Widget/SocialBtn.dart';

class SocialLogin extends StatefulWidget {
  SocialLogin({Key key}) : super(key: key);

  @override
  _SocialLoginState createState() => _SocialLoginState();
}

class _SocialLoginState extends State<SocialLogin> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
                top: 0.0,
                child: ShaderMask(
                    shaderCallback: (bounds) {
                      return LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xffB552E3), Color(0xffA758E5)], stops: [0.6, 0.8]).createShader(bounds);
                    },
                    child: Container(
                        child: SvgPicture.network(
                      "https://smartkit.wrteam.in/smartkit/images/top.svg",
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    )))),
            Positioned(
                right: 0.0,
                bottom: 0.0,
                child: ShaderMask(
                    shaderCallback: (bounds) {
                      return LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xffB552E3), Color(0xffA758E5)], stops: [0.7, 0.8]).createShader(bounds);
                    },
                    child: SvgPicture.network(
                      "https://smartkit.wrteam.in/smartkit/images/bottom.svg",
                      height: MediaQuery.of(context).size.height / 1.8,
                    ))),
            Positioned(
              top: 90.0,
              left: MediaQuery.of(context).size.width / 12,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 65.0,
                      width: 65.0,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SvgPicture.asset(
                          "assets/MotiQuotes.svg",
                          color: Colors.white,
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11.0),
                        gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xffB552E3), Color(0xffA758E5)], stops: [0.8, 0.9]),
                        boxShadow: [
                          BoxShadow(
                            color: quotes5,
                            offset: Offset(1, 1),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Quotes",
                      style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 32,
                        color: const Color(0xffA758E5),
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Column(
                      children: [
                        Text(
                          "Sing Up",
                          style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontSize: 28,
                            color: const Color(0xff333333),
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "it's easier to sing in now..",
                          style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontSize: 14,
                            color: const Color(0xFF5E5E5E),
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SocialBtn(
                          bgcolor: Color(0xFFF3F3F3),
                          icon: Icon(
                            FontAwesomeIcons.google,
                            color: Colors.red,
                          ),
                          text: "Sign in with Google",
                          textColor: Colors.red,
                        )),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SocialBtn(
                          bgcolor: Color(0xFF1877f2),
                          icon: Icon(
                            FontAwesomeIcons.facebookF,
                            color: Colors.white,
                          ),
                          text: "Sign in with Facebook",
                          textColor: Colors.white,
                        )),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: SocialBtn(
                          bgcolor: Color(0xFF007BB6),
                          icon: Icon(
                            FontAwesomeIcons.linkedinIn,
                            color: Colors.white,
                          ),
                          text: "Sign in with LinkedIn",
                          textColor: Colors.white,
                        )),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SocialBtn(
                          bgcolor: Color(0xFF1DA1F2),
                          icon: Icon(
                            FontAwesomeIcons.twitter,
                            color: Colors.white,
                          ),
                          text: "Sign in with Twitter",
                          textColor: Colors.white,
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
