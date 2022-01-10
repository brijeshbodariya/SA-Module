import 'package:flutter/material.dart';
// ignore: unused_import

class WRButton1 extends StatefulWidget {
  final Text text;
  final Icon icon;
  final Color iconbgcolor;
  final Border iconborder;
  final Border textborder;
  final Color bgcolor;
  final bool tlbr;
  final double width;
  final double height;
  final double padding;

  WRButton1({Key key, this.text, this.icon, this.iconbgcolor, this.iconborder, this.textborder, this.bgcolor, this.width, this.height, this.tlbr = false, this.padding}) : super(key: key);

  @override
  _WRButton1State createState() => _WRButton1State();
}

class _WRButton1State extends State<WRButton1> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.bgcolor,
      borderRadius: widget.tlbr != true ? BorderRadius.only(topRight: Radius.circular(20.0), bottomLeft: Radius.circular(20.0)) : BorderRadius.only(topLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
      child: InkWell(
        onTap: () {},
        borderRadius: widget.tlbr != true ? BorderRadius.only(topRight: Radius.circular(20.0), bottomLeft: Radius.circular(20.0)) : BorderRadius.only(topLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
        child: Row(
          children: [
            // icon //
            Container(
                width: widget.width == null ? 50 : widget.width / 2,
                padding: EdgeInsets.all(widget.padding == null ? 0 : widget.padding),
                decoration: BoxDecoration(
                  color: widget.iconbgcolor,
                  border: widget.iconborder,
                  borderRadius: widget.tlbr != true ? BorderRadius.only(topRight: Radius.circular(20.0), bottomLeft: Radius.circular(20.0)) : BorderRadius.only(topLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
                ),
                child: widget.icon),
            // text ///
            Container(
              width: widget.width == null ? 150 : widget.width,
              padding: EdgeInsets.all(widget.padding == null ? 0 : widget.padding),
              child: widget.text,
              decoration: BoxDecoration(
                borderRadius: widget.tlbr != true ? BorderRadius.only(topRight: Radius.circular(20.0), bottomLeft: Radius.circular(20.0)) : BorderRadius.only(topLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
