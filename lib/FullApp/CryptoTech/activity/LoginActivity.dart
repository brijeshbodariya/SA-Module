import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/Constant.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/StringsRes.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/new_dialog.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitHome.dart';
import 'package:smartkit/services/auth_service.dart';
import 'package:toast/toast.dart';
import 'SignUp/Signup_Page1.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/ease_in_widget.dart';

GlobalKey<ScaffoldState> scaffoldKey;

class LoginActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginActivityState();
  }
}

class LoginActivityState extends State<LoginActivity> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController edtemail = TextEditingController();
  TextEditingController edtpsw = TextEditingController();
  TextEditingController forgotedtemail = TextEditingController();
  AuthServices authServices = AuthServices();
  bool _obscureText = true;
  bool isLoading = false, isdialogloading = false;

  @override
  void initState() {
    super.initState();

    scaffoldKey = GlobalKey<ScaffoldState>();
  }

  @override
  Widget build(BuildContext context) {
    double toppadding = 2 * kToolbarHeight;
    var width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        return Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(),
          ),
        );
      },
      child: Scaffold(
        backgroundColor: ColorsRes.bgcolor,
        key: scaffoldKey,
        body: Stack(
          children: [
            Center(
              child: Container(
                // constraints: BoxConstraints.expand(),
                /*  decoration: BoxDecoration(
                  gradient: DesignConfig.gradient,
                ), */
                padding: EdgeInsets.only(left: 20, right: 20),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: ScreenTypeLayout(
                      mobile: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(
                            height: toppadding,
                          ),
                          CachedNetworkImage(
                            imageUrl:
                                'https://smartkit.wrteam.in/smartkit/cryptotech/logo.png',
                            color: ColorsRes.appcolor,
                            height: width - 100,
                          ),
                          Container(
                            decoration: DesignConfig.BoxDecorationContainer(
                                ColorsRes.editboxcolor, 10),
                            margin: EdgeInsets.only(top: 30),
                            padding:
                                EdgeInsets.only(left: 10, top: 5, bottom: 5),
                            child: TextFormField(
                              style: TextStyle(color: ColorsRes.appcolor),
                              cursorColor: ColorsRes.appcolor,
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: StringsRes.email_address,
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    .merge(TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: ColorsRes.appcolor
                                            .withOpacity(0.5))),
                                border: InputBorder.none,
                                errorStyle: TextStyle(color: ColorsRes.grey),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: (val) => Constant.validateEmail(val),
                              controller: edtemail,
                            ),
                          ),
                          Container(
                            decoration: DesignConfig.BoxDecorationContainer(
                                ColorsRes.editboxcolor, 10),
                            margin: EdgeInsets.only(top: 12),
                            padding: EdgeInsets.only(left: 10, right: 5),
                            child: TextFormField(
                              obscureText: _obscureText,
                              controller: edtpsw,
                              validator: (val) => val.isEmpty
                                  ? '${StringsRes.enter_password}'
                                  : null,
                              style: TextStyle(color: ColorsRes.appcolor),
                              cursorColor: ColorsRes.appcolor,
                              decoration: InputDecoration(
                                hintText: StringsRes.password,
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    .merge(TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: ColorsRes.appcolor
                                            .withOpacity(0.5))),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                showNewDialog(
                                    context: context,
                                    builder: (context) => ForgotDialog());
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 2),
                                padding: const EdgeInsets.all(5),
                                child: Text(
                                  "${StringsRes.forgot_password} ?",
                                  style: TextStyle(
                                      color: ColorsRes.firstgradientcolor),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          isLoading
                              ? Center(
                                  child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: new CircularProgressIndicator(),
                                ))
                              : Container(),
                          EaseInWidget(
                            onTap: () async {
                              if (_formKey.currentState.validate()) {
                                try {
                                  await authServices.authSignInUser(
                                      emailInput: edtemail.text,
                                      passwordInput: edtpsw.text,
                                      context: context);
                                  Toast.show("LogIn SuccessFully", context,
                                      backgroundColor: ColorsRes.black,
                                      textColor: ColorsRes.white,
                                      duration: 5);
                                  Constant.GoToMainPage("login", context);
                                } catch (e) {
                                  print("e-->$e");
                                  Toast.show(e.message.toString(), context,
                                      backgroundColor: ColorsRes.black,
                                      textColor: ColorsRes.white,
                                      duration: 5);
                                }
                              }
                            },
                            child: DesignConfig.ButtonWithShadowNew(
                                StringsRes.login.toUpperCase(), context),
                          ),
                          SizedBox(height: 12),
                          Text("${StringsRes.lblor}",
                              style: TextStyle(color: ColorsRes.white)),
                          SizedBox(height: 12),
                          Text("${StringsRes.nothvaccount}",
                              style: TextStyle(
                                  color: ColorsRes.firstgradientcolor)),
                          EaseInWidget(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Signup_Page1()));
                            },
                            child: Container(
                                decoration:
                                    DesignConfig.BoxDecorationBorderContainer(
                                        ColorsRes.appcolor.withOpacity(0.5),
                                        10),
                                width: double.maxFinite,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 10, bottom: 10),
                                margin: EdgeInsets.only(
                                    top: 5, left: 25, right: 25),
                                child: Text(StringsRes.createnewac,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        .merge(TextStyle(
                                            color: ColorsRes.appcolor,
                                            fontWeight: FontWeight.bold)))),
                          ),
                          SizedBox(
                            height: toppadding - 80,
                          ),
                        ],
                      ),
                      desktop: Container(
                        width: width / 3,
                        child: Column(
                          // mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: toppadding,
                            ),
                            CachedNetworkImage(
                              imageUrl:
                                  'https://smartkit.wrteam.in/smartkit/cryptotech/logo.png',
                              color: ColorsRes.appcolor,
                              height: width / 4,
                            ),
                            Container(
                              decoration: DesignConfig.BoxDecorationContainer(
                                  ColorsRes.editboxcolor, 10),
                              margin: EdgeInsets.only(top: 30),
                              padding:
                                  EdgeInsets.only(left: 10, top: 5, bottom: 5),
                              child: TextFormField(
                                style: TextStyle(color: ColorsRes.appcolor),
                                cursorColor: ColorsRes.appcolor,
                                decoration: InputDecoration(
                                  isDense: true,
                                  hintText: StringsRes.email_address,
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      .merge(TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: ColorsRes.appcolor
                                              .withOpacity(0.5))),
                                  border: InputBorder.none,
                                  errorStyle: TextStyle(color: ColorsRes.grey),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                validator: (val) => Constant.validateEmail(val),
                                controller: edtemail,
                              ),
                            ),
                            Container(
                              decoration: DesignConfig.BoxDecorationContainer(
                                  ColorsRes.editboxcolor, 10),
                              margin: EdgeInsets.only(top: 12),
                              padding: EdgeInsets.only(left: 10, right: 5),
                              child: TextFormField(
                                obscureText: _obscureText,
                                controller: edtpsw,
                                validator: (val) => val.isEmpty
                                    ? '${StringsRes.enter_password}'
                                    : null,
                                style: TextStyle(color: ColorsRes.appcolor),
                                cursorColor: ColorsRes.appcolor,
                                decoration: InputDecoration(
                                  hintText: StringsRes.password,
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      .merge(TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: ColorsRes.appcolor
                                              .withOpacity(0.5))),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () {
                                  showNewDialog(
                                      context: context,
                                      builder: (context) => ForgotDialog());
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: 2),
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    "${StringsRes.forgot_password} ?",
                                    style: TextStyle(
                                        color: ColorsRes.firstgradientcolor),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            isLoading
                                ? Center(
                                    child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: new CircularProgressIndicator(),
                                  ))
                                : Container(),
                            EaseInWidget(
                              onTap: () async {
                                Constant.GoToMainPage("login", context);
                              },
                              child: DesignConfig.ButtonWithShadowNew(
                                  StringsRes.login.toUpperCase(), context),
                            ),
                            SizedBox(height: 12),
                            Text("${StringsRes.lblor}",
                                style: TextStyle(color: ColorsRes.white)),
                            SizedBox(height: 12),
                            Text("${StringsRes.nothvaccount} ?",
                                style: TextStyle(
                                    color: ColorsRes.firstgradientcolor)),
                            EaseInWidget(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Signup_Page1()));
                              },
                              child: Container(
                                  decoration:
                                      DesignConfig.BoxDecorationBorderContainer(
                                          ColorsRes.appcolor.withOpacity(0.5),
                                          10),
                                  width: double.maxFinite,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 10, bottom: 10),
                                  margin: EdgeInsets.only(
                                      top: 5, left: 25, right: 25),
                                  child: Text(StringsRes.createnewac,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1
                                          .merge(TextStyle(
                                              color: ColorsRes.appcolor,
                                              fontWeight: FontWeight.bold)))),
                            ),
                            SizedBox(
                              height: toppadding - 80,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: IntrinsicHeight(
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: GestureDetector(
                    onTap: () {
                      return Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyHomePage(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://smartkit.wrteam.in/smartkit/cryptotech/back_button.png',
                      ),
                    ),
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

class ForgotDialog extends StatefulWidget {
  @override
  ForgotAlert createState() => new ForgotAlert();
}

class ForgotAlert extends State<ForgotDialog> {
  BuildContext _scaffoldContext;
  bool iserror = false;
  TextEditingController forgotedtemail;
  bool isdialogloading = false;

  @override
  initState() {
    forgotedtemail = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _scaffoldContext = context;
    return OpenForgotDialog();
  }

  OpenForgotDialog() {
    return AlertDialog(
      title: Text(StringsRes.forgot_password),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            keyboardType: TextInputType.emailAddress,
            controller: forgotedtemail,
            decoration: InputDecoration(
              hintText: "Enter Email",
              errorText: iserror ? 'Enter Valid Email Address' : null,
            ),
          ),
          isdialogloading ? new CircularProgressIndicator() : Container(),
        ],
      ),
      actions: <Widget>[
        new TextButton(
          child: new Text(StringsRes.recover_password),
          onPressed: () async {},
        ),
        new TextButton(
          child: new Text(StringsRes.cancel),
          onPressed: () {
            Navigator.of(_scaffoldContext).pop();
          },
        ),
      ],
    );
  }
}
