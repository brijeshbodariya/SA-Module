import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartkit/FullApp/CryptoTech/activity/SplashScreen.dart';
import 'helper/ColorsRes.dart';
import 'helper/StringsRes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) async {
    runApp(new CryptoTechMain());

    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      //statusBarColor: ColorsRes.statusbarcolor,
      statusBarBrightness: Brightness.dark,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  });
}

class CryptoTechMain extends StatelessWidget {
  CryptoTechMain();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringsRes.mainappname,
      theme: ThemeData(
        fontFamily: 'MyFont',
        iconTheme: IconThemeData(
          color: ColorsRes.white,
        ),
        accentColor: ColorsRes.appcolor,
        primarySwatch: ColorsRes.appcolor_material,
        primaryTextTheme: TextTheme(headline6: TextStyle(color: ColorsRes.appcolor)),
      ),
      home: SplashScreen(),
    );
  }
}

//
