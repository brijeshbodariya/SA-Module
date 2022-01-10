import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/Constant/SmartKitFunction.dart';
import 'package:smartkit/SmartkitScreen/Widget/SmartKitListTile.dart';
import 'package:smartkit/Widget/Blog/BlogRoute.dart';
import 'package:smartkit/Widget/List/ListRoute.dart';

import 'Basic/BasicRoute.dart';
import 'Blog/BlogRoute.dart';
import 'BottomNavigationBar/BottomBarWithFab.dart';
import 'BottomNavigationBar/BottomNavigationBarList.dart';
import 'Bottom_Sheet/BottomSheetRoute.dart';
import 'Button/ButtonRoute.dart';
import 'CardView/Card_Route.dart';
import 'Chip/ChipRoute.dart';
import 'Dialog/DialogRoute.dart';
import 'E-Commerce Widget/ECommerceRoute.dart';
import 'Fab/Fabroute.dart';
import 'Grid/GridRout.dart';
import 'Image_Slider/Image_Slider.dart';
import 'Material_Search/Material_Route.dart';
import 'Menu/Menu_Route.dart';
import 'Progress_Indicator/ProgressIndicatoreRoute.dart';
import 'Slider/SliderRoute.dart';
import 'Stepper/Stepper_Route.dart';
import 'Tab/TabRoute.dart';
import 'Video/VideoRoute.dart';
import 'Webview/Webview_Route.dart';
import 'Youtube_Player/YoutubePlayer_Route.dart';

class WidgetRoute extends StatefulWidget {
  WidgetRoute({Key key}) : super(key: key);

  @override
  _WidgetRouteState createState() => _WidgetRouteState();
}

class _WidgetRouteState extends State<WidgetRoute> {
  List wrNewComponents = [
    {
      'route': GridRoute(),
      'title': "Grid View",
    },
    {
      'route': BottomNavigationBarList(),
      'title': "Bottom Navigation Bar",
    },
    {
      'route': BottombarWithFab(),
      'title': "BottomBar With Fab",
    },
    {
      'route': ECommerceRoute(),
      'title': "E Commerce",
    },
    {
      'route': BlogRoute(),
      'title': "Blog View",
    },
    {
      'route': WrDialogRoute(),
      'title': "Dilog Widget",
    },
    {
      'route': ChipRoute(),
      'title': "Chip Widget",
    },
    {
      'route': Image_Slider(),
      'title': "Image Slider",
    },
    {
      'route': ListRoute(),
      'title': "List Widget",
    },
    {
      'route': Material_Route(),
      'title': "Material Search Widget",
    },
    {
      'route': Menu_Route(),
      'title': "Menu Widget",
    },
    {
      'route': ProgressIndicatoreRoute(),
      'title': "ProgressBar Widget",
    },
    {
      'route': SliderRoute(),
      'title': "Slider Widget",
    },
    {
      'route': Stepper_Route(),
      'title': "Stepper Widget",
    },
    {
      'route': ButtonRoute(),
      'title': "Button Widget",
    },
    {
      'route': TabRoute(),
      'title': "Tab Widget",
    },
    {
      'route': VideoRoute(),
      'title': "Video Widget",
    },
    {
      'route': Webview_Route(),
      'title': "WebView Widget",
    },
    {
      'route': YoutubePlayer_Route(),
      'title': "YoutubePlayer Widget",
    },
    {
      'route': FabRoute(),
      'title': "Fab Widget",
    },
    {
      'route': BottomSheetRoute(),
      'title': "Bottom Widget",
    },
    {
      'route': BasicRoute(),
      'title': "Basic Widget",
    },
    {
      'route': Card_Route(),
      'title': "Card Widget",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: appWidget(),
      desktop: webWidget(),
    );
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
