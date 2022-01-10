import 'dart:io';

import 'package:flutter/material.dart';

import 'AdMob/AdMobMainPage.dart';
import 'Database/DatabaseListPage.dart';
import 'GoogleMapPage.dart';
import 'Login/FirebaseLogin.dart';
import 'PaymentGateway/PaymentGatewayList.dart';
import 'YouTube/YoutubePage.dart';
import 'helper/ColorsRes.dart';

class IntegrationList extends StatefulWidget {
  @override
  _IntegrationListState createState() => _IntegrationListState();
}

class _IntegrationListState extends State<IntegrationList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Integrations", style: TextStyle(color: ColorsRes.white)),
        centerTitle: true,
      ),
      body: ListView(children: [
        ListTile(
          leading: Icon(Icons.keyboard_arrow_right),
          title: Text("Firebase Login"),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => FirebaseLogin()));
          },
        ),
        ListTile(
          leading: Icon(Icons.keyboard_arrow_right),
          title: Text("Payment Gateway"),
          onTap: () {
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentGatewayList()));
          },
        ),
        ListTile(
          leading: Icon(Icons.keyboard_arrow_right),
          title: Text("Database"),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => DatabaseListPage()));
          },
        ),
        ListTile(
          leading: Icon(Icons.keyboard_arrow_right),
          title: Text("Google Map"),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => GoogleMapPage()));
          },
        ),
        // if (Platform.isIOS || Platform.isAndroid)
        //   ListTile(
        //     leading: Icon(Icons.keyboard_arrow_right),
        //     title: Text("AdMob"),
        //     onTap: () {
        //       Navigator.of(context).push(MaterialPageRoute(builder: (context) => AdMobMainPage()));
        //     },
        //   ),
        ListTile(
          leading: Icon(Icons.keyboard_arrow_right),
          title: Text("YouTube"),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => YoutubePage()));
          },
        ),
      ]),
    );
  }
}
