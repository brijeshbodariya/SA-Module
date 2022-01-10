import 'dart:ui';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/StringsRes.dart';
import 'package:smartkit/FullApp/Grobag/Helper/GrobagAppbar.dart';
import 'package:smartkit/FullApp/Grobag/Helper/GrobagColor.dart';
import 'package:smartkit/FullApp/Grobag/Helper/GrobagString.dart';
import 'package:sms_autofill/sms_autofill.dart';

import 'GrobagHomeDesktop.dart';

class GrobagOTPDesktop extends StatefulWidget {
  @override
  _GrobagOTPDesktopState createState() => _GrobagOTPDesktopState();
}

class _GrobagOTPDesktopState extends State<GrobagOTPDesktop> {
  String countrycode, otp;
  String signature = "";

  void initState() {
    super.initState();
    getSingature();
  }

  Future<void> getSingature() async {
    signature = await SmsAutoFill().getAppSignature;
    await SmsAutoFill().listenForCode;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async{
          Navigator.of(context).pop();
          return true;
        },
      child: Scaffold(
        /*appBar: GrobagAppbar(
          title: Register,
        ),*/
        body: Center(
          child: SizedBox(width: 600,height:550,
            child: Card(color: Colors.white,elevation: 10,margin: EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 20),
                            Text(
                              Register,
                              style: Theme.of(context).textTheme.headline3.copyWith(color: fontColor)
                            ),
                            SizedBox(height: 50),
                            Text(
                              "Verifying Your Number",
                              style: Theme.of(context).textTheme.headline4.copyWith(color: fontColor),
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
                                child: Text("Resend OTP", style: TextStyle(color: primary)),
                                onTap: () {},
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    nextBtn()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  otpLayout() {
    return Padding(
        padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 50.0, bottom: 20),
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
                onCodeSubmitted: (String code) {
                  otp = code;
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

  nextBtn() {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: new Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        width: double.infinity,
        height: 48,
        decoration: new BoxDecoration(
          color: Color(0xff00b65f),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [BoxShadow(color: Color(0x29000000), offset: Offset(0, 0), blurRadius: 3, spreadRadius: 0)],
        ),
        child: Center(
          child: Text("Next",
              style: TextStyle(
                color: white,
              )),
        ),
      ),
      onPressed: () {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => GrobagHomeDesktop()), (Route<dynamic> route) => false);
      },
    );
  }
}
