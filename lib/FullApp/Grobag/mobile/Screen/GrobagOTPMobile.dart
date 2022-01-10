import 'dart:ui';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/FoodMaster/desktop/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/Grobag/Helper/GrobagAppbar.dart';
import 'package:smartkit/FullApp/Grobag/Helper/GrobagColor.dart';
import 'package:smartkit/FullApp/Grobag/Helper/GrobagString.dart';
import 'package:smartkit/services/auth_service.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:toast/toast.dart';

import 'GrobagHomeMobile.dart';

class GrobagOTPMobile extends StatefulWidget {
  final String phone;

  const GrobagOTPMobile({Key key, this.phone}) : super(key: key);

  @override
  _GrobagOTPMobileState createState() => _GrobagOTPMobileState();
}

class _GrobagOTPMobileState extends State<GrobagOTPMobile> {
  AuthServices authServices = AuthServices();
  String countrycode, otp;
  String signature = "";
  String _verificationCode;

  void initState() {
    super.initState();
    _verifyPhone();
    getSingature();
  }

  Future<void> getSingature() async {
    signature = await SmsAutoFill().getAppSignature;
    print(signature);
    await SmsAutoFill().listenForCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GrobagAppbar(
        title: Register,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Verifying Your Number",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(color: fontColor),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'We have sent an OTP on your number please enter OTP in below fields',
                        style: TextStyle(color: fontLight),
                      ),
                    ),
                    otpLayout(),
                    Center(
                      child: InkWell(
                        child: Text("Resend OTP",
                            style: TextStyle(color: primary)),
                        onTap: () {

                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            nextBtn(otp)
          ],
        ),
      ),
    );
  }

  otpLayout() {
    return Padding(
        padding:
            EdgeInsets.only(left: 50.0, right: 50.0, top: 50.0, bottom: 20),
        child: Center(
            child: PinFieldAutoFill(
                decoration: UnderlineDecoration(
                  textStyle: TextStyle(color: Colors.black),
                  colorBuilder: FixedColorBuilder(primary),
                ),
                currentCode: otp,
                codeLength: 6,
                onCodeChanged: (String code) {
                  otp = code;
                },
                onCodeSubmitted: (String code) async {
                  otp = code;
                  setState(() {});
                })));
  }

  setCountryCode() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height * 0.9;
    return CountryCodePicker(
        showCountryOnly: false,
        searchDecoration: InputDecoration(
          hintText: CountryCodeLbl,
          hintStyle: TextStyle(color: fontColor),
          fillColor: fontColor,
        ),
        showOnlyCountryWhenClosed: false,
        initialSelection: 'IN',
        dialogSize: Size(width, height),
        alignLeft: true,
        // textStyle:TextStyle(color: fontColor,),
        onChanged: (CountryCode countryCode) {
          countrycode = countryCode.toString().replaceFirst("+", "");
        },
        onInit: (code) {
          countrycode = code.toString().replaceFirst("+", "");
        });
  }

  nextBtn(code) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: new Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        width: double.infinity,
        height: 48,
        decoration: new BoxDecoration(
          color: Color(0xff00b65f),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: Color(0x29000000),
                offset: Offset(0, 0),
                blurRadius: 3,
                spreadRadius: 0)
          ],
        ),
        child: Center(
          child: Text("Next",
              style: TextStyle(
                color: white,
              )),
        ),
      ),
      onPressed: () async {
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
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => GrobagHomeMobile()),
                  (Route<dynamic> route) => false);
            }
          });
        } catch (e) {
          print("e-->$e");
          FocusScope.of(context).unfocus();
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('invalid OTP')));
          setState(() {});
        }
      },
    );
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91 ${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              print("value-->$value");
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => GrobagHomeMobile(),
                ),
              );
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verficationID, int resendToken) {
          setState(() {
            _verificationCode = verficationID;
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
