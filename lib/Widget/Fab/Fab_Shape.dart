import 'package:flutter/material.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/FullApp/HappyShop/Helper/HappyShopColor.dart';

class Fab_Basic extends StatefulWidget {
  @override
  _Fab_BasicState createState() => new _Fab_BasicState();
}

class _Fab_BasicState extends State<Fab_Basic> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  ScrollController controller;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: _scaffoldKey,
        appBar: new AppBar(
          title: new Text("FAB Basic",style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,leading: BackButton(
            color: Colors.black
        ),),
        body: Center(
            child: SingleChildScrollView(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Center(
                  //***********************Fab Mini Button*************************
                  child: FloatingActionButton(
                    backgroundColor: happyshopcolor2,
                    onPressed: () {
                      _displaySnackBar(context, "Fab Mini Pressed..!");
                    },
                    heroTag: null,
                    child: Icon(
                      Icons.add,
                    ),
                    mini: true,
                  ),
                ),
              ),

              //***********************Fab Normal Button*************************
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: FloatingActionButton(
                  backgroundColor: happyshopcolor3,
                  onPressed: () {
                    _displaySnackBar(context, "Fab Normal Pressed..!");
                  },
                  heroTag: null,
                  child: Icon(Icons.message),
                  elevation: 20,
                ),
              ),

              //***********************Fab With Text Button*************************
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: FloatingActionButton.extended(
                      backgroundColor: cryptocolor2,
                      onPressed: () {
                        _displaySnackBar(context, "Fab With Text Pressed..!");
                      },
                      heroTag: null,
                      icon: Icon(Icons.shopping_cart),
                      label: new Text("Add to Cart")),
                ),
              ),

              //***********************Fab Square Button*************************
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: FloatingActionButton(
                  backgroundColor: cryptocolor3,
                  onPressed: () {
                    _displaySnackBar(context, "Fab Square Shape Pressed..!");
                  },
                  child: Icon(
                    Icons.edit,
                  ),
                  shape: RoundedRectangleBorder(),
                ),
              ),

              //***********************Fab Rounded Corner Button*************************
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: FloatingActionButton(
                  backgroundColor: smartkey2,
                  onPressed: () {
                    _displaySnackBar(context, "Fab With Rounded Boarder Pressed..!");
                  },
                  heroTag: null,
                  child: Icon(
                    Icons.navigate_next,
                  ),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                ),
              ),

              //***********************Fab With Boarder Button*************************
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: FloatingActionButton(
                  backgroundColor: smartkey3,
                  onPressed: () {
                    _displaySnackBar(context, "Fab With Boarder Pressed..!");
                  },
                  heroTag: null,
                  child: Icon(
                    Icons.content_copy,
                  ),
                  shape: RoundedRectangleBorder(side: BorderSide(color: smartkey2, width: 3.0)),
                ),
              ),

              //***********************Fab Diamond Button*************************
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: FloatingActionButton(
                  backgroundColor: bookKing2,
                  onPressed: () {
                    _displaySnackBar(context, "Fab Diamond Pressed..!");
                  },
                  heroTag: null,
                  child: Icon(
                    Icons.delete,
                  ),
                  shape: _DiamondBorder(),
                ),
              ),
            ],
          ),
        )));
  }

  @override
  void initState() {
    controller = ScrollController();
    super.initState();
  }

  _displaySnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class _DiamondBorder extends ShapeBorder {
  const _DiamondBorder();

  @override
  EdgeInsetsGeometry get dimensions {
    return const EdgeInsets.only();
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    return Path()
      ..moveTo(rect.left + rect.width / 2.0, rect.top)
      ..lineTo(rect.right, rect.top + rect.height / 2.0)
      ..lineTo(rect.left + rect.width / 2.0, rect.bottom)
      ..lineTo(rect.left, rect.top + rect.height / 2.0)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {}

  // This border doesn't support scaling.
  @override
  ShapeBorder scale(double t) {
    return null;
  }
}
