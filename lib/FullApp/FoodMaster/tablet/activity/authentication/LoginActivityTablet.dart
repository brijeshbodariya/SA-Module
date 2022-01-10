import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:smartkit/FullApp/FoodMaster/tablet/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/FoodMaster/tablet/helper/Constant.dart';
import 'package:smartkit/FullApp/FoodMaster/tablet/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/FoodMaster/tablet/helper/StringsRes.dart';
import 'package:url_launcher/url_launcher.dart';
import 'SignupActivityTablet.dart';

GlobalKey<ScaffoldState> scaffoldKey;

class LoginActivityTablet extends StatefulWidget {
  @override
  _LoginActivityStateTablet createState() => _LoginActivityStateTablet();
}

class _LoginActivityStateTablet extends State<LoginActivityTablet> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController edtemail = TextEditingController();
  TextEditingController edtpsw = TextEditingController();
  TextEditingController forgotedtemail = TextEditingController();
  bool _obscureText = true;
  @override
  void initState() {
    super.initState();
    scaffoldKey = GlobalKey<ScaffoldState>();
  }

  Future<bool> _backPress() {
    return new Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return WillPopScope(
        onWillPop: _backPress,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: ColorsRes.bgcolor,
          body: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: 'https://smartkit.wrteam.in/smartkit/foodmaster/login_bg.png',
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 15, left: 15, right: 15),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Card(
                          shape: DesignConfig.setRoundedBorder(ColorsRes.white, 8, false),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Icon(
                              Icons.keyboard_arrow_left,
                              color: ColorsRes.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SingleChildScrollView(
                        padding: EdgeInsets.only(left: 20, right: 20, bottom: kToolbarHeight - 10),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  StringsRes.lbllogin,
                                  style: Theme.of(context).textTheme.headline4.merge(TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold)),
                                ),
                              ),
                              SizedBox(height: 15),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  StringsRes.lblemail,
                                  style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.grey, fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Container(
                                decoration: DesignConfig.boxDecorationContainer(ColorsRes.white, 10),
                                margin: EdgeInsets.only(top: 5),
                                padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                                child: TextFormField(
                                  style: TextStyle(color: ColorsRes.black),
                                  cursorColor: ColorsRes.black,
                                  decoration: InputDecoration(
                                    hintText: StringsRes.youremail,
                                    hintStyle: Theme.of(context).textTheme.subtitle2.merge(TextStyle(fontWeight: FontWeight.bold, color: ColorsRes.grey.withOpacity(0.5))),
                                    border: InputBorder.none,
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  controller: edtemail,
                                ),
                              ),
                              SizedBox(height: 20),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  StringsRes.password,
                                  style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.grey, fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Container(
                                decoration: DesignConfig.boxDecorationContainer(ColorsRes.white, 10),
                                margin: EdgeInsets.only(top: 5),
                                padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                                child: TextFormField(
                                  obscureText: _obscureText,
                                  controller: edtpsw,
                                  style: TextStyle(color: ColorsRes.black),
                                  cursorColor: ColorsRes.black,
                                  decoration: InputDecoration(
                                    hintText: StringsRes.password,
                                    hintStyle: Theme.of(context).textTheme.subtitle2.merge(TextStyle(fontWeight: FontWeight.bold, color: ColorsRes.grey.withOpacity(0.5))),
                                    border: InputBorder.none,
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _obscureText = !_obscureText;
                                        });
                                      },
                                      child: Icon(
                                        _obscureText ? Icons.visibility : Icons.visibility_off,
                                        color: ColorsRes.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  //launch(Constant.forgotpasswordurl);
                                  /*showDialog(
                                      context: context,
                                      builder: (context) => ForgotDialog());*/
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: 10),
                                  padding: const EdgeInsets.all(5),
                                  width: double.maxFinite,
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "${StringsRes.forgotpassword} ?",
                                    style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.appcolor)),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 25),
                                child: GestureDetector(
                                    onTap: () async {
                                      Constant.goToMainPage("login", context);
                                    },
                                    child: DesignConfig.shadowButtonFullwidgth(ColorsRes.appcolor, StringsRes.lbllogin.toUpperCase(), ColorsRes.white, 25, ColorsRes.appcolor, context)),
                              ),
                              RichText(
                                  text: TextSpan(style: new TextStyle(color: ColorsRes.black), text: StringsRes.donthvac, children: <TextSpan>[
                                TextSpan(
                                    text: StringsRes.lblsignup,
                                    style: TextStyle(color: ColorsRes.appcolor),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.of(context).push(CupertinoPageRoute(builder: (context) => SignupActivityTablet(from: "login")));
                                      }),
                              ])),
                              SizedBox(
                                height: 35,
                              ),
                              Row(children: [
                                Expanded(
                                    child: Divider(
                                  color: ColorsRes.black,
                                  indent: 15,
                                  endIndent: 15,
                                )),
                                Text(
                                  StringsRes.signinwith,
                                  style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.black)),
                                ),
                                Expanded(
                                    child: Divider(
                                  color: ColorsRes.black,
                                  indent: 15,
                                  endIndent: 15,
                                )),
                              ]),
                              SizedBox(
                                height: 20,
                              ),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                                Expanded(
                                  child: GestureDetector(
                                      onTap: () {
                                        Constant.goToMainPage("login", context);
                                      },
                                      child: CachedNetworkImage(
                                        imageUrl: "https://smartkit.wrteam.in/smartkit/foodmaster/button__facebook.png",
                                        width: width / 2.5,
                                      )),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: GestureDetector(
                                      onTap: () {
                                        Constant.goToMainPage("login", context);
                                      },
                                      child: CachedNetworkImage(
                                        imageUrl: "https://smartkit.wrteam.in/smartkit/foodmaster/button_google.png",
                                        width: width / 2.5,
                                      )),
                                ),
                                if (Platform.isIOS)
                                  Expanded(
                                    child: GestureDetector(
                                        onTap: () {
                                          Constant.goToMainPage("login", context);
                                        },
                                        child: CachedNetworkImage(
                                          imageUrl: "https://smartkit.wrteam.in/smartkit/foodmaster/button_apple.png",
                                          width: width / 2.5,
                                        )),
                                  ),
                              ]),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
