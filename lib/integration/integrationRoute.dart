import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/Constant/SmartKitFunction.dart';
import 'package:smartkit/SmartkitScreen/Widget/SmartKitListTile.dart';
import 'package:smartkit/integration/dynamictheme.dart';

import 'Database/DatabaseRouteList.dart';
import 'FirebaseChat/ChatLoginPage.dart';
import 'FirebaseDynamicLinks/FirebaseDynamicLinking.dart';
import 'GetCurrentLocation.dart';
import 'GoogleMapPage.dart';
import 'GraphAndCharts/GraphAndChartRout.dart';
import 'HttpGetPostRequestWithUploadingFiles/HttpGetPostRequestWithUploadingFilesMain.dart';
import 'Login/LoginWithEmailPassword.dart';
import 'Pagination/PaginationMain.dart';
import 'PaymentGateway/PaymentGatewayList.dart';
import 'ReadAndWriteFile/ReadAndWriteFileMain.dart';
import 'Shap/ShapeRout.dart';
import 'YouTube/YoutubePage.dart';
import 'animation/animationRoute.dart';
import 'localization/localization.dart';

class IntegrationRoute extends StatefulWidget {
  IntegrationRoute({Key key}) : super(key: key);

  @override
  _IntegrationRouteState createState() => _IntegrationRouteState();
}

class _IntegrationRouteState extends State<IntegrationRoute> {
  List wrNewComponents = [
    {
      'route': LoginWithEmailPassword(),
      'title': "Firebase Login",
    },
    {
      'route': DatabaseRoute(),
      'title': "Database",
    },
    {
      'route': PaymentGatewayList(),
      'title': "Payment Gateway",
    },
    {
      'route': GoogleMapPage(),
      'title': "Google Map",
    },
    {
      'route': YoutubePage(),
      'title': "You Tube",
    },
    {
      'route': ChatLoginPage(),
      'title': "Simple FirebaseChat",
    },
    {
      'route': FirebaseDynamicLinking(),
      'title': "Firebase DynamicLinking",
    },
    {
      'route': GetCurrentLocation(),
      'title': "Get Current Location",
    },
    {
      'route': PaginationMain(),
      'title': "Pagination",
    },
    {
      'route': ReadAndWriteFileMain(),
      'title': "ReadAndWriteFile",
    },
    {
      'route': HttpGetPostRequestWithUploadingFilesMain(),
      'title': "Get Post",
    },
    {
      'route': LocalizationDemo(),
      'title': "Localization",
    },
    {
      'route': DynamicTheme(),
      'title': "Dynamic Theme",
    },
    {
      'route': AnimationRoute(),
      'title': "Animation Route",
    },
    {
      'route': GraphAndChartRout(),
      'title': "GraphAndChart Route",
    },
    {
      'route': ShapeRout(),
      'title': "Shape Route",
    },
  ];

  List webwrNewComponents = [
    {
      'route': LoginWithEmailPassword(),
      'title': "Firebase Login",
    },
/*{
      'route': DatabaseRoute(),
      'title': "Database",
    },
    {
      'route': GoogleMapPage(),
      'title': "Google Map",
    },*/
    {
      'route': YoutubePage(),
      'title': "You Tube",
    },
    {
      'route': ChatLoginPage(),
      'title': "Simple FirebaseChat",
    },
    {
      'route': GetCurrentLocation(),
      'title': "Get Current Location",
    },
    {
      'route': PaginationMain(),
      'title': "Pagination",
    },
    {
      'route': HttpGetPostRequestWithUploadingFilesMain(),
      'title': "Http Get Post",
    },
    {
      'route': LocalizationDemo(),
      'title': "Localization",
    },
    {
      'route': DynamicTheme(),
      'title': "Dynamic Theme",
    },
    {
      'route': AnimationRoute(),
      'title': "Animation Route",
    },
    {
      'route': GraphAndChartRout(),
      'title': "GraphAndChart Route",
    },
    {
      'route': ShapeRout(),
      'title': "Shape Route",
    },
    // AnimationRoute
  ];

//  {
//       'route': AdMobMainPage(),
//       'title': "Ad Mob",
//     },

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: mobileWidget(),
      desktop: webWidget(6),
      tablet: webWidget(4),
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
      ),
    );
  }

  Widget webWidget(int gridlen) {
    return GridView.count(
      crossAxisCount: gridlen,
      children: List.generate(webwrNewComponents.length, (index) {
        Color bg = tilecolor[index % tilecolor.length];
        Color iconbg = tileiconbgcolor[index % tileiconbgcolor.length];
        Color textcolor = tiletextcolor[index % tiletextcolor.length];
        getletter(webwrNewComponents[index]['title']);
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (BuildContext context) => webwrNewComponents[index]['route']),
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
                    style: Theme.of(context).textTheme.headline5.merge(TextStyle(
                          fontWeight: FontWeight.bold,
                          color: textcolor,
                        )),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  webwrNewComponents[index]['title'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
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
