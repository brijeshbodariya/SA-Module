import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';

class login_button extends StatelessWidget {
  /// This is an example app which make use of
  /// `SignInButtonBuilder` and `SignInButton` class
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(appBarTheme: appBarTheme()),
      debugShowCheckedModeBanner: false,
      home: SignInPage(),
    );
  }
}

class SignInPage extends StatelessWidget {
  /// Normally the signin buttons should be contained in the SignInPage
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Flutter UI Component",style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,leading: BackButton(
          color: Colors.black
      ),),
      // backgroundColor: Color.fromRGBO(50, 50, 50, 1.0),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //***********************Email Button*************************
            SignInButtonBuilder(
              text: 'Get going with Email',
              icon: Icons.email,
              onPressed: () {},
              backgroundColor: Colors.blueGrey[700],
            ),
            Divider(),

            //***********************Google Button*************************
            SignInButton(
              Buttons.Google,
              onPressed: () {},
            ),

            //***********************Facebook Button*************************
            SignInButton(
              Buttons.Facebook,
              onPressed: () {},
            ),

            //***********************Github Button*************************
            SignInButton(
              Buttons.GitHub,
              onPressed: () {},
            ),

            //***********************Pinterest Button*************************
            SignInButton(
              Buttons.Pinterest,
              text: "Sign up with Pinterest",
              onPressed: () {},
            ),

            //***********************Twitter Button*************************
            SignInButton(
              Buttons.Twitter,
              text: "Use Twitter",
              onPressed: () {},
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //***********************Linked in Button*************************
                SignInButton(
                  Buttons.LinkedIn,
                  mini: true,
                  onPressed: () {},
                ),

                //***********************Tumblr Button*************************
                SignInButton(
                  Buttons.Tumblr,
                  mini: true,
                  onPressed: () {},
                ),

                //***********************Email Mini Button*************************
                SignInButtonBuilder(
                  icon: Icons.email,
                  text: "Ignored for mini button",
                  mini: true,
                  onPressed: () {},
                  backgroundColor: Colors.cyan,
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
