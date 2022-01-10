import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:smartkit/FullApp/Quotes/desktop/QuotesScreen/QuotesSpalshDesktop.dart';
import 'package:smartkit/FullApp/Quotes/mobile/QuotesScreen/QuotesSpalshMobile.dart';
import 'package:smartkit/FullApp/Quotes/tablet/QuotesScreen/QuotesSpalshTablet.dart';

const String appName = "Quotes";
MaterialColor primary = const MaterialColor(
  0xff6A0FC4,
  const <int, Color>{
    50: const Color(0xff6A0FC4),
    100: const Color(0xff6A0FC4),
    200: const Color(0xff6A0FC4),
    300: const Color(0xff6A0FC4),
    400: const Color(0xff6A0FC4),
    500: const Color(0xff6A0FC4),
    600: const Color(0xff6A0FC4),
    700: const Color(0xff6A0FC4),
    800: const Color(0xff6A0FC4),
    900: const Color(0xff6A0FC4),
  },
);

class QuotesMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Quotes",
      theme: ThemeData(
          primarySwatch: primary,
          fontFamily: 'Open sans',
          textTheme: TextTheme(
              headline6: TextStyle(
            fontWeight: FontWeight.w600,
          ))),
      debugShowCheckedModeBanner: false,
      home:  ScreenTypeLayout(
        desktop: QuotesSplashDesktop(),
        mobile: QuotesSplashMobile(),
        tablet: QuotesSplashTablet(),
      ),
    );
  }
}
