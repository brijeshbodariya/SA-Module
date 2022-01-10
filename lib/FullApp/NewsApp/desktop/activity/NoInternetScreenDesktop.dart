import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/NewsApp/desktop/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/NewsApp/desktop/helper/DesignConfig.dart';

class NoInternetScreenDesktop extends StatefulWidget {
  @override
  _NoInternetScreenStateDesktop createState() => _NoInternetScreenStateDesktop();
}

class _NoInternetScreenStateDesktop extends State<NoInternetScreenDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsRes.white,
      body: Column(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.center, children: [
        CachedNetworkImage(imageUrl: "https://smartkit.wrteam.in/smartkit/newsapp/no_internet.png"),
        SizedBox(height: 30),
        Text(
          "No Internet Connection",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold)),
        ),
        SizedBox(height: 10),
        Text(
          "Your internet connection is currently not available please check or try again",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.grey)),
        ),
        Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 15),
          margin: EdgeInsets.only(top: 25, left: 30, right: 30),
          alignment: Alignment.center,
          decoration: DesignConfig.boxDecorationContainerColor(ColorsRes.appcolor, 20),
          child: Text(
            "Try Again",
            style: TextStyle(color: ColorsRes.white, fontWeight: FontWeight.bold),
          ),
        )
      ]),
    );
  }
}
