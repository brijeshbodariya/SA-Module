import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:smartkit/FullApp/eStudy/desktop/Activity/SplashScreenDesktop.dart';
import 'package:smartkit/FullApp/eStudy/mobile/Activity/SplashScreenMobile.dart';
import 'package:smartkit/FullApp/eStudy/tablet/Activity/SplashScreenTablet.dart';

class EStudyMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'eStuddy',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ScreenTypeLayout(
      mobile: SplashScreenMobile(),
      tablet: SplashScreenTablet(),
      desktop: SplashScreenDesktop(),
    ),
    );
  }
}
