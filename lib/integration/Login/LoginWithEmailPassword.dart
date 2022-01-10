import 'dart:io';

import 'package:apple_sign_in/apple_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:smartkit/SmartkitScreen/Widget/WrGlassmorphism.dart';
import '../helper/ColorsRes.dart';
import '../helper/Constant.dart';
import '../helper/DesignConfig.dart';

class LoginWithEmailPassword extends StatefulWidget {
  @override
  _LoginWithEmailPasswordState createState() => _LoginWithEmailPasswordState();
}

class _LoginWithEmailPasswordState extends State<LoginWithEmailPassword> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController edtemail = TextEditingController();
  TextEditingController edtpsw = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool _obscureText = true;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  User curruser;

  // GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  // final FirebaseAuth _auth = FirebaseAuth.instance;
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
    curruser = null;
    currentuser = null;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(backgroundColor: ColorsRes.appcolor,
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        appBar: currentuser != null
            ? AppBar(
                title: Text("Login", style: TextStyle(color: ColorsRes.black)),
                // centerTitle: true,
                // backgroundColor: Colors.transparent,
              )
            : null,
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
            : Center(
              child: SizedBox(width: 650,height:550,
                child: SingleChildScrollView(
                  child: Stack(
                      children: [
                        Container(
                          height: height,
                          width: width,
                          /*child: SvgPicture.network(
                            "https://smartkit.wrteam.in/smartkit/images/bg1.svg",
                            height: height,
                            width: width,
                            fit: BoxFit.cover,
                          ),*/
                        ),
                        // Positioned(
                        //   top: 40.0,
                        //   left: 15.0,
                        //   child: Text(
                        //     "Login With \nEmail-Password",
                        //     style: TextStyle(color: Colors.white, fontSize: width / 16, fontWeight: FontWeight.w700),
                        //   ),
                        // ),
                        Center(
                          child: SingleChildScrollView(
                            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                            child: curruser != null
                                ? Column(
                                    children: [
                                      Text("Userid : ${curruser.uid}\nEmail : ${curruser.email}"),
                                      GestureDetector(
                                        onTap: () {
                                          _auth.signOut();
                                          curruser = null;
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
                                : formDataItems(),
                          ),
                        ),
                      ],
                    ),
                ),
              ),
            ),
      ),
    );
  }

  Widget formDataItems() {
    return Center(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "Login With \nEmail-Password",
                style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(color: ColorsRes.black),
                cursorColor: ColorsRes.black,
                decoration: InputDecoration(
                  isDense: true,
                  hintStyle: TextStyle(color: ColorsRes.white),
                  hintText: "Email Address",
                  hoverColor: ColorsRes.grey,
                  labelStyle: TextStyle(color: ColorsRes.black),
                  labelText: edtemail.text.trim().length == 0 ? null : "Email Address",
                  suffixIcon: Icon(
                    Icons.email,
                    color: ColorsRes.white,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: ColorsRes.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: ColorsRes.white),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: ColorsRes.white),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (val) => Constant.validateEmail(val),
                controller: edtemail,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: _obscureText,
                controller: edtpsw,
                validator: (val) => val.isEmpty ? 'Enter Password' : null,
                style: TextStyle(color: ColorsRes.black),
                cursorColor: ColorsRes.black,
                decoration: InputDecoration(
                  isDense: true,
                  hintStyle: TextStyle(color: ColorsRes.white),
                  hintText: "Password",
                  labelStyle: TextStyle(color: ColorsRes.black),
                  labelText: edtpsw.text.trim().length == 0 ? null : "Password",
                  hoverColor: ColorsRes.appcolor,
                  fillColor: ColorsRes.white,
                  focusColor: ColorsRes.white,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: ColorsRes.white,
                      size: 25,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: ColorsRes.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: ColorsRes.white),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: ColorsRes.white),
                  ),
                ),
              ),
              isLoading
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new CircularProgressIndicator(),
                      ),
                    )
                  : Container(),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  showDialog<String>(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return PasswordResetAlertDialog(
                        title: "Forgot Password",
                        auth: _auth,
                      );
                    },
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 2),
                  padding: const EdgeInsets.all(5),
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot Password ?",
                    style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.white)),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                      child: GestureDetector(
                    onTap: () async {
                      if (_formKey.currentState.validate() && !isLoading) {
                        bool checkinternet = await Constant.CheckInternet();
                        if (!checkinternet) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Check Internet Connection")));
                        } else {
                          setState(() {
                            isLoading = true;
                          });
                          User user = await signIn();
                          if (user != null) {
                            edtemail.clear();
                            edtpsw.clear();
                            curruser = user;
                            setState(() {});
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Successfull")));
                          }
                          setState(() {
                            isLoading = false;
                          });
                        }
                      }
                    },
                    child: WrGlassMorphism(
                      borderRadius: 30,
                      child: Container(
                        // decoration: DesignConfig.boxDecorationContainerColor(ColorsRes.appcolor, 30),
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        alignment: Alignment.center,
                        child: Text(
                          "Login",
                          style: TextStyle(color: ColorsRes.white),
                        ),
                      ),
                    ),
                  )),
                  SizedBox(width: 15),
                  Expanded(
                    child: GestureDetector(
                        onTap: () async {
                          if (_formKey.currentState.validate() && !isLoading) {
                            bool checkinternet = await Constant.CheckInternet();
                            if (!checkinternet) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Check Internet Connection")));
                            } else {
                              setState(() {
                                isLoading = true;
                              });
                              User user = await signUp();
                              if (user != null) {
                                edtemail.clear();
                                edtpsw.clear();
                                curruser = user;
                                setState(() {});
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("SignupSuccessfull")));
                              }

                              setState(() {
                                isLoading = false;
                              });
                            }
                          }
                        },
                        child: WrGlassMorphism(
                          borderRadius: 30,
                          child: Container(
                            // decoration: DesignConfig.boxDecorationContainerColor(ColorsRes.appcolor, 30),
                            padding: const EdgeInsets.only(top: 15, bottom: 15),
                            alignment: Alignment.center,
                            child: Text(
                              "Signup",
                              style: TextStyle(color: ColorsRes.white),
                            ),
                          ),
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 35,
              ),
              Row(children: [
                Expanded(
                    child: Divider(
                      color: ColorsRes.white,
                      indent: 15,
                      endIndent: 15,
                    )),
                Text(
                  "Login With",
                  style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.white)),
                ),
                Expanded(
                    child: Divider(
                      color: ColorsRes.white,
                      indent: 15,
                      endIndent: 15,
                    )),
              ]),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: 0.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /*Expanded(
                      child: Center(
                        child: */GestureDetector(
                      onTap: () async {
                        setState(() {
                          isloading = true;
                        });
                        await signInWithFB();
                        setState(() {
                          isloading = false;
                        });
                      },
                          child: WrGlassMorphism(
                            borderRadius: 30.0,
                            child: Container(width:70,
                                padding: const EdgeInsets.all(15),
                                //width: MediaQuery.of(context).size.width / 1.5,
                                //height: MediaQuery.of(context).size.width / 7,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    /*SizedBox(
                                      width: 10.0,
                                    ),*/
                                    Icon(
                                      FontAwesomeIcons.facebookF,
                                      color: Colors.white70,
                                    ),
                                    /*SizedBox(
                                      width: 10.0,
                                    ),*/
                                    /*Text(
                                      "FaceBook",
                                      style: TextStyle(color: Colors.white),
                                    )*/
                                  ],
                                )),
                          ),
                        ),
                      //),
                    //),
                    SizedBox(
                      width: 10.0,
                    ),
                   /* Expanded(
                      child: */GestureDetector(
                        onTap: () async {
                          setState(() {
                            isloading = true;
                          });
                          await signInWithGoogle();
                          setState(() {
                            isloading = false;
                          });
                        },
                        child: WrGlassMorphism(
                          borderRadius: 30.0,
                          child: Container(width:70,
                              padding: const EdgeInsets.all(15),
                              //width: MediaQuery.of(context).size.width / 1.5,
                              //height: MediaQuery.of(context).size.width / 7,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  /*SizedBox(
                                    width: 15.0,
                                  ),*/
                                  Icon(
                                    FontAwesomeIcons.googlePlusG,
                                    color: Colors.white70,
                                  ),
                                  /*SizedBox(
                                    width: 10.0,
                                  ),*/
                                  /*Text(
                                    "Google",
                                    style: TextStyle(fontSize: 15,color: Colors.white),
                                  )*/
                                ],
                              )),
                        ),
                      ),
                    //),
                    SizedBox(
                      width: 10.0,
                    ),
                    ScreenTypeLayout(
                      mobile: /*Expanded(child:*/phoneBtn()/*)*/,
                      desktop: Container(),
                      tablet: Container(),
                    ),

                    // if (Platform.isIOS || Platform.isMacOS)
                    //   GestureDetector(
                    //     onTap: () async {
                    //       setState(() {
                    //         isloading = true;
                    //       });
                    //       await signInWithApple();
                    //       setState(() {
                    //         isloading = false;
                    //       });
                    //     },
                    //     child: WrGlassMorphism(
                    //       borderRadius: 30.0,
                    //       child: Container(
                    //           width: MediaQuery.of(context).size.width / 1.5,
                    //           height: MediaQuery.of(context).size.width / 7,
                    //           child: Row(
                    //             mainAxisAlignment: MainAxisAlignment.start,
                    //             children: [
                    //               SizedBox(
                    //                 width: 15.0,
                    //               ),
                    //               Icon(
                    //                 FontAwesomeIcons.phoneAlt,
                    //                 color: Colors.white70,
                    //               ),
                    //               SizedBox(
                    //                 width: 10.0,
                    //               ),
                    //               Text(
                    //                 "Login With Apple",
                    //                 style: TextStyle(fontSize: 16, color: Colors.white),
                    //               )
                    //             ],
                    //           )),
                    //     ),
                    //   ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget phoneBtn(){
    return  GestureDetector(
        onTap: () async {
          showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
              // backgroundColor: Colors.black,
              isScrollControlled: true,
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: phoneWidget(),
                );
              });
        },
        child: WrGlassMorphism(
          borderRadius: 30.0,
          child: Container(width:70,
              padding: const EdgeInsets.all(15),
              //width: MediaQuery.of(context).size.width / 1.5,
              //height: MediaQuery.of(context).size.width / 7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /*SizedBox(
                                    width: 15.0,
                                  ),*/
                  Icon(
                    FontAwesomeIcons.phoneAlt,
                    color: Colors.white70,
                  ),
                  /*SizedBox(
                    width: 10.0,
                  ),*/
                  /*Text(
                    "Phone",
                    style: TextStyle(color: Colors.white),
                  )*/
                ],
              )),
        ),
      );
  }

  Widget phoneWidget() {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      // height: 200.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: TextFormField(
                      enableInteractiveSelection: false,
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
                      enableInteractiveSelection: false,
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
              height: 10,
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
                  Navigator.of(context).pop();
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

  Future<User> signUp() async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: edtemail.text, password: edtpsw.text);
      assert(userCredential != null);
      assert(await userCredential.user.getIdToken() != null);

      return userCredential.user;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      return null;
    }
  }

  Future<User> signIn() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: edtemail.text, password: edtpsw.text);
      assert(userCredential != null);
      assert(userCredential != null);
      assert(await userCredential.user.getIdToken() != null);

      return userCredential.user;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      return null;
    }
  }
}

