import 'package:flutter/material.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitAppbar.dart';
import '../Dialog/rflutter_alert.dart';

class Entry_Dialog extends StatefulWidget {
  @override
  _Entry_DialogState createState() => _Entry_DialogState();
}

class _Entry_DialogState extends State<Entry_Dialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: SmartKitAppbar(
            title: "Detail Dialog",
          )),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.redAccent[100],
                  onPrimary: Colors.redAccent[200],
                  padding: EdgeInsets.all(15),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25.0)),
                ),
                onPressed: () {
                  _showDialog();
                },
                child: const Text('Enter Detail Dialog', style: TextStyle(color: Colors.white))),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.redAccent[100],
                  onPrimary: Colors.redAccent[200],
                  padding: EdgeInsets.all(15),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25.0)),
                ),
                child: Text('Custom Login', style: TextStyle(color: Colors.white)),
                onPressed: () => _onAlertWithCustomImagePressed(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
            contentPadding: EdgeInsets.all(0.0),
            content: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Container(
                  color: Colors.redAccent[100],
                  height: 200,
                  child: Icon(Icons.lock, size: 100, color: Colors.white),
                  alignment: FractionalOffset(0.5, 0.5),
                ),
                Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      decoration: InputDecoration(hintText: 'Enter Your OTP'),
                    )),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey,
                            onPrimary: Colors.redAccent[200],
                            padding: EdgeInsets.all(15),
                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25.0)),
                          ),
                          onPressed: () {
                            //   _displaySnackBar(context, "Rounded Button Pressed..!");
                          },
                          child: const Text('CANCEL', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.redAccent[100],
                            onPrimary: Colors.redAccent[200],
                            padding: EdgeInsets.all(15),
                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25.0)),
                          ),
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true).pop();
                          },
                          child: const Text('OK', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ));
      },
    );
  }
// Alert custom content

  _onAlertWithCustomImagePressed(BuildContext context) {
    Alert(
        context: context,
        title: "LOGIN",
        content: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.account_circle),
                labelText: 'Username',
              ),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                labelText: 'Password',
              ),
            ),
          ],
        ),
        buttons: [
          DialogButton(gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.redAccent[100],
              Colors.redAccent[200],
            ],
          ),
            onPressed: () => Navigator.of(context, rootNavigator: true).pop('dialog'),

            //Navigator.pop(context),
            child: Text(
              "LOGIN",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }
}
