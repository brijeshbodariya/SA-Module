//Signup_Page1

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:smartkit/FullApp/CryptoTech/activity/LoginActivity.dart';
import 'package:smartkit/FullApp/CryptoTech/activity/SignUp/Signup_Page2.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/Constant.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/StringsRes.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/ease_in_widget.dart';
import 'package:smartkit/services/auth_service.dart';
import 'package:toast/toast.dart';

import '../TermsConditionActivity.dart';

class Signup_Page1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new Signup_Page1State();
  }
}

class Signup_Page1State extends State<Signup_Page1> {
  Color btntextcolor = ColorsRes.firstgradientcolor;
  TextEditingController edtemail = new TextEditingController();
  TextEditingController edtpassword = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String selectedtype = '';
  bool txt1enable = false, txt2enable = false, chktypeerr = false, acceptterms = false;
  AuthServices authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    double toppadding = (2 * kToolbarHeight) + MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: Container(
              color: ColorsRes.bgcolor,
              // constraints: BoxConstraints.expand(),
              /*  decoration: BoxDecoration(
                gradient: DesignConfig.gradient,
              ), */
              padding: EdgeInsets.only(top: toppadding, left: 20, right: 20),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: ScreenTypeLayout(
                    mobile: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringsRes.enter_email_2,
                          style: Theme.of(context).textTheme.button.merge(TextStyle(color: ColorsRes.txtlightcolor, fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(height: 8),
                        Container(
                          decoration: DesignConfig.BoxDecorationContainer(ColorsRes.editboxcolor, 15),
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          child: TextFormField(
                            style: TextStyle(color: ColorsRes.appcolor),
                            cursorColor: ColorsRes.appcolor,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '${StringsRes.email}',
                              hintStyle: Theme.of(context).textTheme.subtitle1.merge(TextStyle(fontWeight: FontWeight.bold, color: ColorsRes.appcolor.withOpacity(0.5))),
                            ),
                            controller: edtemail,
                            keyboardType: TextInputType.text,
                            validator: (val) => val.trim().isEmpty ? "${StringsRes.enter_email_2}" : null,
                            onChanged: (String txt) {
                              if (txt.trim().isEmpty && txt1enable) {
                                setState(() {
                                  txt1enable = false;
                                });
                              } else if (!txt1enable) {
                                setState(() {
                                  txt1enable = true;
                                });
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 30),
                        Text(
                          StringsRes.enter_password_2,
                          style: Theme.of(context).textTheme.button.merge(TextStyle(color: ColorsRes.txtlightcolor, fontWeight: FontWeight.bold)),
                        ),
                        Container(
                            decoration: DesignConfig.BoxDecorationContainer(ColorsRes.editboxcolor, 15),
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            child: TextFormField(
                              style: TextStyle(color: ColorsRes.appcolor),
                              cursorColor: ColorsRes.appcolor,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '${StringsRes.password}',
                                hintStyle: Theme.of(context).textTheme.subtitle1.merge(TextStyle(fontWeight: FontWeight.bold, color: ColorsRes.appcolor.withOpacity(0.5))),
                              ),
                              controller: edtpassword,
                              keyboardType: TextInputType.text,
                              validator: (val) => val.trim().isEmpty ? "${StringsRes.enter_password_2}" : null,
                              onChanged: (String txt) {
                                if (txt.trim().isEmpty && txt2enable) {
                                  setState(() {
                                    txt2enable = false;
                                  });
                                } else if (!txt2enable) {
                                  setState(() {
                                    txt2enable = true;
                                  });
                                }
                              },
                            )),
                        SizedBox(height: 30),
                        Row(children: [
                          Expanded(
                            child: EaseInWidget(
                              onTap: () {
                                if (selectedtype != Constant.UserType_Amateur)
                                  setState(() {
                                    selectedtype = Constant.UserType_Amateur;
                                  });
                              },
                              child: Container(
                                  decoration:
                                      BoxDecoration(borderRadius: BorderRadius.circular(15), color: ColorsRes.editboxcolor, border: Border.all(width: 1, color: selectedtype == Constant.UserType_Amateur ? ColorsRes.appcolor : ColorsRes.editboxcolor)),
                                  padding: EdgeInsets.only(top: 8, bottom: 8, left: 10, right: 5),
                                  child: Row(
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: 'https://smartkit.wrteam.in/smartkit/cryptotech/enable_amateur.png',
                                        height: MediaQuery.of(context).size.width / 10,
                                        color: selectedtype == Constant.UserType_Amateur ? ColorsRes.appcolor : ColorsRes.grey,
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(StringsRes.lblamateur,
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context).textTheme.button.merge(TextStyle(
                                                  color: selectedtype == Constant.UserType_Amateur ? ColorsRes.appcolor : ColorsRes.firstgradientcolor.withOpacity(0.7), decoration: TextDecoration.none, fontWeight: FontWeight.bold, fontFamily: 'MyFont'))),
                                          Text(StringsRes.lblbeginner,
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption
                                                  .merge(TextStyle(color: selectedtype == Constant.UserType_Amateur ? ColorsRes.txtlightcolor : ColorsRes.grey, decoration: TextDecoration.none, fontWeight: FontWeight.bold, fontFamily: 'MyFont'))),
                                        ],
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: EaseInWidget(
                              onTap: () {
                                if (selectedtype != Constant.UserType_Pro)
                                  setState(() {
                                    selectedtype = Constant.UserType_Pro;
                                  });
                              },
                              child: Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: ColorsRes.editboxcolor, border: Border.all(width: 1, color: selectedtype == Constant.UserType_Pro ? ColorsRes.appcolor : ColorsRes.editboxcolor)),
                                  padding: EdgeInsets.only(top: 8, bottom: 8, left: 10, right: 5),
                                  child: Row(
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: 'https://smartkit.wrteam.in/smartkit/cryptotech/enable_pro.png',
                                        height: MediaQuery.of(context).size.width / 10,
                                        color: selectedtype == Constant.UserType_Pro ? ColorsRes.appcolor : ColorsRes.grey,
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(StringsRes.lblpro,
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context).textTheme.button.merge(TextStyle(
                                                  color: selectedtype == Constant.UserType_Pro ? ColorsRes.appcolor : ColorsRes.firstgradientcolor.withOpacity(0.7), decoration: TextDecoration.none, fontWeight: FontWeight.bold, fontFamily: 'MyFont'))),
                                          Text(StringsRes.lblexpert,
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption
                                                  .merge(TextStyle(color: selectedtype == Constant.UserType_Pro ? ColorsRes.txtlightcolor : ColorsRes.grey, decoration: TextDecoration.none, fontWeight: FontWeight.bold, fontFamily: 'MyFont'))),
                                        ],
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ]),
                        chktypeerr && selectedtype == ''
                            ? Text(
                                StringsRes.selecttype,
                                style: TextStyle(color: ColorsRes.grey),
                              )
                            : Container(),
                        chktypeerr && selectedtype == ''
                            ? Divider(
                                color: ColorsRes.red,
                                height: 1,
                              )
                            : Container(),
                        SizedBox(height: 50),
                        RichText(
                            text: TextSpan(style: new TextStyle(color: ColorsRes.txtlightcolor.withOpacity(0.5)), text: StringsRes.i_accept, children: <TextSpan>[
                          TextSpan(
                              text: StringsRes.terms_and_condition,
                              style: TextStyle(
                                color: ColorsRes.appcolor,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => TermsConditionActivity(StringsRes.terms_and_condition)));
                                }),
                          TextSpan(text: "\t${StringsRes.Lbl_AND}\t"),
                          TextSpan(
                              text: StringsRes.privacy_policy,
                              style: TextStyle(
                                color: ColorsRes.appcolor,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => TermsConditionActivity(StringsRes.privacy_policy)));
                                }),
                        ])),
                        SizedBox(height: 25),
                        EaseInWidget(
                            onTap: () async {
                              if (_formKey.currentState.validate()) {
                                try {
                                  UserCredential appUser =
                                      await authServices.authCreateUser(
                                      emailInput: edtemail.text,
                                      passwordInput: edtpassword.text,
                                      context: context);
                                  print("appUser --->$appUser");
                                  Toast.show("Register SuccessFully", context,
                                      backgroundColor: ColorsRes.black,
                                      textColor: ColorsRes.white,
                                      duration: 5);
                                  if (appUser != null) {
                                    Constant.GoToMainPage("login", context);
                                  }
                                } catch (e) {
                                  Toast.show(e.message.toString(), context,
                                      backgroundColor: ColorsRes.black,
                                      textColor: ColorsRes.white,
                                      duration: 5);
                                  print("error --->$e");
                                }
                              }
                            },
                            child: DesignConfig.EnDisButton(StringsRes.lblcontinue.toUpperCase(), txt1enable && txt2enable && selectedtype != '' ? ColorsRes.white : ColorsRes.grey, context)),
                      ],
                    ),
                    desktop: Container(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            StringsRes.enter_first_name,
                            style: Theme.of(context).textTheme.button.merge(TextStyle(color: ColorsRes.txtlightcolor, fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(height: 8),
                          Container(
                            decoration: DesignConfig.BoxDecorationContainer(ColorsRes.editboxcolor, 15),
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            child: TextFormField(
                              style: TextStyle(color: ColorsRes.appcolor),
                              cursorColor: ColorsRes.appcolor,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '${StringsRes.first_name}',
                                hintStyle: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.appcolor.withOpacity(0.5))),
                              ),
                              controller: edtemail,
                              keyboardType: TextInputType.text,
                              validator: (val) => val.trim().isEmpty ? "${StringsRes.enter_first_name}" : null,
                              onChanged: (String txt) {
                                if (txt.trim().isEmpty && txt1enable) {
                                  setState(() {
                                    txt1enable = false;
                                  });
                                } else if (!txt1enable) {
                                  setState(() {
                                    txt1enable = true;
                                  });
                                }
                              },
                            ),
                          ),
                          SizedBox(height: 30),
                          Text(
                            StringsRes.enter_last_name,
                            style: Theme.of(context).textTheme.button.merge(TextStyle(color: ColorsRes.txtlightcolor, fontWeight: FontWeight.bold)),
                          ),
                          Container(
                              decoration: DesignConfig.BoxDecorationContainer(ColorsRes.editboxcolor, 15),
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              child: TextFormField(
                                style: TextStyle(color: ColorsRes.appcolor),
                                cursorColor: ColorsRes.appcolor,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '${StringsRes.last_name}',
                                  hintStyle: Theme.of(context).textTheme.subtitle1.merge(TextStyle(fontWeight: FontWeight.bold, color: ColorsRes.appcolor.withOpacity(0.5))),
                                ),
                                controller: edtpassword,
                                keyboardType: TextInputType.text,
                                validator: (val) => val.trim().isEmpty ? "${StringsRes.enter_last_name}" : null,
                                onChanged: (String txt) {
                                  if (txt.trim().isEmpty && txt2enable) {
                                    setState(() {
                                      txt2enable = false;
                                    });
                                  } else if (!txt2enable) {
                                    setState(() {
                                      txt2enable = true;
                                    });
                                  }
                                },
                              )),
                          SizedBox(height: 30),
                          Row(children: [
                            Expanded(
                              child: EaseInWidget(
                                onTap: () {
                                  if (selectedtype != Constant.UserType_Amateur)
                                    setState(() {
                                      selectedtype = Constant.UserType_Amateur;
                                    });
                                },
                                child: Container(
                                    decoration:
                                        BoxDecoration(borderRadius: BorderRadius.circular(15), color: ColorsRes.editboxcolor, border: Border.all(width: 1, color: selectedtype == Constant.UserType_Amateur ? ColorsRes.appcolor : ColorsRes.editboxcolor)),
                                    padding: EdgeInsets.only(top: 8, bottom: 8, left: 10, right: 5),
                                    child: Row(
                                      children: [
                                        CachedNetworkImage(
                                          imageUrl: 'https://smartkit.wrteam.in/smartkit/cryptotech/enable_amateur.png',
                                          height: MediaQuery.of(context).size.width / 10,
                                          color: selectedtype == Constant.UserType_Amateur ? ColorsRes.appcolor : ColorsRes.grey,
                                        ),
                                        SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(StringsRes.lblamateur,
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context).textTheme.button.merge(TextStyle(
                                                    color: selectedtype == Constant.UserType_Amateur ? ColorsRes.appcolor : ColorsRes.firstgradientcolor.withOpacity(0.7),
                                                    decoration: TextDecoration.none,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'MyFont'))),
                                            Text(StringsRes.lblbeginner,
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption
                                                    .merge(TextStyle(color: selectedtype == Constant.UserType_Amateur ? ColorsRes.txtlightcolor : ColorsRes.grey, decoration: TextDecoration.none, fontWeight: FontWeight.bold, fontFamily: 'MyFont'))),
                                          ],
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: EaseInWidget(
                                onTap: () {
                                  if (selectedtype != Constant.UserType_Pro)
                                    setState(() {
                                      selectedtype = Constant.UserType_Pro;
                                    });
                                },
                                child: Container(
                                    decoration:
                                        BoxDecoration(borderRadius: BorderRadius.circular(15), color: ColorsRes.editboxcolor, border: Border.all(width: 1, color: selectedtype == Constant.UserType_Pro ? ColorsRes.appcolor : ColorsRes.editboxcolor)),
                                    padding: EdgeInsets.only(top: 8, bottom: 8, left: 10, right: 5),
                                    child: Row(
                                      children: [
                                        CachedNetworkImage(
                                          imageUrl: 'https://smartkit.wrteam.in/smartkit/cryptotech/enable_pro.png',
                                          height: MediaQuery.of(context).size.width / 10,
                                          color: selectedtype == Constant.UserType_Pro ? ColorsRes.appcolor : ColorsRes.grey,
                                        ),
                                        SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(StringsRes.lblpro,
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context).textTheme.button.merge(TextStyle(
                                                    color: selectedtype == Constant.UserType_Pro ? ColorsRes.appcolor : ColorsRes.firstgradientcolor.withOpacity(0.7), decoration: TextDecoration.none, fontWeight: FontWeight.bold, fontFamily: 'MyFont'))),
                                            Text(StringsRes.lblexpert,
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption
                                                    .merge(TextStyle(color: selectedtype == Constant.UserType_Pro ? ColorsRes.txtlightcolor : ColorsRes.grey, decoration: TextDecoration.none, fontWeight: FontWeight.bold, fontFamily: 'MyFont'))),
                                          ],
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                          ]),
                          chktypeerr && selectedtype == ''
                              ? Text(
                                  StringsRes.selecttype,
                                  style: TextStyle(color: ColorsRes.grey),
                                )
                              : Container(),
                          chktypeerr && selectedtype == ''
                              ? Divider(
                                  color: ColorsRes.red,
                                  height: 1,
                                )
                              : Container(),
                          SizedBox(height: 50),
                          RichText(
                              text: TextSpan(style: new TextStyle(color: ColorsRes.txtlightcolor.withOpacity(0.5)), text: StringsRes.i_accept, children: <TextSpan>[
                            TextSpan(
                                text: StringsRes.terms_and_condition,
                                style: TextStyle(
                                  color: ColorsRes.appcolor,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => TermsConditionActivity(StringsRes.terms_and_condition)));
                                  }),
                            TextSpan(text: "\t${StringsRes.Lbl_AND}\t"),
                            TextSpan(
                                text: StringsRes.privacy_policy,
                                style: TextStyle(
                                  color: ColorsRes.appcolor,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => TermsConditionActivity(StringsRes.privacy_policy)));
                                  }),
                          ])),
                          SizedBox(height: 25),
                          EaseInWidget(
                              onTap: () {
                                if (!chktypeerr)
                                  setState(() {
                                    chktypeerr = true;
                                  });

                                if (_formKey.currentState.validate() && selectedtype != '') {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Signup_Page2(edtemail.text, edtpassword.text, selectedtype)));
                                }
                              },
                              child: DesignConfig.EnDisButton(StringsRes.lblcontinue.toUpperCase(), txt1enable && txt2enable && selectedtype != '' ? ColorsRes.white : ColorsRes.grey, context)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IntrinsicHeight(
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CachedNetworkImage(imageUrl: 'https://smartkit.wrteam.in/smartkit/cryptotech/back_button.png'),
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
