import 'package:flutter/material.dart';
// ignore: unused_import

class WRButton2 extends StatefulWidget {
  final Text text;
  final Icon icon;
  final Color iconbgcolor;
  final Border iconborder;
  final Border textborder;
  final Color bgcolor;
  final double width;
  final double height;
  final bool roundCorner;

  WRButton2({Key key, this.text, this.icon, this.iconbgcolor, this.iconborder, this.textborder, this.bgcolor, this.width, this.height, this.roundCorner = false}) : super(key: key);

  @override
  _WRButton2State createState() => _WRButton2State();
}

class _WRButton2State extends State<WRButton2> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: widget.roundCorner != true ? BorderRadius.all(Radius.circular(4.0)) : BorderRadius.all(Radius.circular(30.0)),
      child: InkWell(
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: widget.bgcolor,
            borderRadius: widget.roundCorner != true ? BorderRadius.all(Radius.circular(4.0)) : BorderRadius.all(Radius.circular(30.0)),
          ),
          child: Row(
            children: [
              // text//
              Container(
                width: widget.width / 1.4,
                height: widget.height,
                margin: EdgeInsets.only(left: 10.0),
                padding: EdgeInsets.all(15.0),
                child: widget.text,
                decoration: BoxDecoration(
                  color: widget.iconbgcolor,
                  borderRadius: widget.roundCorner != true ? BorderRadius.all(Radius.circular(0.0)) : BorderRadius.all(Radius.circular(30.0)),
                ),
              ),
              widget.icon
            ],
          ),
        ),
      ),
    );
  }
}
