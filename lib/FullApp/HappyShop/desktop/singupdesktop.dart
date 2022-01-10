import 'package:flutter/material.dart';

class SingupDesktop extends StatelessWidget {
  const SingupDesktop({Key key, this.listwidget, this.fromkey}) : super(key: key);
  final List<Widget> listwidget;
  final GlobalKey fromkey;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.width / 10),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 3,
              padding: EdgeInsets.only(top: 20.0),
              child: Form(
                key: fromkey,
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: listwidget,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
