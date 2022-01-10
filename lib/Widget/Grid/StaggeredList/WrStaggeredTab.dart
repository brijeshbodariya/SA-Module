import 'package:flutter/material.dart';

import 'StaggeredImage.dart';
import 'Staggered_Grid.dart';

class WrStaggeredTab extends StatefulWidget {
  WrStaggeredTab({Key key}) : super(key: key);

  @override
  WrStaggeredTabState createState() => WrStaggeredTabState();
}

class WrStaggeredTabState extends State<WrStaggeredTab> with SingleTickerProviderStateMixin {
  TabController _controller;
  int selectedIndex = 0;

  List<Widget> list = [
    Tab(
      // icon: Icon(Icons.card_travel),
      text: "Image With Text",
    ),
    Tab(
      text: "Image",
    ),
  ];

  @override
  void initState() {
    super.initState();
    // Create TabController for getting the index of current tab
    _controller = TabController(length: list.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        selectedIndex = _controller.index;
      });
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
        children: [
          StraggerdGrid(),
          StaggeredImage(),
        ],
      ),
    );
  }
}
