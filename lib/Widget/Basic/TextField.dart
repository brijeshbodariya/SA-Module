import 'package:flutter/material.dart';

class Text_Field extends StatefulWidget {
  @override
  _Text_Field_State createState() => new _Text_Field_State();
}

class _Text_Field_State extends State<Text_Field> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: _scaffoldKey,
        appBar: new AppBar(
          title: new Text("Text Fields"),
        ),
        body: SingleChildScrollView(
            child: Center(
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          //***********************simple textfield*************************
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: TextField(
              decoration: InputDecoration(hintText: "Simple TextField"),
            ),
          ),

          //***********************Label textfield*************************
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Label", labelText: "Label TextField"),
            ),
          ),

          //***********************Outline textfield*************************
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Outline", border: OutlineInputBorder()),
            ),
          ),

          //***********************Outline Label textfield*************************
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Outline Label",
                  labelText: "Outline TextField",
                  border: OutlineInputBorder()),
            ),
          ),

          //***********************Outline Filled textfield*************************
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Outline Filled Outline",
                  border: OutlineInputBorder(),
                  fillColor: Colors.grey[300],
                  filled: true),
            ),
          ),

          //***********************Outline Boarder textfield*************************
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Outline",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0)),
              ),
            ),
          ),

          //***********************Icon Prefix textfield*************************
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                hintText: "With Icon Prfix",
                prefixIcon: Icon(Icons.lock),
              ),
            ),
          ),

          //***********************Icon textfield*************************
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Icon Textfield",
                icon: Icon(Icons.person),
              ),
            ),
          ),

          //***********************Icon Suffix textfield*************************
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                hintText: "With Icon Suffix",
                suffixIcon: Icon(Icons.call),
              ),
            ),
          ),
        ]))));
  }
}
