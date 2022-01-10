import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/HappyShop/Helper/HappyShopColor.dart';

class Fab_Extended extends StatefulWidget {
  @override
  _Fab_ExtendedState createState() => new _Fab_ExtendedState();
}

class _Fab_ExtendedState extends State<Fab_Extended> {
  ScrollController _controller;
  String text = "Start Chat";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("FAB Extended",style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,leading: BackButton(
          color: Colors.black
      ),),
      body: new NotificationListener(
          child: ListView.separated(
            itemCount: 100,
            padding: EdgeInsets.all(20.0),
            controller: _controller,
            separatorBuilder: (BuildContext context, int index) => Divider(),
            itemBuilder: (BuildContext context, int index) {
              return Text('Item $index', style: TextStyle(fontSize: 20));
            },
          ),
          onNotification: (scrollNotification) {
            if (scrollNotification is ScrollUpdateNotification) {
              text = "";
              setState(() {});
            } else {
              text = "Start Chat";
              FloatingActionButton.extended(backgroundColor: happyshopcolor2, onPressed: null, icon: Icon(Icons.message), label: new Text(text));
            }
          }),
      floatingActionButton: _getFAB(),
    );
  }

  Widget _getFAB() {
    if (text == "") {
      return FloatingActionButton(backgroundColor: happyshopcolor2, onPressed: null, child: Icon(Icons.message));
    } else {
      return FloatingActionButton.extended(backgroundColor: happyshopcolor3, onPressed: null, icon: Icon(Icons.message), label: new Text(text));
    }
  }

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }
}
