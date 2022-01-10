import 'package:flutter/material.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/Constant/SmartKitFunction.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitAppbar.dart';
import 'package:smartkit/SmartkitScreen/Widget/SmartKitListTile.dart';

import 'FirebaseRealtime/FirebaseRealtimeDb.dart';
import 'Sqflite/SqliteCRUD.dart';
import 'package:responsive_builder/responsive_builder.dart';

class DatabaseRoute extends StatefulWidget {
  DatabaseRoute({Key key}) : super(key: key);

  @override
  _DatabaseRouteState createState() => _DatabaseRouteState();
}

class _DatabaseRouteState extends State<DatabaseRoute> {
  List wrNewComponents = [
    {
      'route': SqliteCRUD(),
      'title': "Sqflite",
    },
    {
      'route': FirebaseRealtimeDb(),
      'title': "Firebase Realtime DB",
    },
  ];
  List wrdeskNewComponents = [
    {
      'route': FirebaseRealtimeDb(),
      'title': "Firebase Realtime DB",
    },
  ];

//  {
//       'route': AdMobMainPage(),
//       'title': "Ad Mob",
//     },
//  {
  //   'route': PaymentGatewayList(),
  //   'title': "Payment Gateway",
  // },
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: SmartKitAppbar(
          title: "Database List",
        ),
      ),
      body: ScreenTypeLayout(
        mobile: appWidget(),
        desktop: webWidget(6),
        tablet: webWidget(4),
      ),
    );
  }

  Widget appWidget() {
    return ListView.builder(
      padding: const EdgeInsets.all(10.0),
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

  Widget webWidget(int gridlen) {
    return GridView.count(
      crossAxisCount: gridlen,
      children: List.generate(wrdeskNewComponents.length, (index) {
        Color bg = tilecolor[index % tilecolor.length];
        Color iconbg = tileiconbgcolor[index % tileiconbgcolor.length];
        Color textcolor = tiletextcolor[index % tiletextcolor.length];
        getletter(wrdeskNewComponents[index]['title']);
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                  wrdeskNewComponents[index]['route']),
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
                    style:
                    Theme.of(context).textTheme.headline5.merge(TextStyle(
                      fontWeight: FontWeight.bold,
                      color: textcolor,
                    )),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  wrdeskNewComponents[index]['title'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.subtitle1.merge(
                      TextStyle(fontWeight: FontWeight.bold, color: textcolor)),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}