import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:smartkit/FullApp/Music/mobile/MusicScreens/MusciSplashMobile.dart';
import 'package:smartkit/FullApp/Music/tablet/MusicScreens/MusciSplashTablet.dart';

import 'Constant.dart';
import 'desktop/MusicScreens/MusciSplashDesktop.dart';

class MusicMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Radio App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Directionality(
        textDirection: direction, // set this property
        child:  ScreenTypeLayout(
          desktop: MusicSplashDesktop(),
          mobile: MusicSplashMobile(),
          tablet: MusicSplashTablet(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
