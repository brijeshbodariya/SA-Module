import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/Constant/SmartKitFunction.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitAppbar.dart';
import 'package:smartkit/SmartkitScreen/Widget/SmartKitListTile.dart';

import 'Animated_Intro.dart';
import 'Intro_Slider.dart';
import 'Layout_Swiper.dart';
import 'Onbording1/OnboardingScreen1.dart';
import 'Onbording2/OnboardingScreen2.dart';
import 'Onbording3/OnboardingScreen3.dart';
import 'Parrallel_Scroll.dart';

class OnBordingRoute extends StatefulWidget {
  OnBordingRoute({Key key}) : super(key: key);

  @override
  _OnBordingRouteState createState() => _OnBordingRouteState();
}

class _OnBordingRouteState extends State<OnBordingRoute> {
  List wrNewComponents = [
    {
      'route': WrOnboardingScreen1(),
      'title': "Onboarding Screen 1",
    },
    {
      'route': WrOnboardingScreen2(),
      'title': "Onboarding Screen 2",
    },
    {
      'route': Walkthrough(),
      'title': "Onboarding Screen 3",
    },
    {
      'route': Intro_Slider(),
      'title': "Simple IntroSlider",
    },
    {
      'route': Animated_Intro(),
      'title': "Animated IntroSlider",
    },
    {
      'route': peralax(),
      'title': "Peralax Scroll",
    },
    {
      'route': swiper(),
      'title': "Layout Swiper",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(56),
            child: SmartKitAppbar(
              title: "Onboarding",
            )),
        body: ScreenTypeLayout(
          mobile: appWidget(),
          desktop: webWidget(),
        ));
  }

  Widget appWidget() {
    return ListView.builder(
      itemCount: wrNewComponents.length,
      itemBuilder: (BuildContext context, int index) {
        Color bg = tilecolor[index % tilecolor.length];
        Color iconbg = tileiconbgcolor[index % tileiconbgcolor.length];
        Color textcolor = tiletextcolor[index % tiletextcolor.length];
        getletter(wrNewComponents[index]['title']);

        return Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: ListTileUI(
            iconTitle: strs,
            title: wrNewComponents[index]['title'],
            color: bg,
            iconbg: iconbg,
            textcolor: textcolor,
            ontap: wrNewComponents[index]['route'],
          ),
        );
      },
    );
  }

  Widget webWidget() {
    return GridView.count(
      crossAxisCount: 6,
      children: List.generate(wrNewComponents.length, (index) {
        Color bg = tilecolor[index % tilecolor.length];
        Color iconbg = tileiconbgcolor[index % tileiconbgcolor.length];
        Color textcolor = tiletextcolor[index % tiletextcolor.length];
        getletter(wrNewComponents[index]['title']);
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      wrNewComponents[index]['route']),
            );
          },
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
                    style:
                        Theme.of(context).textTheme.headline5.merge(TextStyle(
                              fontWeight: FontWeight.bold,
                              color: textcolor,
                            )),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  wrNewComponents[index]['title'],
                  style: Theme.of(context).textTheme.subtitle1.merge(
                      TextStyle(fontWeight: FontWeight.bold, color: textcolor)),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
