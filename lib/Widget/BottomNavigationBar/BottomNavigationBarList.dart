import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitAppbar.dart';
import 'package:smartkit/SmartkitScreen/Widget/SmartKitbgTile.dart';

import 'AnimationBottomBar.dart';
import 'Bubble_Nav_Bar.dart';
import 'Dot_bar.dart';
import 'IconBottomBar.dart';
import 'ShiftingBottomBar.dart';
import 'SimpalBottomBar.dart';
import 'TitleBottomBar.dart';

class BottomNavigationBarList extends StatefulWidget {
  BottomNavigationBarList({Key key}) : super(key: key);

  @override
  _BottomNavigationBarListState createState() =>
      _BottomNavigationBarListState();
}

class _BottomNavigationBarListState extends State<BottomNavigationBarList> {
  void callback() {
    setState(() {});
  }

  List wrNewComponents = [
    {
      'route': SimpalBottomBar(),
    },
    {
      'route': ShiftingBottomBar(),
    },
    {
      'route': IconBottomBar(),
    },
    {
      'route': DotBar(),
    },
    {
      'route': Bubble_Nav_Bar(),
    },
    {
      'route': FancyTabBar(),
    },
    {
      'route': TitleBottomBar(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: SmartKitAppbar(
          title: "Bottom Navigation Bar",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
            itemCount: wrNewComponents.length,
            itemBuilder: (BuildContext context, int index) {
              return BgTile(
                height: 4.1,
                widgetname: wrNewComponents[index]['route'],
              );
            }),
      ),
    );
  }
}

// Simple //
