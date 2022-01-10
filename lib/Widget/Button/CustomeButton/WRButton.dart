import 'package:flutter/material.dart';

class WRButton extends StatefulWidget {
  final double width;
  final double height;
  final WRShape shape;
  final Color color;
  final VoidCallback onTap;
  final String text;
  final bool border;
  final double fontSize;
  final Color textcolor;
  final FontWeight fontWeight;
  final bool disable;

  WRButton(
      {@required this.width,
      @required this.height,
      this.shape = WRShape.squre,
      this.color,
      @required this.onTap,
      this.text,
      this.border = true,
      this.fontSize,
      this.textcolor,
      this.fontWeight,
      this.disable = true});

  @override
  _WRButtonState createState() => _WRButtonState();
}

class _WRButtonState extends State<WRButton> {
  double btnwidth() {
    double width = widget.width;

    return width;
  }

  double btnheight() {
    double height = widget.height;

    return height;
  }

  BorderRadius btnborderRadius() {
    BorderRadius deco;
    if (widget.shape == WRShape.defalut) {
      deco = BorderRadius.all(Radius.circular(5.0));
    } else if (widget.shape == WRShape.squre) {
      deco = BorderRadius.all(Radius.circular(0.0));
    } else if (widget.shape == WRShape.rounded) {
      deco = BorderRadius.all(Radius.circular(50.0));
    }
    return deco;
  }

  Border btnbroder() {
    Border border;
    if (widget.border == true) {
      if (widget.disable == true) {
        border = Border.all(color: widget.color.withOpacity(0.48));
      } else {
        border = Border.all(color: widget.color);
      }
    }
    return border;
  }

  Color bgcolor() {
    Color bg;
    if (widget.border != true) {
      if (widget.disable != true) {
        bg = widget.color;
      } else {
        bg = widget.color;
      }
    } else {
      bg = Colors.transparent;
    }
    return bg;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: bgcolor(),
      borderRadius: btnborderRadius(),
      child: InkWell(
        borderRadius: btnborderRadius(),
        onTap: widget.disable != true ? widget.onTap : null,
        child: Container(
          alignment: Alignment.center,
          width: btnwidth(),
          height: btnheight(),
          decoration: BoxDecoration(
              borderRadius: btnborderRadius(), border: btnbroder()),
          child: Text(
            widget.text,
            style: TextStyle(
              fontWeight: widget.fontWeight,
              fontSize: widget.fontSize,
              color: widget.disable != true
                  ? widget.textcolor
                  : widget.textcolor.withOpacity(0.30),
            ),
          ),
        ),
      ),
    );
  }
}

enum WRShape {
  /// [WRShape.defalut], used for 5.0 BorderRadius defalut shaped button
  defalut,

  /// [WRShape.squre], used for 0.0 BorderRadius squre shaped button
  squre,

  /// [WRShape.rounded], used for 50.0 BorderRadius for rounded shaped button
  rounded
}
