import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/activity/MainHomePageMobile.dart';
import 'package:smartkit/FullApp/NewsApp/mobile/activity/CategoryActivityMobile.dart';
import 'package:smartkit/FullApp/SmartKey/mobile/SmartKeyScreens/SmartKeyHomeMobile.dart';
import 'package:smartkit/services/auth_service.dart';
import 'package:toast/toast.dart';

class AuthModel {
  AuthServices authServices = AuthServices();

  Future<void> foodMasterFacebookLogin(context) async {
    try {
      UserCredential userCredential = await authServices.signInWithFacebook();
      if (userCredential != null) {
        print('FB Account Details --> ${userCredential.user.email}');
        Navigator.of(context).pushAndRemoveUntil(
            CupertinoPageRoute(
                builder: (context) => MainHomePageMobile(
                  from: "pagefrom",
                )),
                (Route<dynamic> route) => false);
        Toast.show("Sign In SuccessFully", context,
            duration: 7);
      } else {
        print('else-->');
      }
    }
    catch (e) {
      print('catch-->${e.toString()}');
      print(e);
    }
  }

  Future<void> newsAppFacebookLogin(context) async {
    try {
      UserCredential userCredential = await authServices.signInWithFacebook();
      if (userCredential != null) {
        print('FB Account Details --> ${userCredential.user.email}');
        Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => CategoryActivityMobile()));
        Toast.show("Sign In SuccessFully", context,
            duration: 7);
      } else {
        print('else-->');
      }
    }
    catch (e) {
      print('catch-->${e.toString()}');
      print(e);
    }
  }

  Future<void> smartKeyFacebookLogin(context) async {
    try {
      UserCredential userCredential = await authServices.signInWithFacebook();
      if (userCredential != null) {
        print('FB Account Details --> ${userCredential.user.email}');
        Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => SmartKeyHomeMobile()));
        Toast.show("Sign In SuccessFully", context,
            duration: 7);
      } else {
        print('else-->');
      }
    }
    catch (e) {
      print('catch-->${e.toString()}');
      print(e);
    }
  }
}