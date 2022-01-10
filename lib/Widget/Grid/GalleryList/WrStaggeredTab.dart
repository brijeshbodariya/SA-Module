import 'package:flutter/material.dart';

import 'GalleryOneColumn.dart';
import 'Gallerythreecolumn.dart';
import 'GallerytowColumn.dart';

class WrGalleryTab extends StatefulWidget {
  WrGalleryTab({Key key}) : super(key: key);

  @override
  WrGalleryTabState createState() => WrGalleryTabState();
}

class WrGalleryTabState extends State<WrGalleryTab> with SingleTickerProviderStateMixin {
  TabController _controller;
  int selectedIndex = 0;

  List<Widget> list = [
    Tab(
      text: "One",
    ),
    Tab(
      text: "Two",
    ),
    Tab(
      text: "Three",
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
        children: [
          GalleryOneColumn(),
          GalleryTwoColumn(),
          GalleryThreeColumn(),
        ],
      ),
    );
  }
}
