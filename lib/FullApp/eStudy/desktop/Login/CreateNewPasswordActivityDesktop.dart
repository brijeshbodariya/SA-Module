import 'package:smartkit/FullApp/eStudy/desktop/Login/LetsGetStartActivityDesktop.dart';
import 'package:smartkit/FullApp/eStudy/desktop/Login/LoginActivityDesktop.dart';
import 'package:smartkit/FullApp/eStudy/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/eStudy/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/eStudy/helper/StringsRes.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateNewPasswordActivityDesktop extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new CreateNewPasswordActivityDesktopState();
  }
}

class CreateNewPasswordActivityDesktopState extends State<CreateNewPasswordActivityDesktop> {
  bool _conobscureText = true;
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
        backgroundColor: ColorsRes.bgPage,
        resizeToAvoidBottomInset: false,
        /*appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: ColorsRes.appcolor,
          ),
          */ /*title: Text(
            StringsRes.Create_Password_Title_lb,
            style: TextStyle(color: ColorsRes.introTitlecolor, fontSize: 28),
          ),
          centerTitle: true,*/ /*
        ),*/
        body: Center(
          child: SizedBox(
            width: 600,
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
                        StringsRes.Create_Password_Title_lb,
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
                        child: Container(
                          height: 61,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(left: 10),
                          child: TextFormField(
                            obscureText: _conobscureText,
                            obscuringCharacter: "*",
                            style: TextStyle(color: ColorsRes.black),
                            cursorColor: ColorsRes.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                              hintText: StringsRes.Password_lb,
                              hintStyle: Theme.of(context).textTheme.subtitle2.merge(TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: ColorsRes.introMessagecolor)),
                              border: InputBorder.none,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _conobscureText = !_conobscureText;
                                  });
                                },
                                child: Padding(
                                    padding: EdgeInsets.only(top: 20, bottom: 20, right: 10),
                                    child: Text(
                                      _conobscureText ? StringsRes.Show_lb : StringsRes.Hide_lb,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: ColorsRes.introMessagecolor,
                                        fontSize: 18,
                                      ),
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 69),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            StringsRes.Already_Have_Account_lb,
                            style: TextStyle(color: ColorsRes.introMessagecolor, fontSize: 20),
                          )),
                      SizedBox(height: 12),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginActivityDesktop()));
                          },
                          child: Text(
                            StringsRes.Sign_In_lb,
                            style: TextStyle(color: ColorsRes.appcolor, fontSize: 20),
                          )),
                      SizedBox(height: 43),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginActivityDesktop()));
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
