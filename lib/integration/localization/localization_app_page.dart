import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/Constant/SmartKitFunction.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitHome.dart';
import 'package:smartkit/integration/localization/localization.dart';
import 'language_picker_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LocalizationAppPage extends StatefulWidget {
  @override
  _LocalizationAppPageState createState() => _LocalizationAppPageState();
}

class _LocalizationAppPageState extends State<LocalizationAppPage> {
  var width;
  List wrNewComponents;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    wrNewComponents = [
      {
        'title': AppLocalizations.of(context).language,
      },
      {
        'title': AppLocalizations.of(context).database,
      },
      {
        'title': AppLocalizations.of(context).googlemap,
      },
      {
        'title': AppLocalizations.of(context).youtube,
      },
      {
        'title': AppLocalizations.of(context).simplefirebaseChat,
      },
      {
        'title': AppLocalizations.of(context).firebasedynamicLinking,
      },
      {
        'title': AppLocalizations.of(context).getcurrentlocation,
      },
      {
        'title': AppLocalizations.of(context).pagination,
      },
      {
        'title': AppLocalizations.of(context).readandwritefile,
      },
      {
        'title': AppLocalizations.of(context).getpost,
      },
      {
        'title': AppLocalizations.of(context).localization,
      },
    ];

    return WillPopScope(
      onWillPop: () {
        return Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(),
          ),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(LocalizationDemo.title, style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          leading: BackButton(color: Colors.black),
          centerTitle: true,
          actions: [
            LanguagePickerWidget(),
            SizedBox(width: 12),
          ],
        ),
        body: ScreenTypeLayout(
          mobile: mobileWidget(),
          desktop: desktopWidget(),
        ),
      ),
    );
  }

  Widget mobileWidget() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(
        itemCount: wrNewComponents.length,
        itemBuilder: (BuildContext context, int index) {
          Color bg = tilecolor[index % tilecolor.length];
          Color iconbg = tileiconbgcolor[index % tileiconbgcolor.length];
          Color textcolor = tiletextcolor[index % tiletextcolor.length];
          getletter(wrNewComponents[index]['title']);

          return Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: InkWell(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ontap));
              },
              child: Container(
                width: width / 1,
                height: width / 4.2,
                decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(10.0)),
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
                        color: textcolor,
                      ),
                    ),
                    // trailing: Icon(Icons.arrow_forward_ios, size: width / 20, color: textcolor),
                  ),
                ),
              ),
            ),
            //
            // ListTileUI(
            //   iconTitle: strs,
            //   title: wrNewComponents[index]['title'],
            //   color: bg,
            //   iconbg: iconbg,
            //   textcolor: textcolor,
            //   ontap: wrNewComponents[index]['route'],
            // ),
          );
        },
      ),
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
        return GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            margin: new EdgeInsets.all(6.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                        )),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  wrNewComponents[index]['title'],
                  style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(fontWeight: FontWeight.bold, color: textcolor)),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
