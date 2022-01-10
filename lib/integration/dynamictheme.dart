import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/Constant/SmartKitFunction.dart';
import 'package:smartkit/SmartkitScreen/Widget/theme.dart';
import 'package:responsive_builder/responsive_builder.dart';

class DynamicTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier notifier, child) {
          return MaterialApp(debugShowCheckedModeBanner: false, title: 'SmartKit', theme: notifier.darkTheme ? dark : light, home: DynamicThemeView());
        },
      ),
    );
  }
}

class DynamicThemeView extends StatefulWidget {
  DynamicThemeView({Key key}) : super(key: key);

  @override
  _DynamicThemeViewState createState() => _DynamicThemeViewState();
}

class _DynamicThemeViewState extends State<DynamicThemeView> {
  List wrNewComponents = [
    {
      'title': "Firebase Login",
    },
    {
      'title': "Database",
    },
    {
      'title': "Google Map",
    },
    {
      'title': "You Tube",
    },
    {
      'title': "Simple FirebaseChat",
    },
    {
      'title': "Firebase DynamicLinking",
    },
    {
      'title': "Get Current Location",
    },
    {
      'title': "Pagination",
    },
    {
      'title': "ReadAndWriteFile",
    },
    {
      'title': "Get Post",
    },
    {
      'title': "Localization",
    },
  ];

