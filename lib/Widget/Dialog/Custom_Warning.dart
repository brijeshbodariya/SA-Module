import 'package:flutter/material.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitAppbar.dart';

class Custom_Warning extends StatefulWidget {
  @override
  _Custom_WarningState createState() => _Custom_WarningState();
}

class _Custom_WarningState extends State<Custom_Warning> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: SmartKitAppbar(
            title: "Custom Warning",
          )),
      body: Center(
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
            child: const Text('Show Dialog', style: TextStyle(color: Colors.white))),
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
              child: new Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Container(
              color: Colors.redAccent[100],
              height: 200,
              child: Icon(Icons.cloud_off, size: 100, color: Colors.white),
              alignment: FractionalOffset(0.5, 0.5),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: new Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempus sit amet lectus sed tempor."),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent[100],
                    onPrimary: Colors.redAccent[200],
                    padding: EdgeInsets.all(15),
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25.0)),
                  ),
                  onPressed: () {
                    //   _displaySnackBar(context, "Rounded Button Pressed..!");
                  },
                  child: const Text('RETRY', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ])),
        );
      },
    );
  }
}
