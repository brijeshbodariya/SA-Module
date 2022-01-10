import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/FullApp/HappyShop/Helper/HappyShopColor.dart';

class Button extends StatefulWidget {
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String dropdownValue = 'India';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Flutter UI Component",style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,leading: BackButton(
          color: Colors.black
      ),),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            //***********************Disabled Button*************************
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(15),
                ),
                onPressed: null,
                child: const Text('Disabled Button'),
              ),
            ),

            //***********************Enabled Button*************************
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: happyshopcolor2,
                  // textColor: Colors.white,
                  onPrimary: Colors.blue[100],
                  padding: EdgeInsets.all(15),
                ),
                onPressed: () {
                  _displaySnackBar(context, "Enabled Button Pressed..!");
                },
                child: const Text(
                  'Enabled Button',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            //***********************Cupertino Button*************************
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: CupertinoButton(
                onPressed: () {
                  _displaySnackBar(context, "Cupertino Button Pressed..!");
                },
                color: happyshopcolor3,
                padding: EdgeInsets.all(15),
                child: const Text('Cupertino Button'),
              ),
            ),

            //***********************Rounded Button*************************
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: eStudy2,
                  onPrimary: eStudy3,
                  padding: EdgeInsets.all(15),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25.0)),
                ),
                onPressed: () {
                  _displaySnackBar(context, "Rounded Button Pressed..!");
                },
                child: const Text('Rounded Button', style: TextStyle(color: Colors.white)),
              ),
            ),

            //***********************Outline Button*************************
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: new OutlinedButton(
                style: OutlinedButton.styleFrom(padding: EdgeInsets.all(15), side: BorderSide(color: cryptocolor2), shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))),
                child: new Text("Outline Button", style: TextStyle(color: cryptocolor2)),
                onPressed: () {
                  _displaySnackBar(context, "Outline Button Pressed..!");
                },
              ),
            ),

            //***********************Gradient Button*************************

            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.grey,
                  padding: const EdgeInsets.all(0.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [happyshopcolor2, happyshopcolor3],
                    ),
                  ),
                  padding: const EdgeInsets.all(15.0),
                  child: Text('Gradient Button', style: TextStyle(color: Colors.white)),
                ),
                onPressed: () {
                  _displaySnackBar(context, "Gradient Button Pressed..!");
                },
              ),
            ),

            //***********************Button with text Button*************************
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: new ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: smartkey2,
                  padding: EdgeInsets.all(10),
                ),
                onPressed: () {},
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Icon(
                      Icons.lightbulb_outline,
                      color: Colors.white,
                    ),
                    new Text(
                      'Button with text and icon!',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),

            //***********************Flat Button*************************
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: new TextButton(
                  onPressed: () {
                    _displaySnackBar(context, "Flat Button Pressed..!");
                  },

                  //  disabledColor: Colors.green[100],
                  child: Text(
                    "Flat Button",
                    style: TextStyle(
                      fontSize: 16,
                      color: smartkey3,
                    ),
                  )),
            ),

            //***********************Icon Button*************************
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: new ClipOval(
                child: Container(
                  color: happyshopcolor3,
                  child: new IconButton(
                    icon: Icon(
                      Icons.volume_up,
                      color: Colors.white,
                    ),
                    tooltip: 'Icon Button',
                    onPressed: () {
                      _displaySnackBar(context, "Icon Button Pressed..!");
                    },
                  ),
                ),
              ),
            ),

            //***********************Drop Down Button*************************
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: new Text("Select Country:  "),
                  ),
                  new DropdownButton<String>(
                    value: dropdownValue,
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>['India', 'USA', 'China'].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  _displaySnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
