import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';

import 'CryptoTechSingleSingup.dart';

class CryptoTechSingleLogin extends StatefulWidget {
  CryptoTechSingleLogin({Key key}) : super(key: key);

  @override
  _CryptoTechSingleLoginState createState() => _CryptoTechSingleLoginState();
}

class _CryptoTechSingleLoginState extends State<CryptoTechSingleLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => Container(
          height: double.maxFinite,
          decoration: gradient_box,
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: MyCustomForm(),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CryptoTechSingleSingup()));
        },
        child: Container(
          height: 55,
          decoration: BoxDecoration(
            color: cryptocolor3,
            border: Border(
              top: BorderSide(width: 1.0, color: Colors.white.withOpacity(0.5)),
            ),
          ),
          child: Center(child: Text("Create New Account", style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: cryptocolor1, letterSpacing: 1.65, fontWeight: FontWeight.w400)))),
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
  TextEditingController edtemail = TextEditingController();
  TextEditingController edtpsw = TextEditingController();
  TextEditingController forgotedtemail = TextEditingController();

  bool _obscureText = true;
  bool isLoading = false, isdialogloading = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            'assets/cryptoking.svg',
            width: 150.0,
            height: 150.0,
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text("Welcome",
                style: Theme.of(context).textTheme.headline5.merge(TextStyle(
                      color: Colors.white,
                      letterSpacing: 2.25,
                      fontWeight: FontWeight.w400,
                    ))),
          ),
          Text("Signin to continue with your mobile number",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle2.merge(
                    TextStyle(
                      color: Colors.white,
                      letterSpacing: 1.35,
                      fontWeight: FontWeight.w400,
                    ),
                  )),
          Container(margin: EdgeInsetsDirectional.only(top: 20, bottom: 5), width: double.maxFinite, child: Text("Email", style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: Colors.white)))),
          TextFormField(
            style: TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
              hintText: "Email Address",
              focusedBorder: outlineborderedittext,
              disabledBorder: outlineborderedittext,
              enabledBorder: outlineborderedittext,
              errorBorder: outlineborderedittext,

              hoverColor: Colors.white,
              fillColor: Colors.white,
              focusColor: Colors.white,
              //isDense: true,
              prefixIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
            keyboardType: TextInputType.emailAddress,
            // validator: (val) => Constant.validateEmail(val),
            controller: edtemail,
          ),
          Container(margin: EdgeInsetsDirectional.only(top: 20, bottom: 5), alignment: Alignment.centerLeft, child: Text("Password", style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: Colors.white)))),
          TextFormField(
            obscureText: _obscureText,
            controller: edtpsw,
            // validator: (val) => val.isEmpty ? '${StringsRes.enter_password}' : null,
            style: TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
              hintText: "Password",
              focusedBorder: outlineborderedittext,
              disabledBorder: outlineborderedittext,
              enabledBorder: outlineborderedittext,
              errorBorder: outlineborderedittext,
              hoverColor: Colors.white,
              fillColor: Colors.white,
              focusColor: Colors.white,
              //isDense: true,
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  // setState(() {
                  //   _obscureText = !_obscureText;
                  // });
                },
                child: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CryptoTechHome()));
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: EdgeInsets.only(top: 30),
              //padding: const EdgeInsets.only(top: 12, bottom: 12),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                child: Text(
                  "Log in",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6.merge(TextStyle(
                        color: cryptocolor2,
                        letterSpacing: 1.65,
                        fontWeight: FontWeight.w700,
                      )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
