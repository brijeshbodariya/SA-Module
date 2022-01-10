import 'package:flutter/material.dart';

class Modal_BottomSheet extends StatefulWidget {
  @override
  _Modal_BottomSheetState createState() => new _Modal_BottomSheetState();
}

class _Modal_BottomSheetState extends State<Modal_BottomSheet> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Modal Bottom Sheet",style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,leading: BackButton(
            color: Colors.black
        ),),
        body: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Padding(padding: const EdgeInsets.all(10.0), child: Text("Tap Anywhere to dismiss")),
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
              _settingModalBottomSheet(context);
            },
            child: const Text('Show Modar Sheet'),
          )
        ])));
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(leading: new Icon(Icons.share), title: new Text('Share'), onTap: () => {}),
                new ListTile(
                  leading: new Icon(Icons.add),
                  title: new Text('Add'),
                  onTap: () => {},
                ),
                new ListTile(
                  leading: new Icon(Icons.edit),
                  title: new Text('Edit'),
                  onTap: () => {},
                ),
                new ListTile(
                  leading: new Icon(Icons.delete),
                  title: new Text('Delete'),
                  onTap: () => {},
                ),
                new ListTile(
                  leading: new Icon(Icons.link),
                  title: new Text('Get Link'),
                  onTap: () => {},
                ),
              ],
            ),
          );
        });
  }
}
