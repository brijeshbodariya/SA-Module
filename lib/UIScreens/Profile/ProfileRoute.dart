import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/Constant/SmartKitFunction.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitAppbar.dart';
import 'package:smartkit/SmartkitScreen/Widget/SmartKitListTile.dart';

import 'Profile1.dart';
import 'Profile2.dart';
import 'Profile3.dart';
import 'Profile4.dart';
import 'Profile5.dart';
import 'Profile7.dart';
import 'Profile8.dart';
import 'profile6.dart';

class ProfileRoute extends StatefulWidget {
  ProfileRoute({Key key}) : super(key: key);

  @override
  _ProfileRouteState createState() => _ProfileRouteState();
}

class _ProfileRouteState extends State<ProfileRoute> {
  List wrNewComponents = [
    {
      'route': profile1(),
      'title': "Profile 1",
    },
    {
      'route': Profile2(),
      'title': "Profile 2",
    },
    {
      'route': profile3(),
      'title': "Profile 3",
    },
    {
      'route': profile4(),
      'title': "Profile 4",
    },
    {
      'route': Profile5(),
      'title': "Profile 5",
    },
    {
      'route': profile6(),
      'title': "Profile 6",
    },
    {
      'route': profile7(),
      'title': "Profile 7",
    },
    {
      'route': profile8(),
      'title': "Profile 8",
    },
  ];

  // List<Color> _color = [
  //   Color(0xFFF5F9F9),
  //   Color(0xFFFEF4F4),
  //   Color(0xFFFDF9FB),
  //   Color(0xFFF6F5FB),
  // ];
  // List<Color> _iconbgcolor = [
  //   Color(0xFFCDE4E4),
  //   Color(0xFFFCE0DB),
  //   Color(0xFFFBD7ED),
  //   Color(0xFFE8E5F3),
  // ];
  // List<Color> _textcolor = [
  //   Color(0xFF469695),
  //   Color(0xFFFD3627),
  //   Color(0xFFC93F8D),
  //   Color(0xFF3C326F),
  // ];

  // void getletter(String str) {
  //   var sl = str.split(" ").length;
  //   // print("lenth--/--" + sl.toString());
  //   if (sl == 2) {
  //     String fl = str.split(" ").elementAt(0);
  //     String sl = str.split(" ").elementAt(1);
  //     var l = fl[0] + sl[0];
  //     strs = l.toUpperCase();
  //     // print("flsl--/--" + strs);
  //   } else if (sl == 3) {
  //     String fl = str.split(" ").elementAt(0);
  //     String sl = str.split(" ").elementAt(1);
  //     String tl = str.split(" ").elementAt(2);

  //     var l = fl[0] + sl[0] + tl[0];
  //     strs = l.toUpperCase();
  //     // print("flsl--/--" + strs);
  //   } else {
  //     String fl = str.split(" ").elementAt(0);
  //     var l = fl[0];
  //     strs = l.toUpperCase();
  //     // print("flsl--/--" + strs);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(56),
            child: SmartKitAppbar(
              title: "Profile",
            )),
        body: ScreenTypeLayout(
          mobile: appWidget(),
          desktop: webWidget(),
        ));
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
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      wrNewComponents[index]['route']),
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
                  wrNewComponents[index]['title'],
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
