import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:toast/toast.dart';
import 'package:smartkit/FullApp/eStudy/helper/ColorsRes.dart';

class AuthServices {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  authCreateUser(
      {String emailInput,
      String passwordInput,
      String nameInput,
      BuildContext context}) async {
    UserCredential result = await firebaseAuth.createUserWithEmailAndPassword(
        email: emailInput, password: passwordInput);
    return result;
  }

  authSignInUser(
      {String emailInput, String passwordInput, BuildContext context}) async {
    await firebaseAuth.signInWithEmailAndPassword(
        email: emailInput, password: passwordInput);
  }

  signWithGoogle(context) async {
    await googleSignIn.signOut();
    try {
      EasyLoading.show(
          indicator: CircularProgressIndicator(
        backgroundColor: ColorsRes.black,
        valueColor: AlwaysStoppedAnimation<Color>(ColorsRes.white),
      ));

      GoogleSignInAccount googleUser = await googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      User firebaseUser =
          (await FirebaseAuth.instance.signInWithCredential(credential)).user;
      EasyLoading.dismiss();
      print("firebseuser-->${firebaseUser}");
      return firebaseUser;
    } catch (e) {
      EasyLoading.dismiss();
      Toast.show(e.message.toString(), context,
          backgroundColor: ColorsRes.black,
          textColor: ColorsRes.white,
          duration: 5);
      return null;
    }
  }

  Future<UserCredential> signInWithFacebook() async {
    await FacebookAuth.instance.logOut();
    final LoginResult result = await FacebookAuth.instance.login();
    if(result.status == LoginStatus.success){
      final OAuthCredential credential = FacebookAuthProvider.credential(result.accessToken.token);
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }
    return null;
  }

  authSignOutUser(context) async {
    try {
      EasyLoading.show(
          indicator: CircularProgressIndicator(
        backgroundColor: ColorsRes.black,
        valueColor: AlwaysStoppedAnimation<Color>(ColorsRes.white),
      ));
      FirebaseAuth.instance.signOut();
      await FacebookAuth.instance.logOut();
      await googleSignIn.signOut();
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.dismiss();
      Toast.show("Log Out SuccessFully", context,
          backgroundColor: ColorsRes.black,
          textColor: ColorsRes.white,
          duration: 5);
    }
  }
}
