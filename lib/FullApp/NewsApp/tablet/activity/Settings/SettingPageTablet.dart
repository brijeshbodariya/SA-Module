import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/NewsApp/tablet/helper/ButtonClickAnimation.dart';
import 'package:smartkit/FullApp/NewsApp/tablet/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/NewsApp/tablet/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/NewsApp/tablet/helper/StringsRes.dart';
import 'package:smartkit/FullApp/NewsApp/tablet/helper/VideoView/overlay_handler.dart';
import 'package:provider/provider.dart';
import 'package:smartkit/FullApp/NewsApp/tablet/activity/Settings/AutoPlayMediaTablet.dart';
import 'package:smartkit/FullApp/NewsApp/tablet/activity/Settings/LanguagePageTablet.dart';
import 'package:smartkit/FullApp/NewsApp/tablet/activity/Settings/StartupMediaPageTablet.dart';
import 'package:smartkit/FullApp/NewsApp/tablet/activity/Settings/TextSizePageTablet.dart';

class SettingPageTablet extends StatefulWidget {
  @override
  _SettingPageStateTablet createState() => _SettingPageStateTablet();
}

class _SettingPageStateTablet extends State<SettingPageTablet> {
  bool compactlayout = true;
  bool bgapprefresh = false;
  bool nightmode = false;
  TextStyle settingtextstyle;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    settingtextstyle = Theme.of(context).textTheme.subtitle1.merge(TextStyle(fontWeight: FontWeight.bold, color: ColorsRes.black.withOpacity(0.5)));

    return Consumer<OverlayHandlerProviderTablet>(builder: (context, overlayProvider, _) {
      return Scaffold(
          appBar: DesignConfig.setAppbar(StringsRes.settings),
          body: Container(
            child: ListView(padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8), children: [
              Row(
                children: [
                  Expanded(
                      child: Text(
                    StringsRes.compactlayout,
                    style: settingtextstyle,
                  )),
                  CupertinoSwitch(
                    activeColor: ColorsRes.appcolor,
                    value: compactlayout,
                    onChanged: (newValue) => setState(() => compactlayout = newValue),
                  ),
                ],
              ),
              Divider(
                thickness: 2,
                height: 25,
                color: ColorsRes.grey.withOpacity(0.2),
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    StringsRes.bgappref,
                    style: settingtextstyle,
                  )),
                  CupertinoSwitch(
                    activeColor: ColorsRes.appcolor,
                    value: bgapprefresh,
                    onChanged: (newValue) => setState(() => bgapprefresh = newValue),
                  ),
                ],
              ),
              Divider(
                thickness: 2,
                height: 35,
                color: ColorsRes.grey.withOpacity(0.2),
              ),
              ButtonClickAnimation(
                onTap: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (context) => TextSizePageTablet()));
                },
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      StringsRes.textsize,
                      style: settingtextstyle,
                    )),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: ColorsRes.grey,
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 2,
                height: 35,
                color: ColorsRes.grey.withOpacity(0.2),
              ),
              ButtonClickAnimation(
                onTap: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (context) => LanguagePageTablet()));
                },
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      StringsRes.languages,
                      style: settingtextstyle,
                    )),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: ColorsRes.grey,
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 2,
                height: 35,
                color: ColorsRes.grey.withOpacity(0.2),
              ),
              ButtonClickAnimation(
                onTap: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (context) => AutoPlayMediaTablet()));
                },
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      StringsRes.autoplaymedia,
                      style: settingtextstyle,
                    )),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: ColorsRes.grey,
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 2,
                height: 35,
                color: ColorsRes.grey.withOpacity(0.2),
              ),
              ButtonClickAnimation(
                onTap: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (context) => StartupMediaPageTablet()));
                },
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      StringsRes.startupscreen,
                      style: settingtextstyle,
                    )),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: ColorsRes.grey,
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 2,
                height: 25,
                color: ColorsRes.grey.withOpacity(0.2),
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    StringsRes.nightmode,
                    style: settingtextstyle,
                  )),
                  CupertinoSwitch(
                      activeColor: ColorsRes.appcolor,
                      value: nightmode,
                      onChanged: (newValue) {
                        /* Provider.of<OverlayHandlerProvider>(context, listen: false).setTheme(
                              newValue
                                  ? ColorsRes.darkTheme
                                  : ColorsRes.lightTheme); */
                        setState(() {
                          nightmode = newValue;
                        });
                      }),
                ],
              ),
              Divider(
                thickness: 2,
                height: 25,
                color: ColorsRes.grey.withOpacity(0.2),
              ),
              ButtonClickAnimation(
                onTap: () {},
                child: Text(
                  StringsRes.termsofservices,
                  style: settingtextstyle,
                ),
              )
            ]),
          ));
    });
  }
}
