import 'dart:ui';

import 'package:flutter/material.dart';

class WrGlassMorphism extends StatelessWidget {
  // WrGlassMorphism //
  // WrGlassMorphism have some defalut value is blur = 5.0 ,borderRadius = 16.0,bgcolor = Colors.white,borderwidth = 1.5,

  final double borderRadius, blur, borderwidth, width, height;
  final Widget child;
  final Color bgcolor;

  WrGlassMorphism({
    Key key,
    this.blur = 5.0,
    this.child,
    this.borderRadius = 16.0,
    this.bgcolor = Colors.white,
    this.borderwidth = 1.5,
    this.width,
    this.height,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            width: width,
            height: height,
            child: child,
            decoration: BoxDecoration(color: bgcolor.withOpacity(0.2), borderRadius: BorderRadius.circular(borderRadius), border: Border.all(width: borderwidth, color: bgcolor.withOpacity(0.1))),
          )),
    );
  }
}
