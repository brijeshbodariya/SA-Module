import 'package:smartkit/FullApp/eStudy/desktop/Activity/HomeActivityDesktop.dart';
import 'package:smartkit/FullApp/eStudy/desktop/Login/CreateNewAccountActivityDesktop.dart';
import 'package:smartkit/FullApp/eStudy/desktop/Login/CreateNewPasswordActivityDesktop.dart';
import 'package:smartkit/FullApp/eStudy/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/eStudy/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/eStudy/helper/StringsRes.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitHome.dart';

class LoginActivityDesktop extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginActivityDesktopState();
  }
}

class LoginActivityDesktopState extends State<LoginActivityDesktop> {
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
      onWillPop: () {
        return Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(),
          ),
        );
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
          title: Text(
            StringsRes.Login_lb,
            style: TextStyle(color: ColorsRes.introTitlecolor, fontSize: 28),
          ),
          centerTitle: true,
        ),*/
        body: Center(
          child: SizedBox(
            width: 600,
            height: 750,
            child: Card(
              color: ColorsRes.bgcolor,
              elevation: 10,
              margin: EdgeInsets.all(10),
              child: Container(
                margin: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 25),
                      Text(
                        StringsRes.Login_lb,
                        style: TextStyle(color: ColorsRes.introTitlecolor, fontSize: 28),
                      ),
                      SizedBox(height: 50),
                      Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: Text(
                            StringsRes.Login_Detail_Title_lb,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontFamily: 'Nunito-Regular', fontSize: 24, color: ColorsRes.introMessagecolor),
                          )),
                      SizedBox(height: 35),
                      Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          decoration: DesignConfig.boxDecorationContainer(ColorsRes.white, 10),
                          child: Column(children: [
                            Container(
                              height: 61,
                              padding: const EdgeInsets.only(left: 10),
                              child: TextFormField(
                                style: TextStyle(color: ColorsRes.black),
                                cursorColor: ColorsRes.black,
                                decoration: InputDecoration(
                                  hintText: StringsRes.Email_lb,
                                  hintStyle: Theme.of(context).textTheme.subtitle2.merge(TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: ColorsRes.introMessagecolor)),
                                  border: InputBorder.none,
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                            Divider(
                              height: 0.0,
                              thickness: 2,
                            ),
                            Container(
                              height: 61,
                              padding: const EdgeInsets.only(left: 10),
                              child: TextFormField(
                                style: TextStyle(color: ColorsRes.black),
                                cursorColor: ColorsRes.black,
                                decoration: InputDecoration(
                                  hintText: StringsRes.Password_lb,
                                  hintStyle: Theme.of(context).textTheme.subtitle2.merge(TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: ColorsRes.introMessagecolor)),
                                  border: InputBorder.none,
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                            Divider(
                              height: 0.0,
                              thickness: 2,
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (_) => CreateNewPasswordActivityDesktop()));
                                },
                                child: Container(
                                    margin: EdgeInsets.only(right: 20), height: 61, alignment: Alignment.centerRight, child: Text(StringsRes.Forgot_lb, textAlign: TextAlign.left, style: TextStyle(fontSize: 18, color: ColorsRes.introMessagecolor))))
                          ])),
                      SizedBox(height: 43),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeActivityDesktop()));
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
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 20,
                      ),
                      Container(margin: EdgeInsets.only(right: 20), alignment: Alignment.center, child: Text("Don't have Account ?", textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: ColorsRes.introMessagecolor))),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => CreateNewAccountActivityDesktop()));
                        },
                        child: Container(
                            margin: EdgeInsets.only(right: 20),
                            alignment: Alignment.center,
                            child: Text("Sign Up",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: ColorsRes.appcolor,
                                ))),
                      )
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
