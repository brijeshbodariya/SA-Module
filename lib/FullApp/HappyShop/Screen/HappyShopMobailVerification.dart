import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit/FullApp/FoodMaster/desktop/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/HappyShop/Helper/HappyShopColor.dart';
import 'package:smartkit/FullApp/HappyShop/Helper/HappyShopString.dart';
import 'package:smartkit/FullApp/HappyShop/widget/HappyShopbtn.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:toast/toast.dart';

import 'HappyShopHome.dart';

class HappyShopMobailVerification extends StatefulWidget {
  String mobileNumber;
  HappyShopMobailVerification({Key key,this.mobileNumber}) : super(key: key);

  @override
  _HappyShopMobailVerificationState createState() => _HappyShopMobailVerificationState();
}

class _HappyShopMobailVerificationState extends State<HappyShopMobailVerification> with TickerProviderStateMixin {
  final dataKey = new GlobalKey();
  String password, mobile, username, email, id, city, area, pincode, address, mobileno, countrycode, name, latitude, longitude, dob;
  String otp;
  bool isCodeSent = false;
  String signature = "";
  String _verificationCode;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Animation buttonSqueezeanimation;
  AnimationController buttonController;

  @override
  void initState() {
    super.initState();
    _verifyPhone();
    getSingature();
    buttonController = new AnimationController(duration: new Duration(milliseconds: 2000), vsync: this);

    buttonSqueezeanimation = new Tween(
      begin: deviceWidth * 0.7,
      end: 50.0,
    ).animate(new CurvedAnimation(
      parent: buttonController,
      curve: new Interval(
        0.0,
        0.150,
      ),
    ));
  }

  Future<void> getSingature() async {
    signature = await SmsAutoFill().getAppSignature;
    await SmsAutoFill().listenForCode;
  }

  verifyBtn(code) {
    return AppBtn(
        title: VERIFY_AND_PROCEED,
        btnAnim: buttonSqueezeanimation,
        btnCntrl: buttonController,
        onBtnSelected: () async {
          checkNetwork(code);
        });
  }

  setSnackbar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      content: new Text(
        msg,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      elevation: 1.0,
    ));
  }

  Future<void> checkNetwork(code) async {
    _playAnimation();
    try {
      await FirebaseAuth.instance
          .signInWithCredential(PhoneAuthProvider.credential(
          verificationId: _verificationCode, smsCode: code))
          .then((value) async {
        print("_verificationCode $_verificationCode");
        print("code $code");
        if (value.user != null) {
          Toast.show("Register SuccessFully", context,
              backgroundColor: ColorsRes.black,
              textColor: ColorsRes.white,
              duration: 5);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HappyShopHome()));
          await buttonController.reverse();
        }
      });
    } catch (e) {
      print("e-->$e");
      FocusScope.of(context).unfocus();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('invalid OTP')));
      setState(() {});
    }
  }

  Future<Null> _playAnimation() async {
    try {
      await buttonController.forward();
    } on TickerCanceled {}
  }

  getImage() {
    return Container(
      padding: EdgeInsets.only(top: 100.0),
      child: Center(
        child: new SvgPicture.network(
          'https://smartkit.wrteam.in/smartkit/images/happyshopwhitelogo.svg',
          width: 80.0,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  @override
  void dispose() {
    buttonController.dispose();
    super.dispose();
  }

  monoVarifyText() {
    return Padding(
        padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
        child: Center(
          child: new Text(MOBILE_NUMBER_VARIFICATION, style: Theme.of(context).textTheme.headline6.copyWith(color: lightblack)),
        ));
  }

  otpText() {
    return Padding(
        padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: Center(
          child: new Text(ENTER_YOUR_OTP_SENT_TO, style: Theme.of(context).textTheme.headline6.copyWith(color: lightblack, fontStyle: FontStyle.normal)),
        ));
  }

  mobText() {
    return Padding(
      padding: EdgeInsets.only(bottom: 0.0, left: 20.0, right: 20.0, top: 10.0),
      child: Center(
        child: Text(widget.mobileNumber, style: Theme.of(context).textTheme.headline6.copyWith(color: lightblack)),
      ),
    );
  }

  otpLayout() {
    return Padding(
        padding: EdgeInsets.only(left: 80.0, right: 80.0, top: 10.0),
        child: Center(
            child: PinFieldAutoFill(
                decoration: UnderlineDecoration(
                  textStyle: TextStyle(fontSize: 20, color: Colors.black),
                  colorBuilder: FixedColorBuilder(primaryLight2),
                ),
                currentCode: otp,
                codeLength: 6,
                onCodeChanged: (String code) {
                  otp = code;
                },
                onCodeSubmitted: (String code) {
                  otp = code;
                  setState(() {});
                })));
  }

  resendText() {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0, top: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            DIDNT_GET_THE_CODE,
            style: Theme.of(context).textTheme.bodyText1.copyWith(color: lightblack2, fontWeight: FontWeight.normal),
          ),
          InkWell(
              onTap: () {},
              child: Text(
                RESEND_OTP,
                style: Theme.of(context).textTheme.bodyText1.copyWith(color: primary, decoration: TextDecoration.underline),
              ))
        ],
      ),
    );
  }

  expandedBottomView() {
    double width = MediaQuery.of(context).size.width;
    return Expanded(
        child: Container(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    width: width,
                    padding: EdgeInsets.only(top: 50.0),
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      margin: EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          monoVarifyText(),
                          otpText(),
                          mobText(),
                          otpLayout(),
                          verifyBtn(otp),
                          resendText(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }

  back() {
    return BoxDecoration(
      gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [primaryLight2, primaryLight3], stops: [0, 1]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        body: Container(
            decoration: back(),
            child: Center(
              child: Column(
                children: <Widget>[
                  getImage(),
                  expandedBottomView(),
                ],
              ),
            )));
  }
  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91 ${widget.mobileNumber}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              print("value-->$value");
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HappyShopHome()));
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verficationID, int resendToken) {
          setState(() {
            _verificationCode = verficationID;
            print("_ver-->$_verificationCode");
            print("ver id-->$verficationID");
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 120));
  }
}
