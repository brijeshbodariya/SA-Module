import 'package:flutter/material.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitAppbar.dart';
import 'Flutter_Rating_Bar.dart';

class Rating_Dialog extends StatefulWidget {
  @override
  _Rating_DialogState createState() => _Rating_DialogState();
}

class _Rating_DialogState extends State<Rating_Dialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: SmartKitAppbar(
            title: "Rating Dialog",
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
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: AlertDialog(
            title: new Text("Rate Us"),
            content: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Divider(),
                  Container(
                    // width: Med,
                    child: FlutterRatingBar(
                      initialRating: 3,
                      fillColor: Colors.amber,
                      borderColor: Colors.amber.withAlpha(50),
                      allowHalfRating: true,
                      onRatingUpdate: (rating) {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: new TextField(
                      decoration: InputDecoration(border: OutlineInputBorder(), filled: true, hintText: "Write Your Review here..."),
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                    ),
                  )
                ],
              ),
            )),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new TextButton(
                child: new Text("CANCEL"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              new TextButton(
                child: new Text("SUBMIT"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
    // flutter defined function
  }
}
