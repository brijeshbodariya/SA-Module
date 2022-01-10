import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/Grobag/Helper/GrobagAppbar.dart';
import 'package:smartkit/FullApp/Grobag/Helper/GrobagColor.dart';
import 'package:smartkit/FullApp/Grobag/Helper/GrobagString.dart';

import 'GrobagOTPDesktop.dart';

class GrobagMobInputDesktop extends StatefulWidget {
  @override
  _GrobagMobInputDesktopState createState() => _GrobagMobInputDesktopState();
}

class _GrobagMobInputDesktopState extends State<GrobagMobInputDesktop> {
  String countrycode;

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
                              Mobile,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  .copyWith(color: fontColor),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                'We need to text you the OTP to authenticate your account',
                                style: TextStyle(color: fontLight),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(vertical:58.0),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                  hintText: Mobile,
                                  prefixIcon: Container(
                                    width: 72,
                                    child: setCountryCode(),
                                  ),
                                  suffixIcon: Icon(
                                    Icons.call_outlined,
                                    color: primary,
                                  ),
                                ),
                                onChanged: (v) => setState(() {}),
                              ),
                            ),


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
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
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
      onPressed: () {
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => GrobagOTPDesktop()));
      },
    );
  }
}
