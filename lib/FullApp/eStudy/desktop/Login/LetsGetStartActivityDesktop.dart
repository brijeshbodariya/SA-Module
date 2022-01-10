import 'package:country_code_picker/country_code_picker.dart';
import 'package:smartkit/FullApp/eStudy/desktop/Login/VerificationActivityDesktop.dart';
import 'package:smartkit/FullApp/eStudy/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/eStudy/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/eStudy/helper/StringsRes.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LetsGetStartActivityDesktop extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LetsGetStartActivityDesktopState();
  }
}

class LetsGetStartActivityDesktopState extends State<LetsGetStartActivityDesktop> {
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
            StringsRes.Lets_Get_Started_lb,
            style: TextStyle(color: ColorsRes.introTitlecolor, fontSize: 28),
          ),
          centerTitle: true,*/ /*
        ),*/
        body: Center(
          child: SizedBox(
            width: 500,
            height: 500,
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
                        StringsRes.Lets_Get_Started_lb,
                        style: TextStyle(color: ColorsRes.introTitlecolor, fontSize: 28),
                      ),
                      SizedBox(height: 50),
                      Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: Text(
                            StringsRes.Enter_Mobile_Number_lb,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontFamily: 'Nunito-Regular', fontSize: 24, color: ColorsRes.introMessagecolor),
                          )),
                      SizedBox(height: 35),
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        decoration: DesignConfig.boxDecorationContainer(ColorsRes.white, 10),
                        child: Container(
                            height: 61,
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Expanded(
                                    //flex: 8,
                                    child: TextFormField(
                                  style: TextStyle(color: ColorsRes.black),
                                  cursorColor: ColorsRes.black,
                                  decoration: InputDecoration(
                                    prefixIcon: Container(
                                      width: 100,
                                      child: CountryCodePicker(
                                          showCountryOnly: false,
                                          boxDecoration: BoxDecoration(color: ColorsRes.white),
                                          searchDecoration: InputDecoration(
                                            hintText: "getTranslated(context,countrylb)",
                                            hintStyle: TextStyle(color: ColorsRes.black),
                                            fillColor: ColorsRes.black,
                                          ),
                                          showOnlyCountryWhenClosed: false,
                                          initialSelection: 'IN',
                                          flagWidth: 20,
                                          dialogSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
                                          alignLeft: true,
                                          padding: EdgeInsets.all(0),
                                          textStyle: TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold, fontSize: 15),
                                          onChanged: (CountryCode countryCode) {},
                                          onInit: (code) {}),
                                    ),
                                    hintText: StringsRes.Mobile_Number_lb,
                                    hintStyle: Theme.of(context).textTheme.subtitle2.merge(TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: ColorsRes.introMessagecolor)),
                                    border: InputBorder.none,
                                  ),
                                  keyboardType: TextInputType.phone,
                                )),
                              ],
                            )),
                      ),
                      SizedBox(height: 70),
                      TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => VerificationActivityDesktop()));
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
