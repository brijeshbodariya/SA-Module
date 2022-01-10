import 'package:flutter/material.dart';

class SwitchTile extends StatefulWidget {
  @override
  _State createState() => new _State();
}

//State is information of the application that can change over time or when some actions are taken.
class _State extends State<SwitchTile> {
  bool _value1 = false;
  bool _value2 = false;
  bool _value3 = true;

  void _onChanged1(bool value) => setState(() => _value1 = value);

  void _onChanged2(bool value) => setState(() => _value2 = value);

  void _onChanged3(bool value) => setState(() => _value3 = value);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Switch',style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,leading: BackButton(
          color: Colors.black
      ),),
      body: SingleChildScrollView(
          child: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              //***********************simple Switch*************************
              new Switch(value: _value1, onChanged: _onChanged1),

              //***********************simple With Text*************************
              new SwitchListTile(
                value: _value2,
                onChanged: _onChanged2,
                title: new Text('Hello World', style: new TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
              ),

              //***********************switch with image*************************
              Switch(
                onChanged: _onChanged3,
                value: _value3,
                activeColor: Colors.white,
                activeTrackColor: Colors.green,
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Colors.red[200],
                activeThumbImage: Image.asset('https://smartkit.wrteam.in/smartkit/images/waiter.png').image,
              )
            ],
          ),
        ),
      )),
    );
  }
}
