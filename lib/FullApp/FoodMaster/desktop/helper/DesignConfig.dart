import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ColorsRes.dart';

class DesignConfig {
  /* static RoundedRectangleBorder setRoundedBorder(
      Color bordercolor, double bradius) {
    return RoundedRectangleBorder(
        side: new BorderSide(color: bordercolor, width: 1.0),
        borderRadius: BorderRadius.circular(bradius));
  } */

  static RoundedRectangleBorder setRoundedBorder(
      Color bordercolor, double bradius, bool issetside) {
    return RoundedRectangleBorder(
        side: new BorderSide(color: bordercolor, width: issetside ? 1.0 : 0),
        borderRadius: BorderRadius.circular(bradius));
  }

  static BoxDecoration boxDecorationContainer(Color color, double radius) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
    );
  }



  static const BoxShadow boxShadow = const BoxShadow(
    color: Colors.black12,
    offset: Offset(3, 3),
    blurRadius: 5,
  );

  static BoxDecoration buttonShadow(
      Color btncolor, double radius, Color bordercolor) {
    return BoxDecoration(
        color: btncolor,
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
        border: Border.all(color: bordercolor),
        boxShadow: [
          BoxShadow(
            color: btncolor.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 10,
            offset: Offset(0, 3),
          )
        ]);
  }

  static Widget shadowButton(Color btncolor, String btntext, Color textcolor,
      double radius, Color bordercolor) {
    return IntrinsicWidth(
      child: Container(
        padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
        alignment: Alignment.center,
        decoration: buttonShadow(btncolor, radius, bordercolor),
        child: Text(
          btntext,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: textcolor,
          ),
        ),
      ),
    );
  }

  static Widget shadowButtonFullwidgth(Color btncolor, String btntext,
      Color textcolor, double radius, Color bordercolor, BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15),
      alignment: Alignment.center,
      decoration: buttonShadow(btncolor, radius, bordercolor),
      child: Text(
        btntext,
        style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(
              fontWeight: FontWeight.bold,
              color: textcolor,
            )),
      ),
    );
  }

  static setAppbar(String title) {
    return AppBar(
      backgroundColor: ColorsRes.bgcolor,
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(color: ColorsRes.black),
      ),
      brightness: Brightness.light,
      iconTheme: IconThemeData(
        color: ColorsRes.black,
      ),
    );
  }
}
