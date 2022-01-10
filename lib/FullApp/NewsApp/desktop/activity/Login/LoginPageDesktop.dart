import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/NewsApp/desktop/activity/Login/SignupPageDesktop.dart';
import 'package:smartkit/FullApp/NewsApp/desktop/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/NewsApp/desktop/helper/Constant.dart';
import 'package:smartkit/FullApp/NewsApp/desktop/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/NewsApp/desktop/helper/StringsRes.dart';

import '../CategoryActivityDesktop.dart';

class LoginPageDesktop extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageStateDesktop();
  }
}

class LoginPageStateDesktop extends State<LoginPageDesktop> {
  bool acceptterms = false;
  bool isloading = false;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController edtemail = TextEditingController(text: "wrteam@gmail.com");
  TextEditingController edtpsw = TextEditingController(text: "12345678");
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  setSnackbar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(content: new Text(msg)));
    // _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CachedNetworkImage(
        imageUrl: "https://smartkit.wrteam.in/smartkit/newsapp/login.png",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      Center(
        child: SizedBox(
          height: 800,
          width: 700,
          child: Scaffold(
            key: _scaffoldKey,
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(left: 20, right: 20, top: kToolbarHeight),
                      child: Form(
                        key: _formKey,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [
                          RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                              style: Theme.of(context).textTheme.headline5.merge(TextStyle(color: ColorsRes.yellow)),
                              text: "Welcome",
                              children: <TextSpan>[
                                TextSpan(text: " Back,", style: TextStyle(color: ColorsRes.yellow, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          Text(
                            StringsRes.loginsigninlabel,
                            style: TextStyle(color: ColorsRes.white),
                          ),
                          SizedBox(height: 30),
                          Text(StringsRes.labellogin,
                              style: Theme.of(context).textTheme.headline5.merge(
                                    TextStyle(color: ColorsRes.white, fontWeight: FontWeight.bold),
                                  )),
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            color: ColorsRes.yellow,
                            height: 2,
                          ),
                          Container(
                            decoration: DesignConfig.boxDecorationContainerBorder(ColorsRes.white, 10),
                            margin: EdgeInsets.only(top: 20),
                            padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                            child: TextFormField(
                              style: TextStyle(color: ColorsRes.white),
                              cursorColor: ColorsRes.black,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: ColorsRes.white,
                                ),
                                hintText: StringsRes.emailaddress,
                                hintStyle: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: ColorsRes.white)),
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: (val) => Constant.validateEmail(val),
                              controller: edtemail,
                            ),
                          ),
                          Container(
                            decoration: DesignConfig.boxDecorationContainerBorder(ColorsRes.white, 10),
                            margin: EdgeInsets.only(top: 20, bottom: 15),
                            padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                            child: TextFormField(
                              style: TextStyle(color: ColorsRes.white),
                              cursorColor: ColorsRes.black,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: ColorsRes.white,
                                ),
                                hintText: StringsRes.password,
                                hintStyle: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: ColorsRes.white)),
                                border: InputBorder.none,
                              ),
                              obscureText: true,
                              validator: (val) => val.trim().isEmpty ? 'Enter Password' : null,
                              controller: edtpsw,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {},
                              child: Text(
                                StringsRes.forgotpsw,
                                textAlign: TextAlign.end,
                                style: TextStyle(color: ColorsRes.white),
                              ),
                            ),
                          ),
                          if (isloading)
                            Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new CircularProgressIndicator(),
                            )),
                          GestureDetector(
                            onTap: () {
                              if (_formKey.currentState.validate()) {
                                Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => CategoryActivityDesktop()));
                              }
                            },
                            child: Container(
                              width: double.maxFinite,
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: 40),
                              padding: EdgeInsets.symmetric(vertical: 18),
                              child: Text(
                                StringsRes.labellogin,
                                style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.appcolor, fontWeight: FontWeight.bold)),
                              ),
                              decoration: DesignConfig.boxDecorationContainerColor(ColorsRes.white, 15),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                ),
                bottomWidget(),
              ],
            ),
          ),
        ),
      ),
    ]);
  }

  Widget bottomWidget() {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Row(children: [
        Expanded(
            child: Divider(
          color: ColorsRes.white,
          endIndent: 10,
        )),
        Text(
          "Or",
          style: TextStyle(color: ColorsRes.white),
        ),
        Expanded(
            child: Divider(
          color: ColorsRes.white,
          indent: 10,
        )),
      ]),
      Text(
        StringsRes.signinwith,
        style: TextStyle(color: ColorsRes.white),
      ),
      Row(children: [
        Expanded(
            child: GestureDetector(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            padding: EdgeInsets.symmetric(vertical: 18),
            decoration: DesignConfig.boxDecorationContainerColor(ColorsRes.fbcolor, 15),
            child: Text(
              StringsRes.facebook,
              style: TextStyle(color: ColorsRes.white, fontWeight: FontWeight.bold),
            ),
          ),
        )),
        Expanded(
            child: GestureDetector(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            padding: EdgeInsets.symmetric(vertical: 18),
            decoration: DesignConfig.boxDecorationContainerColor(ColorsRes.googlecolor, 15),
            child: Text(
              StringsRes.google,
              style: TextStyle(color: ColorsRes.white, fontWeight: FontWeight.bold),
            ),
          ),
        )),
      ]),
      GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignupPageDesktop()));
        },
        child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(style: Theme.of(context).textTheme.button.merge(TextStyle(color: ColorsRes.white)), text: StringsRes.donthaveac, children: <TextSpan>[
              TextSpan(
                  text: StringsRes.signup,
                  style: Theme.of(context).textTheme.button.merge(TextStyle(
                        decoration: TextDecoration.underline,
                        color: ColorsRes.white,
                      ))),
            ])),
      ),
      SizedBox(height: 10),
    ]);
  }
}
