import 'package:flutter/material.dart';

import '2ColumnGrid.dart';
import '3ColumnGrid.dart';
import '4ColumnGrid.dart';
import 'IconWIthTextGrid.dart';
import 'ImageWithTextGrid.dart';

class WrGridCustTab extends StatefulWidget {
  WrGridCustTab({Key key}) : super(key: key);

  @override
  WrGridCustTabState createState() => WrGridCustTabState();
}

class WrGridCustTabState extends State<WrGridCustTab> with SingleTickerProviderStateMixin {
  TabController _controller;
  int _selectedIndex = 0;

  List<Widget> list = [
    Tab(
      // icon: Icon(Icons.card_travel),
      text: "Two",
    ),
    Tab(
      text: "Three",
    ),
    Tab(
      text: "Four",
    ),
    Tab(
      text: "Icon",
    ),
    Tab(
      text: "Image",
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Create TabController for getting the index of current tab
    _controller = TabController(length: list.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
      print("Selected Index: " + _controller.index.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black //change your color here
            ),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        title: Text("Grid", style: TextStyle(color: Colors.black)),
        bottom: TabBar(
          indicatorColor: Color(0xFFe59999),
          labelColor: Color(0xFFe59999),
          onTap: (index) {
            // Should not used it as it only called when tab options are clicked,
            // not when user swapped
          },
          controller: _controller,
          tabs: list,
        ),
        // title: Text('Tabs Demo'),
      ),
      body: TabBarView(
        controller: _controller,
        children: [ColumnGrid2(), ColumnGrid3(), ColumnGrid4(), IconWithTextGrid(), ImageWithTextGrid()],
      ),
    );
  }
}
