import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:smartkit/FullApp/FoodMaster/mobile/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/helper/Constant.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/helper/StringsRes.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/helper/flutter_rating_bar.dart';
import 'package:smartkit/FullApp/FoodMaster/model/Review.dart';

class ReviewListMobile extends StatefulWidget {
  final int resid;
  ReviewListMobile({
    Key key,
    this.resid,
  }) : super(key: key);
  @override
  _ReviewListStateMobile createState() => _ReviewListStateMobile();
}

class _ReviewListStateMobile extends State<ReviewListMobile> {
  List<Review> reviewlist = [Review(id: 1, createdAt: "2021-02-18T11:50:31.000000Z", updatedAt: "2021-02-26T12:17:24.000000Z", rating: 5, rateableType: "test", rateableId: 1, userId: 1, username: "Ankita", orderId: 1, comment: "its a good")];
  GlobalKey<ScaffoldState> scaffoldKey;
  bool isloading = true;

  int offset = 0;
  int limit = 10;
  bool isloadmore = true;
  bool ispageLoading = false;

  @override
  void initState() {
    super.initState();
    scaffoldKey = GlobalKey<ScaffoldState>();
    reviewlist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: DesignConfig.setAppbar(StringsRes.reviews),
        body: Column(children: [
          Expanded(child: notificationWidget()),
          Container(
            height: ispageLoading ? 50.0 : 0,
            color: Colors.transparent,
            child: Center(
              child: new CircularProgressIndicator(),
            ),
          ),
        ]));
  }

  Widget notificationWidget() {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (isloadmore && !ispageLoading && scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {}
      },
      child: ListView.separated(
          itemCount: reviewlist.length,
          padding: EdgeInsetsDirectional.only(start: 8, end: 8, top: 10, bottom: 5),
          separatorBuilder: (BuildContext context, int index) => Divider(),
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemBuilder: (BuildContext ctxt, int index) {
            Review item = reviewlist[index];
            return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
              Row(children: <Widget>[
                Expanded(
                    child: Text(
                  "${item.username}",
                  style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.appcolor, fontWeight: FontWeight.bold)),
                )),
                RatingBarIndicator(
                  rating: item.rating,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 14,
                  direction: Axis.horizontal,
                )
              ]),
              Text(
                "${Constant.getFormatparse(item.updatedAt)}",
                style: TextStyle(color: ColorsRes.grey, fontSize: 12),
              ),
              Text(
                "${item.comment}",
              ),
            ]);
          }),
    );
  }
}
