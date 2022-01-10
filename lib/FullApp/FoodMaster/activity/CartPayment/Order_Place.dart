import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit/FullApp/FoodMaster/helper/ButtonClickAnimation.dart';
import 'package:smartkit/FullApp/FoodMaster/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/FoodMaster/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/FoodMaster/helper/StringsRes.dart';

import '../MainHomePage.dart';

class Order_Place extends StatefulWidget {
  @override
  _Order_Place createState() => _Order_Place();
}

class _Order_Place extends State<Order_Place> {
  @override
  void initState() {
    super.initState();
    imageCache.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsRes.bgcolor,
      body: Stack(children: [
        CachedNetworkImage(
          imageUrl: 'https://smartkit.wrteam.in/smartkit/foodmaster/login_bg.png',
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width,
        ),
        Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .2, left: 60),
          child: SvgPicture.network(
            'https://smartkit.wrteam.in/smartkit/foodmaster/giftimage.svg',
            fit: BoxFit.fill,
            height: 280,
          ),
        ),
        Column(children: [
          Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  StringsRes.OrderPlace,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, fontFamily: "Robot", color: Colors.black),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  StringsRes.OrderSucess,
                  style: TextStyle(fontSize: 20, fontFamily: "Robot", color: Colors.black54),
                )
              ],
            ),
          ),
          ButtonClickAnimation(
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  CupertinoPageRoute(
                      builder: (context) => MainHomePage(
                            from: "pagefrom",
                          )),
                  (Route<dynamic> route) => false);
            },
            child: IntrinsicHeight(
              child: Container(
                padding: EdgeInsets.only(top: 13, bottom: 13),
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                alignment: Alignment.center,
                decoration: DesignConfig.buttonShadow(ColorsRes.appcolor, 30, ColorsRes.appcolor),
                child: Text(
                  StringsRes.btnContinue.toUpperCase(),
                  style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ),
        ]),
      ]),
    );
  }
}
