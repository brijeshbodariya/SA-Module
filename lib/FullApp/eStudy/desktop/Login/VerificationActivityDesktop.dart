import 'package:smartkit/FullApp/eStudy/desktop/Activity/HomeActivityDesktop.dart';
import 'package:smartkit/FullApp/eStudy/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/eStudy/helper/StringsRes.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sms_autofill/sms_autofill.dart';

class VerificationActivityDesktop extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new VerificationActivityDesktopState();
  }
}

class VerificationActivityDesktopState extends State<VerificationActivityDesktop> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        return true;
      },
      child: new Scaffold(
        backgroundColor: ColorsRes.white,
        resizeToAvoidBottomInset: false,
        /*appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: ColorsRes.appcolor,
          ),
          */ /*title: Text(
            StringsRes.Verification_lb,
            style: TextStyle(color: ColorsRes.introTitlecolor, fontSize: 28),
          ),
          centerTitle: true,*/ /*
        ),*/
        body: Center(
          child: SizedBox(
            width: 550,
            height: 600,
            child: Card(
              color: ColorsRes.bgcolor,
              elevation: 10,
              margin: EdgeInsets.all(10),
              child: new Container(
                margin: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 25),
                      Text(
                        StringsRes.Verification_lb,
                        style: TextStyle(color: ColorsRes.introTitlecolor, fontSize: 28),
                      ),
                      SizedBox(height: 50),
                      Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: Text(
                            StringsRes.Verification_Code_Title,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontFamily: 'Nunito-Regular', fontSize: 24, color: ColorsRes.introMessagecolor),
                          )),
                      SizedBox(height: 35),
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          height: 61,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(left: 10),
                          child: Padding(
                              padding: EdgeInsets.only(
                                left: 15.0,
                                right: 15.0,
                              ),
                              child: Center(
                                  child: PinFieldAutoFill(
                                      decoration: BoxLooseDecoration(
                                        strokeColorBuilder: FixedColorBuilder(ColorsRes.introMessagecolor),
                                        bgColorBuilder: FixedColorBuilder(ColorsRes.white),
                                        radius: Radius.circular(10.0),
                                        textStyle: TextStyle(fontSize: 20, color: ColorsRes.black),
                                      ),
                                      codeLength: 4,
                                      onCodeChanged: (String code) {},
                                      onCodeSubmitted: (String code) {}))),
                        ),
                      ),
                      SizedBox(height: 69),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            StringsRes.Did_Not_Receive_A_Code_lb,
                            style: TextStyle(color: ColorsRes.introMessagecolor, fontSize: 20),
                          )),
                      SizedBox(height: 12),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            StringsRes.Resend_lb,
                            style: TextStyle(color: ColorsRes.appcolor, fontSize: 20),
                          )),
                      SizedBox(height: 43),
                      TextButton(
                          onPressed: () {
                            return Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomeActivityDesktop()), (Route<dynamic> route) => false);

                            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeActivity()));
                          },
                          child: Container(
                              padding: EdgeInsets.only(left: 65),
                              margin: EdgeInsets.only(left: 20, right: 20),
                              alignment: Alignment.center,
                              height: 65,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  ColorsRes.secondgradientcolor,
                                  ColorsRes.firstgradientcolor,
                                ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                Text(
                                  StringsRes.Continue_Button_lb,
                                  style: TextStyle(color: ColorsRes.white, fontSize: 20),
                                ),
                                SizedBox(width: 65),
                                Align(alignment: Alignment.center, child: SvgPicture.network("https://smartkit.wrteam.in/smartkit/eStudy/continue.svg"))
                              ]))),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
