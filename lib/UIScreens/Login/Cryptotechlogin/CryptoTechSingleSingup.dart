import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';

import 'CryptotechSingleLogin.dart';

class CryptoTechSingleSingup extends StatefulWidget {
  CryptoTechSingleSingup({Key key}) : super(key: key);

  @override
  _CryptoTechSingleSingupState createState() => _CryptoTechSingleSingupState();
}

class _CryptoTechSingleSingupState extends State<CryptoTechSingleSingup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => Container(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 50),
          height: double.maxFinite,
          decoration: gradient_box,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                margin: EdgeInsetsDirectional.only(bottom: 20),
                width: double.maxFinite,
                child: Row(
                  children: <Widget>[
                    Text("Signup", style: Theme.of(context).textTheme.headline5.merge(TextStyle(color: Colors.white, fontWeight: FontWeight.w400, letterSpacing: 1.5))),
                  ],
                ),
              ),
              Expanded(child: Center(child: MyCustomForm())),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CryptoTechSingleLogin()));
        },
        child: Container(
          height: 55,
          decoration: BoxDecoration(
            color: cryptocolor3,
            border: Border(
              top: BorderSide(width: 1.0, color: Colors.white.withOpacity(0.5)),
            ),
          ),
          child: Center(
            child: RichText(
                text: new TextSpan(children: [
              new TextSpan(
                  text: "Already have an account?",
                  style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.418,
                      ))),
              new TextSpan(
                  text: "Sing In",
                  style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(
                        color: cryptocolor3,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.418,
                      ))),
            ])),
          ),
        ),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController edtpsw = TextEditingController();
  TextEditingController edtfname = TextEditingController();
  TextEditingController edtlname = TextEditingController();
  TextEditingController edtemail = TextEditingController();
  TextEditingController edtmobile = TextEditingController();
  bool acceptterms = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                focusedBorder: outlineborderedittext,
                disabledBorder: outlineborderedittext,
                enabledBorder: outlineborderedittext,
                errorBorder: outlineborderedittext,
                hoverColor: Colors.white,
                fillColor: Colors.white,
                focusColor: Colors.white,
                labelText: 'First Name',
                hintText: 'Mac',
                labelStyle: TextStyle(color: cryptocolor1),
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
              ),
              controller: edtfname,
              keyboardType: TextInputType.text,
              // validator: (val) => val.isEmpty ? "${"StringsRes.enter_first_name"}" : null,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  focusedBorder: outlineborderedittext,
                  disabledBorder: outlineborderedittext,
                  enabledBorder: outlineborderedittext,
                  errorBorder: outlineborderedittext,
                  hoverColor: Colors.white,
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  hintText: 'Jac',
                  labelStyle: TextStyle(color: cryptocolor1),
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                ),
                controller: edtlname,
                keyboardType: TextInputType.text,
                // validator: (val) => val.isEmpty ? "${StringsRes.enter_last_name}" : null,
              ),
            ),
            TextFormField(
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                labelText: 'Email',
                focusedBorder: outlineborderedittext,
                disabledBorder: outlineborderedittext,
                enabledBorder: outlineborderedittext,
                errorBorder: outlineborderedittext,
                hoverColor: Colors.white,
                fillColor: Colors.white,
                focusColor: Colors.white,
                hintText: 'demo@deom.com',
                labelStyle: TextStyle(color: cryptocolor1),
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
              ),
              keyboardType: TextInputType.emailAddress,
              // validator: (val) => Constant.validateEmail(val),
              controller: edtemail,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  labelText: 'Mobile Number',
                  labelStyle: TextStyle(color: cryptocolor1),
                  focusedBorder: outlineborderedittext,
                  disabledBorder: outlineborderedittext,
                  enabledBorder: outlineborderedittext,
                  errorBorder: outlineborderedittext,
                  hoverColor: Colors.white,
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  hintText: "+91 0123456789",
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                ),
                keyboardType: TextInputType.phone,
                // validator: (val) => Constant.validateMobile(val),
                controller: edtmobile,
              ),
            ),
            TextFormField(
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: cryptocolor1),
                focusedBorder: outlineborderedittext,
                disabledBorder: outlineborderedittext,
                enabledBorder: outlineborderedittext,
                errorBorder: outlineborderedittext,
                hoverColor: Colors.white,
                fillColor: Colors.white,
                focusColor: Colors.white,
                hintText: '********',
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
              ),
              controller: edtpsw,
              // validator: (val) => val.length < 8 ? '${StringsRes.password_length_warning}' : null,
              obscureText: true,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(color: cryptocolor1),
                  focusedBorder: outlineborderedittext,
                  disabledBorder: outlineborderedittext,
                  enabledBorder: outlineborderedittext,
                  errorBorder: outlineborderedittext,
                  hoverColor: Colors.white,
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  hintText: '********',
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                ),
                // validator: (val) => val == edtpsw.text ? null : '${StringsRes.confirm_psw_notmatch}',
                obscureText: true,
              ),
            ),
            Row(
              children: <Widget>[
                Theme(
                    data: ThemeData(unselectedWidgetColor: Colors.white),
                    child: Transform.scale(
                      scale: 0.9,
                      child: Checkbox(
                          value: acceptterms,
                          activeColor: Colors.white,
                          checkColor: cryptocolor2,
                          onChanged: (value) => setState(() {
                                acceptterms = !acceptterms;
                              })),
                    )),
                Flexible(
                  child: RichText(
                      text: TextSpan(style: new TextStyle(color: Colors.white), text: "I Accept\t", children: <TextSpan>[
                    TextSpan(text: "Terms And Condition", style: TextStyle(color: Colors.white, decoration: TextDecoration.underline), recognizer: TapGestureRecognizer()..onTap = () {}),
                    TextSpan(text: "\t${'&'}\t"),
                    TextSpan(text: "Privacy Policy", style: TextStyle(color: Colors.white, decoration: TextDecoration.underline), recognizer: TapGestureRecognizer()..onTap = () {}),
                  ])),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {},
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: EdgeInsets.only(top: 10),
                child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  child: Text(
                    "Register",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6.merge(TextStyle(
                          color: cryptocolor2,
                          letterSpacing: 1.65,
                          fontWeight: FontWeight.w700,
                          //fontWeight: FontWeight.w500,
                        )),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
