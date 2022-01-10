import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:smartkit/FullApp/Grobag/desktop/Screen/GrobagSplashDesktop.dart';
import 'package:smartkit/FullApp/Grobag/mobile/Screen/GrobagSplashMobile.dart';
import 'package:smartkit/FullApp/Grobag/tablet/Screen/GrobagSplashTablet.dart';
import 'Helper/GrobagColor.dart';

class GrobagMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Grobag",
      theme: ThemeData(
          primarySwatch: primary_app,
          // cursorColor: primary,
          fontFamily: 'HelveticaNeue',
          textTheme: TextTheme(
              headline6: TextStyle(
            color: primary,
          ))),
      debugShowCheckedModeBanner: false,
      home: ScreenTypeLayout(
        mobile: GrobagSplashMobile(),
        tablet: GrobagSplashTablet(),
        desktop: GrobagSplashDesktop(),
      ),
    );
  }
}
