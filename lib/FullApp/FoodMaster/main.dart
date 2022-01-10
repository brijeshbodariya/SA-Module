import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartkit/FullApp/FoodMaster/desktop/activity/SplashScreenDesktop.dart';
import 'package:smartkit/FullApp/FoodMaster/helper/StringsRes.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/activity/SplashScreenMobile.dart';
import 'package:smartkit/FullApp/FoodMaster/tablet/activity/SplashScreenTablet.dart';

import 'helper/ColorsRes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(FoodMasterMain(sharedPreferences: prefs));
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  });
}

class FoodMasterMain extends StatefulWidget {
  final SharedPreferences sharedPreferences;
  const FoodMasterMain({
    Key key,
    this.sharedPreferences,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return new FoodMasterMainState(sharedPreferences);
  }
}

class FoodMasterMainState extends State<FoodMasterMain> {
  final SharedPreferences _sharedPreferences;
  FoodMasterMainState(this._sharedPreferences);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringsRes.appname,
      theme: ThemeData(
        fontFamily: 'appfont',
        iconTheme: IconThemeData(
          color: ColorsRes.white,
        ),
        accentColor: ColorsRes.appcolor,
        primarySwatch: ColorsRes.appcolor_material,
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
