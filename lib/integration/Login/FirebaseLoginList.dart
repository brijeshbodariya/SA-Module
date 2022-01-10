import 'package:flutter/material.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/Constant/SmartKitFunction.dart';
import 'package:smartkit/SmartkitScreen/Widget/SmartKitListTile.dart';
import 'package:smartkit/Widget/Blog/BlogRoute.dart';
import 'package:smartkit/Widget/List/ListRoute.dart';

import 'LoginWithEmailPassword.dart';
import 'firebaseloginui.dart';

class FirebaseLoginRoute extends StatefulWidget {
  FirebaseLoginRoute({Key key}) : super(key: key);

  @override
  _FirebaseLoginRouteState createState() => _FirebaseLoginRouteState();
}

class _FirebaseLoginRouteState extends State<FirebaseLoginRoute> {
  List wrNewComponents = [
    {
      'route': LoginWithEmailPassword(),
      'title': "Firebase Login",
    },
    // {
    //   'route': PaymentGatewayList(),
    //   'title': "Payment Gateway",
    // },
    // {
    //   'route': DatabaseListPage(),
    //   'title': "Database",
    // },
    // {
    //   'route': GoogleMapPage(),
    //   'title': "Google Map",
    // },
    // {
    //   'route': AdMobMainPage(),
    //   'title': "Ad Mob",
    // },
    // {
    //   'route': YoutubePage(),
    //   'title': "You Tube",
    // },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(
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
      ),
    );
  }
}
