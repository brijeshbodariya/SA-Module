import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:smartkit/FullApp/NewsApp/mobile/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/NewsApp/mobile/helper/Constant.dart';
import 'package:smartkit/FullApp/NewsApp/mobile/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/NewsApp/mobile/helper/StringsRes.dart';
import 'package:smartkit/services/auth_model.dart';
import 'package:smartkit/services/auth_service.dart';
import 'package:toast/toast.dart';

import '../CategoryActivityMobile.dart';

class SignupPageMobile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignupPageStateMobile();
  }
}

class SignupPageStateMobile extends State<SignupPageMobile> {
  bool acceptterms = false;
  bool isloading = false;
  AuthServices authServices = AuthServices();
  AuthModel authModel = AuthModel();
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController edtemail = TextEditingController();
  TextEditingController edtpsw = TextEditingController();
  TextEditingController edtusername = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String gender = StringsRes.lblfemale;

  @override
  void initState() {
    super.initState();
  }

  setSnackbar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(content: new Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      /* Container(
          decoration: BoxDecoration(
              image: DecorationImage(
        image: AssetImage('assets/newsapp//loginbg.png'),
        fit: BoxFit.fill,
      ))), */
      CachedNetworkImage(
        imageUrl: "https://smartkit.wrteam.in/smartkit/newsapp/login.png",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      Scaffold(
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
                          text: "Welcome to",
                          children: <TextSpan>[
                            TextSpan(text: "\News,", style: TextStyle(color: ColorsRes.yellow, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Text(
                        StringsRes.signupscreenlabel,
                        style: TextStyle(color: ColorsRes.white),
                      ),
                      SizedBox(height: 30),
                      Text(StringsRes.labelsignup,
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
                              Icons.person,
                              color: ColorsRes.white,
                            ),
                            hintText: StringsRes.username,
                            hintStyle: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: ColorsRes.white)),
                            border: InputBorder.none,
                          ),
                          validator: (val) => val.trim().isEmpty ? 'Enter Username' : null,
                          controller: edtusername,
                        ),
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
                      Row(children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              gender = StringsRes.lblmale;
                            });
                          },
                          child: Row(children: [
                            CircleAvatar(
                              backgroundColor: gender == StringsRes.lblmale ? ColorsRes.appcolor : Colors.transparent,
                              child: CachedNetworkImage(
                                imageUrl: "assets/newsapp/male.png",
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              StringsRes.lblmale,
                              style: TextStyle(
                                color: gender == StringsRes.lblmale ? ColorsRes.white : ColorsRes.white.withOpacity(0.5),
                              ),
                            )
                          ]),
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              gender = StringsRes.lblfemale;
                            });
                          },
                          child: Row(children: [
                            CircleAvatar(
                              backgroundColor: gender == StringsRes.lblfemale ? ColorsRes.appcolor : Colors.transparent,
                              child: CachedNetworkImage(
                                imageUrl: "assets/newsapp/female.png",
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              StringsRes.lblfemale,
                              style: TextStyle(
                                color: gender == StringsRes.lblfemale ? ColorsRes.white : ColorsRes.white.withOpacity(0.5),
                              ),
                            )
                          ]),
                        ),
                      ]),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: GestureDetector(
                          onTap: () {},
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignupPageMobile()));
                            },
                            child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(style: Theme.of(context).textTheme.button.merge(TextStyle(color: ColorsRes.white, fontWeight: FontWeight.bold, letterSpacing: 0.5)), text: StringsRes.termsconfirm, children: <TextSpan>[
                                  TextSpan(text: StringsRes.termsncondition, style: Theme.of(context).textTheme.button.merge(TextStyle(decoration: TextDecoration.underline, color: ColorsRes.yellow, fontWeight: FontWeight.bold, letterSpacing: 0.5))),
                                ])),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (_formKey.currentState.validate()) {
                            try {
                              UserCredential appUser =
                                  await authServices.authCreateUser(
                                  emailInput: edtemail.text,
                                  passwordInput: edtpsw.text,
                                  context: context);
                              print("appUser --->$appUser");
                              if (appUser != null) {
                                Toast.show("Register SuccessFully", context,
                                    backgroundColor: ColorsRes.black,
                                    textColor: ColorsRes.white,
                                    duration: 5);
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CategoryActivityMobile()));
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
                        child: Container(
                          width: double.maxFinite,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.symmetric(vertical: 18),
                          child: Text(
                            StringsRes.labelsignup,
                            style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.appcolor, fontWeight: FontWeight.bold)),
                          ),
                          decoration: DesignConfig.boxDecorationContainerColor(ColorsRes.white, 15),
                        ),
                      ),
                      if (isloading)
                        Center(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new CircularProgressIndicator(),
                        )),
                    ]),
                  ),
                ),
              ),
            ),
            bottomWidget(),
          ],
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
          onTap: () {
            try {
              EasyLoading.show(
                  indicator: CircularProgressIndicator(
                  ));
              authModel.newsAppFacebookLogin(context);
              EasyLoading.dismiss();
            } catch (e) {
              Toast.show(e.toString(), context,
                  duration: 10);
            }
          },
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
          onTap: () async {
            await authServices.signWithGoogle(
                context);
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => CategoryActivityMobile()));
            Toast.show("LogIn SuccessFully", context,
                backgroundColor: ColorsRes.black,
                textColor: ColorsRes.white,
                duration: 5);
          },
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
    ]);
  }
}
