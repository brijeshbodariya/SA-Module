import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'desktop/SmartKeyScreens/SmartKeySplashDesktop.dart';
import 'mobile/SmartKeyScreens/SmartKeySplashMobile.dart';
import 'tablet/SmartKeyScreens/SmartKeySplashTablet.dart';

class SmartKeyMain extends StatelessWidget {
  const SmartKeyMain({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "SmartKey",
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.white),
      ),
      home: ScreenTypeLayout(
        mobile: SmartKeySplashMobile(),
        tablet: SmartKeySplashTablet(),
        desktop: SmartKeySplashDesktop(),
      ),
    );
  }
}
