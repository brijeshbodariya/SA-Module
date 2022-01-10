import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/helper/Constant.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/helper/StringsRes.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/activity/TermsConditionActivityMobile.dart';
import 'package:smartkit/services/auth_model.dart';
import 'package:smartkit/services/auth_service.dart';
import 'package:toast/toast.dart';
import '../MainHomePageMobile.dart';
import 'LoginActivityMobile.dart';

class SignupActivityMobile extends StatefulWidget {
  final String from;
  const SignupActivityMobile({
    Key key,
    this.from,
  }) : super(key: key);
  @override
  _SignupActivityStateMobile createState() => _SignupActivityStateMobile();
}

class _SignupActivityStateMobile extends State<SignupActivityMobile> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController edtname = TextEditingController();
  TextEditingController edtphone = TextEditingController();
  TextEditingController edtemail = TextEditingController();
  TextEditingController edtpsw = TextEditingController();
  TextEditingController edtcpsw = TextEditingController();
  TextEditingController forgotedtemail = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey;
  AuthServices authServices = AuthServices();
  AuthModel authModel = AuthModel();
  bool _obscureText = true, _conobscureText = true;
  bool acceptterms = false;
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
                        padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            //top: kToolbarHeight,
                            bottom: 10),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  StringsRes.lblsignup,
                                  style: Theme.of(context).textTheme.headline4.merge(TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold)),
                                ),
                              ),
                              SizedBox(height: 15),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  StringsRes.lblname,
                                  style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.grey, fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Container(
                                decoration: DesignConfig.boxDecorationContainer(ColorsRes.white, 10),
                                margin: EdgeInsets.only(top: 2),
                                padding: EdgeInsets.only(left: 10),
                                child: TextFormField(
                                  style: TextStyle(color: ColorsRes.black),
                                  cursorColor: ColorsRes.black,
                                  decoration: InputDecoration(
                                    hintText: StringsRes.lblname,
                                    hintStyle: Theme.of(context).textTheme.subtitle2.merge(TextStyle(fontWeight: FontWeight.bold, color: ColorsRes.grey.withOpacity(0.5))),
                                    border: InputBorder.none,
                                  ),
                                  keyboardType: TextInputType.text,
                                  controller: edtname,
                                ),
                              ),
                              SizedBox(height: 10),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  StringsRes.lblemail,
                                  style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.grey, fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Container(
                                decoration: DesignConfig.boxDecorationContainer(ColorsRes.white, 10),
                                margin: EdgeInsets.only(top: 2),
                                padding: EdgeInsets.only(left: 10),
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
                              SizedBox(height: 10),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  StringsRes.lblmobileno,
                                  style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.grey, fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Container(
                                decoration: DesignConfig.boxDecorationContainer(ColorsRes.white, 10),
                                margin: EdgeInsets.only(top: 2),
                                padding: EdgeInsets.only(left: 10),
                                child: TextFormField(
                                  style: TextStyle(color: ColorsRes.black),
                                  cursorColor: ColorsRes.black,
                                  decoration: InputDecoration(
                                    hintText: StringsRes.lblmobileno,
                                    hintStyle: Theme.of(context).textTheme.subtitle2.merge(TextStyle(fontWeight: FontWeight.bold, color: ColorsRes.grey.withOpacity(0.5))),
                                    border: InputBorder.none,
                                  ),
                                  keyboardType: TextInputType.phone,
                                  controller: edtphone,
                                ),
                              ),
                              SizedBox(height: 10),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  StringsRes.password,
                                  style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.grey, fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Container(
                                decoration: DesignConfig.boxDecorationContainer(ColorsRes.white, 10),
                                margin: EdgeInsets.only(top: 2),
                                padding: EdgeInsets.only(left: 10),
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
                              SizedBox(height: 10),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  StringsRes.confirmpassword,
                                  style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.grey, fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Container(
                                decoration: DesignConfig.boxDecorationContainer(ColorsRes.white, 10),
                                margin: EdgeInsets.only(top: 2),
                                padding: EdgeInsets.only(left: 10),
                                child: TextFormField(
                                  obscureText: _conobscureText,
                                  controller: edtcpsw,
                                  style: TextStyle(color: ColorsRes.black),
                                  cursorColor: ColorsRes.black,
                                  decoration: InputDecoration(
                                    hintText: StringsRes.password,
                                    hintStyle: Theme.of(context).textTheme.subtitle2.merge(TextStyle(fontWeight: FontWeight.bold, color: ColorsRes.grey.withOpacity(0.5))),
                                    border: InputBorder.none,
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _conobscureText = !_conobscureText;
                                        });
                                      },
                                      child: Icon(
                                        _conobscureText ? Icons.visibility : Icons.visibility_off,
                                        color: ColorsRes.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Transform.scale(
                                    scale: 0.9,
                                    child: Checkbox(
                                        value: acceptterms,
                                        onChanged: (value) => setState(() {
                                              acceptterms = !acceptterms;
                                            })),
                                  ),
                                  Flexible(
                                    child: RichText(
                                        text: TextSpan(style: new TextStyle(color: ColorsRes.grey), text: StringsRes.i_accept, children: <TextSpan>[
                                      TextSpan(
                                          text: StringsRes.termsandcondition,
                                          style: TextStyle(color: ColorsRes.IconColor, decoration: TextDecoration.underline),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigator.of(context).push(CupertinoPageRoute(builder: (context) => TermsConditionActivityMobile()));
                                            }),
                                      TextSpan(text: "\t${StringsRes.Lbl_AND}\t"),
                                      TextSpan(
                                          text: StringsRes.privacypolicy,
                                          style: TextStyle(color: ColorsRes.IconColor, decoration: TextDecoration.underline),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigator.of(context).push(CupertinoPageRoute(builder: (context) => TermsConditionActivityMobile()));
                                            }),
                                    ])),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 20),
                                child: GestureDetector(
                                    onTap: () async {
                                      if (_formKey.currentState.validate()) {
                                        try {
                                          UserCredential appUser =
                                          await authServices.authCreateUser(
                                              emailInput: edtemail.text,
                                              passwordInput: edtpsw.text,
                                              context: context);
                                          print("appUser --->$appUser");
                                          Toast.show("Register SuccessFully", context,
                                              backgroundColor: ColorsRes.black,
                                              textColor: ColorsRes.white,
                                              duration: 5);
                                          if (appUser != null) {
                                            Constant.goToMainPage("login", context);
                                          }
                                        } catch (e) {
                                          Toast.show(e.message.toString(), context,
                                              backgroundColor: ColorsRes.black,
                                              textColor: ColorsRes.white,
                                              duration: 5);
                                          print("error --->$e");
                                        }
                                      }
                                      //Constant.goToMainPage("login", context);
                                    },
                                    child: DesignConfig.shadowButtonFullwidgth(ColorsRes.appcolor, StringsRes.lblsignup.toUpperCase(), ColorsRes.white, 25, ColorsRes.appcolor, context)),
                              ),
                              RichText(
                                  text: TextSpan(style: new TextStyle(color: ColorsRes.black), text: StringsRes.alreadyhvac, children: <TextSpan>[
                                TextSpan(
                                    text: StringsRes.lblsignin,
                                    style: TextStyle(color: ColorsRes.IconColor),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        if (widget.from == 'loginhome') {
                                          Navigator.of(context).push(CupertinoPageRoute(builder: (context) => LoginActivityMobile()));
                                        } else {
                                          Navigator.of(context).pop();
                                        }
                                      }),
                              ])),
                            ],
                          ),
                        ),
                      ),
                    ),
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
                    height: 10,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                    SizedBox(width:10),
                    Expanded(
                      child: GestureDetector(
                          onTap: () {
                            try {
                              EasyLoading.show(
                                  indicator: CircularProgressIndicator(
                                  ));
                              authModel.foodMasterFacebookLogin(context);
                              EasyLoading.dismiss();
                            } catch (e) {
                              Toast.show(e.toString(), context,
                                  duration: 10);
                            }
                          },
                          child: CachedNetworkImage(
                            imageUrl: "https://smartkit.wrteam.in/smartkit/foodmaster/button__facebook.png",

                          )),
                    ),
                    SizedBox(width:10),
                    Expanded(
                      child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                CupertinoPageRoute(
                                    builder: (context) => MainHomePageMobile(
                                          from: "pagefrom",
                                        )),
                                (Route<dynamic> route) => false);
                          },
                          child: CachedNetworkImage(imageUrl: "https://smartkit.wrteam.in/smartkit/foodmaster/button_google.png")),
                    ),
                    SizedBox(width:10),
                    if (Platform.isIOS)
                      Expanded(
                        child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                  CupertinoPageRoute(
                                      builder: (context) => MainHomePageMobile(
                                            from: "pagefrom",
                                          )),
                                  (Route<dynamic> route) => false);
                            },
                            child: CachedNetworkImage(imageUrl: "https://smartkit.wrteam.in/smartkit/foodmaster/button_apple.png")),
                      ),
                    SizedBox(width:10),
                  ]),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
