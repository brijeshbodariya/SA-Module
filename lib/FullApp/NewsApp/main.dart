import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:smartkit/FullApp/NewsApp/desktop/activity/SplashScreenDesktop.dart';
import 'package:smartkit/FullApp/NewsApp/desktop/helper/VideoView/overlay_handler.dart';
import 'package:smartkit/FullApp/NewsApp/mobile/activity/SplashScreenMobile.dart';
import 'package:smartkit/FullApp/NewsApp/mobile/helper/VideoView/overlay_handler.dart';
import 'package:smartkit/FullApp/NewsApp/tablet/activity/SplashScreenTablet.dart';
import 'package:smartkit/FullApp/NewsApp/desktop/helper/StringsRes.dart';
import 'package:smartkit/FullApp/NewsApp/desktop/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/NewsApp/tablet/helper/VideoView/overlay_handler.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) async {
    runApp(new NewsApp());
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  });
}

class NewsApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _NewsAppState();
  }
}

class _NewsAppState extends State<NewsApp> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: ChangeNotifierProvider<OverlayHandlerProviderMobile>(
      create: (_) => OverlayHandlerProviderMobile(),
      child: MaterialApp(
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
        home: SplashScreenMobile(),
      ),
    ),
    tablet: ChangeNotifierProvider<OverlayHandlerProviderTablet>(
        create: (_) => OverlayHandlerProviderTablet(),
        child: MaterialApp(
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
            home: SplashScreenTablet(),
        ),
      ),
    desktop: ChangeNotifierProvider<OverlayHandlerProviderDesktop>(
          create: (_) => OverlayHandlerProviderDesktop(),
          child: MaterialApp(
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
              home: SplashScreenDesktop(),
          ),
        ),
    );
  }
}
