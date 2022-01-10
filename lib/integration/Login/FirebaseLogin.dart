import 'dart:io';

import 'package:apple_sign_in/apple_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:smartkit/integration/Login/LoginWithEmailPassword.dart';
import 'package:smartkit/integration/helper/ColorsRes.dart';
import 'package:smartkit/integration/helper/Constant.dart';
import 'package:smartkit/integration/helper/DesignConfig.dart';

class FirebaseLogin extends StatefulWidget {
  @override
  _FirebaseLoginState createState() => _FirebaseLoginState();
}

class _FirebaseLoginState extends State<FirebaseLogin> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  FacebookLogin facebookSignIn = new FacebookLogin();
  String name;
  String imageUrl;
  User currentuser = null;
  bool isloading = false;
  final _phoneController = TextEditingController();
  final countrycode = TextEditingController();
  final _codeController = TextEditingController();
  bool isphoneexpand = false;

  @override
  void initState() {
    super.initState();
    currentuser = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        title: Text(
          "Login",
          style: TextStyle(color: ColorsRes.black),
        ),
        centerTitle: true,
      ),
      body: currentuser != null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(currentuser.email != null && currentuser.displayName != null
                      ? "Userid : ${currentuser.uid}\nEmail : ${currentuser.email}\nName : ${currentuser.displayName}"
                      : currentuser.phoneNumber != null
                          ? "Userid : ${currentuser.uid}\nPhoneNumber : ${currentuser.phoneNumber}"
                          : "Userid : ${currentuser.uid}"),
                ),
                GestureDetector(
                  onTap: () async {
                    _auth.signOut();
                    if (googleSignIn != null && await googleSignIn.isSignedIn()) await googleSignIn.signOut();
                    currentuser = null;
                    setState(() {});
                  },
                  child: Container(
                    color: ColorsRes.appcolor,
                    margin: EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "LOGOUT",
                      style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.white)),
                    ),
                  ),
                )
              ],
            )
          : Stack(
              children: [
                ListView(children: [
                  ListTile(
                    leading: Icon(Icons.keyboard_arrow_right),
                    title: Text("Login with Email-Password"),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginWithEmailPassword()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.keyboard_arrow_right),
                    title: Text("Google"),
                    onTap: () async {
                      setState(() {
                        isloading = true;
                      });
                      await signInWithGoogle();
                      setState(() {
                        isloading = false;
                      });
                    },
                  ),
                  // if (Platform.isIOS || Platform.isMacOS)
                  // ListTile(
                  //   leading: Icon(Icons.keyboard_arrow_right),
                  //   title: Text("Apple"),
                  //   onTap: () async {
                  //     setState(() {
                  //       isloading = true;
                  //     });
                  //     await signInWithApple();
                  //     setState(() {
                  //       isloading = false;
                  //     });
                  //   },
                  // ),
                  ListTile(
                    leading: Icon(Icons.keyboard_arrow_right),
                    title: Text("Facebook"),
                    onTap: () async {
                      setState(() {
                        isloading = true;
                      });
                      await signInWithFB();
                      setState(() {
                        isloading = false;
                      });
                    },
                  ),
                  ExpansionTile(
                    trailing: SizedBox.shrink(),
                    leading: Icon(
                      isphoneexpand ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_right,
                      color: ColorsRes.grey,
                    ),
                    onExpansionChanged: (value) {
                      setState(() {
                        isphoneexpand = value;
                      });
                    },
                    title: new Text(
                      "Phone",
                    ),
                    children: <Widget>[
                      phoneWidget(),
                    ],
                  )
                ]),
                if (isloading)
                  Container(
                    alignment: Alignment.center,
                    color: ColorsRes.white.withOpacity(0.5),
                    child: new CircularProgressIndicator(),
                  ),
              ],
            ),
    );
  }

  Future<String> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    if (googleSignIn != null) {
      googleSignIn.disconnect();
      googleSignIn.signOut();
    }

    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential userCredential = await _auth.signInWithCredential(credential);
    final User user = userCredential.user;

    if (user != null) {
      assert(user.uid != null);
      setState(() {
        currentuser = user;
      });
    } else {}

    return null;
  }

  Future<String> signInWithApple() async {
    try {
      final AuthorizationResult appleResult = await AppleSignIn.performRequests([
        AppleIdRequest(requestedScopes: [Scope.email, Scope.fullName])
      ]);

      User user;
      if (appleResult.status == AuthorizationStatus.authorized) {
        final appleIdCredential = appleResult.credential;
        final oAuthProvider = OAuthProvider('apple.com');
        final credential = oAuthProvider.credential(
          idToken: String.fromCharCodes(appleIdCredential.identityToken),
          accessToken: String.fromCharCodes(appleIdCredential.authorizationCode),
        );
        final authResult = await _auth.signInWithCredential(credential);
        user = authResult.user;
      } else if (appleResult.status == AuthorizationStatus.error) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(appleResult.error.toString())));
      } else if (appleResult.status == AuthorizationStatus.cancelled) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sign in aborted by user')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sign in failed')));
      }
      if (user != null) {
        assert(user.uid != null);
        setState(() {
          currentuser = user;
        });
      }
    } catch (error) {
      print(error);
    }

    return null;
  }

  Future<String> signInWithFB() async {
    FacebookLogin _login = FacebookLogin();
    if (await _login.isLoggedIn) _login.logOut();

    final FacebookLoginResult result = await facebookSignIn.logIn(['email', 'public_profile']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;

        AuthCredential authCredential = FacebookAuthProvider.credential(accessToken.token);
        User mainuser = (await _auth.signInWithCredential(authCredential)).user;

        if (mainuser != null) {
          assert(mainuser.uid != null);
          setState(() {
            currentuser = mainuser;
          });
        }

        break;
      case FacebookLoginStatus.cancelledByUser:
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login cancelled by the user.")));
        break;
      case FacebookLoginStatus.error:
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result.errorMessage)));
        break;
    }
    return null;
  }

  Widget phoneWidget() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: TextFormField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8)), borderSide: BorderSide(color: Colors.grey[200])),
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8)), borderSide: BorderSide(color: Colors.grey[300])),
                          filled: true,
                          fillColor: ColorsRes.appcolor.withOpacity(0.1),
                          hintText: "+91"),
                      controller: countrycode,
                    )),
                SizedBox(width: 8),
                Expanded(
                    flex: 4,
                    child: TextFormField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8)), borderSide: BorderSide(color: Colors.grey[200])),
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8)), borderSide: BorderSide(color: Colors.grey[300])),
                          filled: true,
                          fillColor: ColorsRes.appcolor.withOpacity(0.1),
                          hintText: "Enter Mobile Number"),
                      controller: _phoneController,
                    )),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: DesignConfig.boxDecorationContainerColor(ColorsRes.appcolor, 10),
              child: TextButton(
                child: Text(
                  "LOGIN",
                  style: TextStyle(color: ColorsRes.white, fontWeight: FontWeight.bold),
                ),
                onPressed: () async {
                  String phone = _phoneController.text.trim();

                  if (countrycode.text.trim().isEmpty || !countrycode.text.contains("+")) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Enter Valid Country Code with \' + \'')));
                  } else if (Constant.validateMobile(phone) != null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Enter Valid Mobile Number')));
                  } else {
                    setState(() {
                      isloading = true;
                    });
                    await phoneLoginUser();
                    setState(() {
                      isloading = false;
                    });
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<bool> phoneLoginUser() async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
        phoneNumber: "${countrycode.text}${_phoneController.text}",
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async {
          Navigator.of(context).pop();

          UserCredential result = await _auth.signInWithCredential(credential);

          User user = result.user;

          if (user != null) {
            setState(() {
              currentuser = user;
            });
          } else {
            print("Error");
          }
        },
        verificationFailed: (FirebaseAuthException exception) {
          print(exception);

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(exception.message)));
        },
        codeSent: (String verificationId, [int forceResendingToken]) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Enter the code"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        controller: _codeController,
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: Text(
                        "Confirm",
                        style: TextStyle(color: ColorsRes.appcolor),
                      ),
                      onPressed: () async {
                        if (_codeController.text.trim().isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Enter Code')));
                        } else {
                          final code = _codeController.text.trim();
                          AuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: code);

                          UserCredential result = await _auth.signInWithCredential(credential);

                          User user = result.user;

                          if (user != null) {
                            print("--user--${user.phoneNumber}");
                            setState(() {
                              currentuser = user;
                            });
                            Navigator.of(context).pop();
                          } else {
                            print("Error");
                          }
                        }
                      },
                    )
                  ],
                );
              });
        },
        codeAutoRetrievalTimeout: null);
  }
}
