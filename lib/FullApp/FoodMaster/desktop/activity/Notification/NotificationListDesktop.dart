import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/FoodMaster/desktop/activity/Notification/NotificationDetailDesktop.dart';
import 'package:smartkit/FullApp/FoodMaster/desktop/helper/ButtonClickAnimation.dart';
import 'package:smartkit/FullApp/FoodMaster/desktop/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/FoodMaster/desktop/helper/Constant.dart';
import 'package:smartkit/FullApp/FoodMaster/desktop/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/FoodMaster/desktop/helper/StringsRes.dart';
import 'package:smartkit/FullApp/FoodMaster/model/NotificationData.dart';

NotificationData selectednotification;
int selectedorderindex;
List<NotificationData> notificationlist;
StreamController<String> notificationstreamdata;

class NotificationListDesktop extends StatefulWidget {
  @override
  _NotificationListStateDesktop createState() => _NotificationListStateDesktop();
}

class _NotificationListStateDesktop extends State<NotificationListDesktop> {
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
    notificationlist = [
      NotificationData(
          id: "1", type: "1", createdAt: "2021-02-18T11:50:31.000000Z", data: Data(title: "test1", body: "Notification 1"), notifiableId: "1", notifiableType: "data", readAt: "2021-02-18T11:50:31.000000Z", updatedAt: "2021-02-18T11:50:31.000000Z"),
      NotificationData(
          id: "2", type: "2", createdAt: "2021-02-18T11:50:31.000000Z", data: Data(title: "test2", body: "Notification 2"), notifiableId: "1", notifiableType: "data", readAt: "2021-02-18T11:50:31.000000Z", updatedAt: "2021-02-18T11:50:31.000000Z"),
      NotificationData(
          id: "3", type: "3", createdAt: "2021-02-18T11:50:31.000000Z", data: Data(title: "test3", body: "Notification 3"), notifiableId: "1", notifiableType: "data", readAt: "2021-02-18T11:50:31.000000Z", updatedAt: "2021-02-18T11:50:31.000000Z")
    ];
    setupChannel();
  }

  void setupChannel() {
    notificationstreamdata = StreamController<String>();
    notificationstreamdata.stream.listen((response) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    if (notificationstreamdata != null && !notificationstreamdata.isClosed) notificationstreamdata.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: DesignConfig.setAppbar(StringsRes.notifications),
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
    return ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 10),
        separatorBuilder: (context, index) => SizedBox(height: 5),
        itemCount: notificationlist.length,
        itemBuilder: (context, index) {
          NotificationData notificationData = notificationlist[index];

          return ButtonClickAnimation(
            onTap: () {
              selectednotification = notificationData;
              selectedorderindex = index;
              Navigator.push(context, CupertinoPageRoute(builder: (context) => NotificationDetailActivityDesktop()));
            },
            child: Card(
              shape: DesignConfig.setRoundedBorder(ColorsRes.appcolor, 8, false),
              margin: EdgeInsets.only(bottom: 10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 14,
                      backgroundColor: ColorsRes.appcolor,
                      child: Text(
                        notificationData.data.title.contains(" ")
                            ? "${notificationData.data.title.split(' ')[0].substring(0, 1).toUpperCase()}${notificationData.data.title.split(' ')[1].substring(0, 1).toUpperCase()}"
                            : notificationData.data.title.substring(0, 2).toUpperCase(),
                        style: TextStyle(color: ColorsRes.white, fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                        Text(
                          notificationData.data.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(notificationData.data.body, maxLines: 2, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.caption.merge(TextStyle(color: ColorsRes.black))),
                        Text(
                          Constant.getFormatparse(notificationData.updatedAt),
                          style: Theme.of(context).textTheme.caption.merge(TextStyle(fontWeight: FontWeight.bold, color: ColorsRes.grey.withOpacity(0.7))),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