  var width;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Consumer<ThemeNotifier>(
      builder: (context, notifier, child) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: notifier.darkTheme != true ? Brightness.dark : Brightness.light),
        child: Scaffold(
          backgroundColor: notifier.darkTheme != true ? smarKitcolor2 : Colors.black,
          appBar: AppBar(
            title: Consumer<ThemeNotifier>(builder: (context, notifier, child) => Text("Dynamic Theme", style: TextStyle(color: notifier.darkTheme != true ? Colors.black : Colors.white))),
            actions: [
              Consumer<ThemeNotifier>(
                builder: (context, notifier, child) => Switch(
                  activeColor: Theme.of(context).primaryColor,
                  onChanged: (val) {
                    notifier.toggleTheme();
                  },
                  value: notifier.darkTheme,
                ),
              ),
              SizedBox(width: 12),
            ],
          ),
          body: ScreenTypeLayout(
            mobile: mobileWidget(),
            desktop: desktopWidget(),
          ),
          /*body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: wrNewComponents.length,
                itemBuilder: (BuildContext context, int index) {
                  Color bg = tilecolor[index % tilecolor.length];
                  Color iconbg =
                      tileiconbgcolor[index % tileiconbgcolor.length];
                  Color textcolor = tiletextcolor[index % tiletextcolor.length];
                  getletter(wrNewComponents[index]['title']);

                  return Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: InkWell(
                      onTap: () {},
                      child: Consumer<ThemeNotifier>(
                        builder: (context, notifier, child) => Container(
                          width: width / 1,
                          height: width / 4.2,
                          decoration: BoxDecoration(
                              color:
                                  notifier.darkTheme != true ? bg : textcolor,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Center(
                            child: ListTile(
                              leading: Container(
                                child: Center(
                                  child: Text(
                                    "$strs",
                                    style: TextStyle(
                                      fontSize: width / 18,
                                      color: textcolor,
                                    ),
                                  ),
                                ),
                                width: width / 6.5,
                                height: width / 1,
                                decoration: BoxDecoration(
                                  color: iconbg,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              title: Text(
                                "${wrNewComponents[index]['title']}",
                                style: TextStyle(
                                  fontSize: width / 18,
                                  color: notifier.darkTheme != true
                                      ? textcolor
                                      : bg,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )*/
        ),
      ),
    );
  }

  /* @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Consumer<ThemeNotifier>(
      builder: (context, notifier, child) =>
          AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: notifier.darkTheme != true
                ? Brightness.dark
                : Brightness.light),
        child: Scaffold(
          backgroundColor:
              notifier.darkTheme != true ? smarKitcolor2 : Colors.black,
          appBar: AppBar(
            title: Consumer<ThemeNotifier>(
                builder: (context, notifier, child) => Text("Dynamic Theme",
                    style: TextStyle(
                        color: notifier.darkTheme != true
                            ? Colors.black
                            : Colors.white))),
            actions: [
              Consumer<ThemeNotifier>(
                builder: (context, notifier, child) => Switch(
                  activeColor: Theme.of(context).primaryColor,
                  onChanged: (val) {
                    notifier.toggleTheme();
                    print("=====");
                    // var _darkTheme = _prefs.getBool(key) ?? true;
                    print('_DARKTHEME: ${notifier.darkTheme}');
                  },
                  value: notifier.darkTheme,
                ),
              ),
              SizedBox(width: 12),
            ],
          ),
          body: ScreenTypeLayout(
            mobile: mobileWidget(),
            desktop: desktopWidget(),
          ),
        ),
      ),
    );
  }*/

  Widget mobileWidget() {
    return ListView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: wrNewComponents.length,
      itemBuilder: (BuildContext context, int index) {
        Color bg = tilecolor[index % tilecolor.length];
        Color iconbg = tileiconbgcolor[index % tileiconbgcolor.length];
        Color textcolor = tiletextcolor[index % tiletextcolor.length];
        getletter(wrNewComponents[index]['title']);

        return Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: InkWell(
            onTap: () {},
            child: Consumer<ThemeNotifier>(
              builder: (context, notifier, child) => Container(
                width: width / 1,
                height: width / 4.2,
                decoration: BoxDecoration(color: notifier.darkTheme != true ? bg : textcolor, borderRadius: BorderRadius.circular(10.0)),
                child: Center(
                  child: ListTile(
                    leading: Container(
                      child: Center(
                        child: Text(
                          "$strs",
                          style: TextStyle(
                            fontSize: width / 18,
                            color: textcolor,
                          ),
                        ),
                      ),
                      width: width / 6.5,
                      height: width / 1,
                      decoration: BoxDecoration(
                        color: iconbg,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    title: Text(
                      "${wrNewComponents[index]['title']}",
                      style: TextStyle(
                        fontSize: width / 18,
                        color: notifier.darkTheme != true ? textcolor : bg,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget desktopWidget() {
    return GridView.count(
      crossAxisCount: 6,
      children: List.generate(wrNewComponents.length, (index) {
        Color bg = tilecolor[index % tilecolor.length];
        Color iconbg = tileiconbgcolor[index % tileiconbgcolor.length];
        Color textcolor = tiletextcolor[index % tiletextcolor.length];
        getletter(wrNewComponents[index]['title']);

        return Padding(
          padding: EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () {},
            child: Consumer<ThemeNotifier>(
              builder: (context, notifier, child) => Container(
                width: width / 1,
                height: width / 4.2,
                decoration: BoxDecoration(color: notifier.darkTheme != true ? bg : textcolor, borderRadius: BorderRadius.circular(10.0)),
                /*child: Center(
                  child: ListTile(
                    leading: Container(
                      child: Center(
                        child: Text(
                          "$strs",
                          style: TextStyle(
                            fontSize: width / 18,
                            color: textcolor,
                          ),
                        ),
                      ),
                      width: width / 6.5,
                      height: width / 1,
                      decoration: BoxDecoration(
                        color: iconbg,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    title: Text(
                      "${wrNewComponents[index]['title']}",
                      style: TextStyle(
                        fontSize: width / 18,
                        color: notifier.darkTheme != true ? textcolor : bg,
                      ),
                    ),
                  ),
                ),*/
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: iconbg,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      width: 130,
                      height: 100,
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                      alignment: Alignment.center,
                      child: Text(
                        strs,
                        style: Theme.of(context).textTheme.headline5.merge(TextStyle(
                              fontWeight: FontWeight.bold,
                              color: textcolor,
                              // notifier.darkTheme != true ? textcolor : bg,
                            )),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "${wrNewComponents[index]['title']}",
                      style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(
                            fontWeight: FontWeight.bold,
                            color: notifier.darkTheme != true ? textcolor : bg,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
