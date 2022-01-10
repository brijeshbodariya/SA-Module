import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:smartkit/FullApp/Vpn/desktop/Screens/VpnSplashDesktop.dart';
import 'package:smartkit/FullApp/Vpn/mobile/Screens/VpnSplashMobile.dart';
import 'package:smartkit/FullApp/Vpn/tablet/Screens/VpnSplashTablet.dart';


class VpnMain extends StatelessWidget {
  const VpnMain({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Vpn",
        theme: ThemeData(
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Colors.white,
          ),
        ),
        home: ScreenTypeLayout(
            desktop: VpnSplashDesktop(),
            mobile: VpnSplashMobile(),
            tablet: VpnSplashTablet(),
        )
    );
  }
}
