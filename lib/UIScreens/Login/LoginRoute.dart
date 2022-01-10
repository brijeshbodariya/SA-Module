import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/Constant/SmartKitFunction.dart';
import 'package:smartkit/FullApp/HappyShop/Helper/HappyShopString.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitAppbar.dart';
import 'package:smartkit/SmartkitScreen/Widget/SmartKitListTile.dart';

import 'Animated_back.dart';
import 'Cryptotechlogin/CryptotechSingleLogin.dart';
import 'Happushoplogin/HappyShopSingleLogin.dart';
import 'Login_Outline.dart';
import 'Login_Simple.dart';
import 'Login_Social.dart';
import 'GlassSignin.dart';
import 'SmartKeyLogin/SmartKeySingleLogin.dart';
import 'WRLogin/WRLogin1.dart';
import 'WRLogin2/singup.dart';
import 'WRLogin3/SignUpPage.dart';

class LoginRoute extends StatefulWidget {
  LoginRoute({Key key}) : super(key: key);

  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  List wrNewComponents = [
    {
      'route': LoginSimple(),
      'title': "GlassMorphism Login/Signup",
    },
    {
      'route': HappyShopSingleLogin(),
      'title': "HappyShop Login/Signup",
    },
    {
      'route': SmartKeySingleLogin(),
      'title': "SmartKey Login/Signup",
    },
    {
      'route': CryptoTechSingleLogin(),
      'title': "CryptoTech Login/Signup",
    },
    {
      'route': WRLogin1(),
      'title': "Login/Signup 1",
    },
    {
      'route': WrSignUp(),
      'title': "Login/Signup 2",
    },
    {
      'route': WrSignUpPage(),
      'title': "Login/Signup 3",
    },
    {
      'route': Login_Simple(),
      'title': "Simple Login",
    },
    {
      'route': SocialLogin(),
      'title': "Social Media",
    },
    {
      'route': Login_Outline(),
      'title': "Login Outline",
    },
    {
      'route': Animated_back(),
      'title': "Animated Background",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return
        // WillPopScope(
        //   onWillPop: () {
        //     return Navigator.pushReplacement(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => MyHomePage(),
        //       ),
        //     );
        //   },
        //   child:
        Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: SmartKitAppbar(
            title: "Login",
          )),
      body: ScreenTypeLayout(
        mobile: appWidget(),
        desktop: webWidget(),
      ),
    );
    // );
  }

  Widget appWidget() {
    return ListView.builder(
      itemCount: wrNewComponents.length,
      itemBuilder: (BuildContext context, int index) {
        Color bg = tilecolor[index % tilecolor.length];
        Color iconbg = tileiconbgcolor[index % tileiconbgcolor.length];
        Color textcolor = tiletextcolor[index % tiletextcolor.length];
        getletter(wrNewComponents[index]['title']);

        return Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: ListTileUI(
            iconTitle: strs,
            title: wrNewComponents[index]['title'],
            color: bg,
            iconbg: iconbg,
            textcolor: textcolor,
            ontap: wrNewComponents[index]['route'],
          ),
        );
      },
    );
  }

  Widget webWidget() {
    return GridView.count(
      crossAxisCount: 6,
      children: List.generate(wrNewComponents.length, (index) {
        Color bg = tilecolor[index % tilecolor.length];
        Color iconbg = tileiconbgcolor[index % tileiconbgcolor.length];
        Color textcolor = tiletextcolor[index % tiletextcolor.length];
        getletter(wrNewComponents[index]['title']);
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (BuildContext context) => wrNewComponents[index]['route']),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            margin: new EdgeInsets.all(6.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: iconbg,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: 130,
                  height: 100,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  alignment: Alignment.center,
                  child: Text(
                    strs,
                    style: Theme.of(context).textTheme.headline5.merge(TextStyle(
                          fontWeight: FontWeight.bold,
                          color: textcolor,
                        )),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  wrNewComponents[index]['title'],
                  style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(fontWeight: FontWeight.bold, color: textcolor)),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
