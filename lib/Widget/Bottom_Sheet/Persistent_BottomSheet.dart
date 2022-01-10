import 'package:flutter/material.dart';

class Persistent_BottomSheet extends StatefulWidget {
  @override
  _Persistent_State createState() => new _Persistent_State();
}

class _Persistent_State extends State<Persistent_BottomSheet> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: _scaffoldKey,
        appBar: new AppBar(
          title: new Text("Persistent Bottom Sheet",style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,leading: BackButton(
            color: Colors.black
        ),),
        body: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Padding(padding: const EdgeInsets.all(10.0), child: Text("Drag Downword to dismiss")),
          new ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              textStyle: TextStyle(
                color: Colors.white,
              ),
              onSurface: Colors.blue[100],
              // splashColor: ,
              padding: EdgeInsets.all(15),
            ),
            onPressed: () {
              _persistentBottomSheet();
            },
            child: const Text('Show Persistent Sheet'),
          )
        ])));
  }

  void _persistentBottomSheet() {
    _scaffoldKey.currentState.showBottomSheet((context) {
      return new Container(
        padding: EdgeInsets.all(20),
        color: Colors.blue,
        // height: 50.0,

        child: Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
          new Icon(Icons.keyboard_arrow_up, color: Colors.white),
          new Text("Talking To Myself", style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white)),
          Spacer(),
          new Icon(
            Icons.pause_circle_outline,
            color: Colors.white,
            size: 40,
          ),
        ]),
      );
    });
  }
}
