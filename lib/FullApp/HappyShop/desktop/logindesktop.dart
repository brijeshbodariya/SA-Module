import 'package:flutter/material.dart';

class LoginDesktop extends StatelessWidget {
  const LoginDesktop({Key key, this.listwidget, this.fromkey}) : super(key: key);
  final List<Widget> listwidget;
  final GlobalKey fromkey;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.width / 10),
      width: MediaQuery.of(context).size.width / 3,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 10.0, bottom: 20),
              child: Form(
                key: fromkey,
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
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
