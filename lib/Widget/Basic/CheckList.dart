import 'package:flutter/material.dart';

class Check_List extends StatefulWidget {
  @override
  _Check_ListState createState() => _Check_ListState();
}

class _Check_ListState extends State<Check_List> {
  List<bool> inputs = [];

  @override
  void initState() {
    setState(() {
      for (int i = 0; i < 20; i++) {
        inputs.add(false);
      }
    });
  }

  void ItemChange(bool val, int index) {
    setState(() {
      inputs[index] = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Checked Listview', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
      ),
      body: new ListView.builder(
          itemCount: inputs.length,
          itemBuilder: (BuildContext context, int index) {
            return new Card(
              child: new Container(
                padding: new EdgeInsets.all(10.0),
                child: new Column(
                  children: <Widget>[
                    new CheckboxListTile(
                        value: inputs[index],
                        title: new Text('item $index'),
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (bool val) {
                          ItemChange(val, index);
                        })
                  ],
                ),
              ),
            );
          }),
    );
  }
}