class PasswordResetAlertDialog extends StatefulWidget {
  final String title;
  final FirebaseAuth auth;

  const PasswordResetAlertDialog({Key key, this.title, this.auth}) : super(key: key);

  @override
  PasswordResetAlertDialogState createState() {
    return new PasswordResetAlertDialogState();
  }
}

class PasswordResetAlertDialogState extends State<PasswordResetAlertDialog> {
  final _resetKey = GlobalKey<FormState>();
  final _resetEmailController = TextEditingController();
  String _resetEmail;
  bool _resetValidate = false;

  bool _sendResetEmail() {
    _resetEmail = _resetEmailController.text;

    if (_resetKey.currentState.validate()) {
      _resetKey.currentState.save();

      try {
        widget.auth.sendPasswordResetEmail(email: _resetEmail);
        return true;
      } catch (exception) {
        print(exception);
      }
    } else {
      setState(() {
        _resetValidate = true;
      });
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        title: new Text(
          widget.title,
          style: TextStyle(color: ColorsRes.appcolor),
        ),
        content: new SingleChildScrollView(
          child: Form(
            key: _resetKey,
            child: ListBody(
              children: <Widget>[
                new Text(
                  'Enter the Email Address associated with your account.',
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                Row(
                  children: <Widget>[
                    new Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Icon(
                        Icons.email,
                        size: 20.0,
                        color: ColorsRes.appcolor,
                      ),
                    ),
                    new Expanded(
                      child: TextFormField(
                        validator: (val) => Constant.validateEmail(val),
                        onSaved: (String val) {
                          _resetEmail = val;
                        },
                        controller: _resetEmailController,
                        keyboardType: TextInputType.emailAddress,
                        autofocus: true,
                        cursorColor: ColorsRes.appcolor,
                        decoration: new InputDecoration(border: InputBorder.none, hintText: 'Email', contentPadding: EdgeInsets.only(left: 20.0, top: 15.0), hintStyle: TextStyle(color: Colors.black, fontSize: 14.0)),
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),
                new Column(children: <Widget>[
                  Container(
                    decoration: new BoxDecoration(border: new Border(bottom: new BorderSide(width: 0.5, color: ColorsRes.appcolor))),
                  )
                ]),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          new ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: ColorsRes.appcolor,
            ),
            child: new Text(
              'CANCEL',
              style: TextStyle(color: ColorsRes.white),
            ),
            onPressed: () {
              Navigator.of(context).pop("");
            },
          ),
          new ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: ColorsRes.appcolor,
            ),
            child: new Text(
              'SEND EMAIL',
              style: TextStyle(color: ColorsRes.white),
            ),
            onPressed: () {
              if (_sendResetEmail()) {
                ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                    content: new Text(
                      "We Sent Reset-Password link to your Verified account",
                      style: TextStyle(color: ColorsRes.white),
                    ),
                    backgroundColor: ColorsRes.appcolor));
                Navigator.of(context).pop(_resetEmail);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                  content: new Text(
                    "Something Went Wrong",
                    style: TextStyle(color: ColorsRes.white),
                  ),
                  backgroundColor: ColorsRes.appcolor,
                ));
              }
            },
          ),
        ],
      ),
    );
  }
}
