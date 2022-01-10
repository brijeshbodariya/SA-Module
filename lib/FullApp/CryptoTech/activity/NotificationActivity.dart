import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/CryptoTech/activity/NotificationDetail.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/RelativeDateFormat.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/StringsRes.dart';
import 'package:smartkit/FullApp/CryptoTech/model/NotificationData.dart';
import 'package:intl/intl.dart';
import 'MainActivity.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/UIData.dart';

final _scaffoldKeynotification = GlobalKey<ScaffoldState>();

NotificationData selectednotification;

class NotificationActivity extends StatefulWidget {
  NotificationActivity();

  @override
  NotificationState createState() => new NotificationState();
}

class NotificationState extends State<NotificationActivity> {
  List<NotificationData> notificaitonlist;

  int notificationoffset = 0;

  bool notificationisloadmore = true, notificationisgettingdata = true, notificationisnodata = false;

  @override
  void dispose() {
    //DesignConfig.SetStatusbarColor(ColorsRes.secondgradientcolor);

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    //DesignConfig.SetStatusbarColor(ColorsRes.firstgradientcolor);
    notificaitonlist = [];

    notificationoffset = 0;
    notificaitonlist = UIData.getNotificationList();
    //LoadNotificationData();
  }

  @override
  Widget build(BuildContext context) {
    double toppadding = kToolbarHeight + 40;
    return Scaffold(
      key: _scaffoldKeynotification,
      backgroundColor: ColorsRes.bgcolor,
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              gradient: DesignConfig.gradient,
            ),
            padding: EdgeInsets.only(top: toppadding),
            child: Container(
              padding: EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                color: ColorsRes.homebgcolor,
                borderRadius: BorderRadius.only(topRight: Radius.circular(18), topLeft: Radius.circular(18)),
              ),
              child: notificationisnodata
                  ? Center(
                      child: Text(
                      StringsRes.no_data_found,
                      style: Theme.of(context).textTheme.subtitle1,
                      textAlign: TextAlign.center,
                    ))
                  : NotificationContent(),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IntrinsicHeight(
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text(StringsRes.notification, style: TextStyle(color: ColorsRes.white)),
                leading: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: CachedNetworkImage(imageUrl: 'https://smartkit.wrteam.in/smartkit/cryptotech/back_button.png'),
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget NotificationContent() {
    return new NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {},
      child: ListView.builder(
          padding: EdgeInsetsDirectional.only(bottom: 5, start: 10, end: 10, top: 12),
          physics: ClampingScrollPhysics(),
          itemCount: notificaitonlist.length,
          itemBuilder: (context, index) {
            NotificationData item = notificaitonlist[index];

            return item == null
                ? Container()
                : GestureDetector(
                    onTap: () {
                      selectednotification = item;
                      unreadnotificaitonids.remove(item.id);
                      setState(() {});
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationDetailActivity()));
                    },
                    child: Card(
                      color: unreadnotificaitonids.contains(item.id) ? ColorsRes.unreadnotification : ColorsRes.cardbggrey,
                      shape: DesignConfig.roundedrectangleshape,
                      margin: EdgeInsets.only(bottom: 10),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 14,
                              //foregroundColor: ColorsRes.white,
                              backgroundColor: colorlist[index % 6],
                              child: Text(
                                item.title.contains(" ") ? "${item.title.split(' ')[0].substring(0, 1).toUpperCase()}${item.title.split(' ')[1].substring(0, 1).toUpperCase()}" : item.title.substring(0, 2).toUpperCase(),
                                style: TextStyle(color: ColorsRes.white, fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(width: 10),
                            Flexible(
                              child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                                Text(
                                  item.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.subtitle2.merge(TextStyle(
                                        color: ColorsRes.firstgradientcolor,
                                      )),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(item.description, maxLines: 2, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.caption.merge(TextStyle(color: ColorsRes.black))),
                                //Text(item.date_created, style: Theme.of(context).textTheme.caption.merge(TextStyle(color: ColorsRes.grey)),),
                                Text(
                                  RelativeDateFormat.format(DateFormat("dd-MM-yyyy hh:mm:ss").parse(item.date_created)),
                                  style: Theme.of(context).textTheme.caption.merge(TextStyle(fontWeight: FontWeight.bold, color: ColorsRes.grey.withOpacity(0.7))),
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
          }),
    );
  }

  List<Color> colorlist = [ColorsRes.cardyellow, ColorsRes.cardpurple, ColorsRes.cardpink, ColorsRes.cardblue, ColorsRes.cardgreen, ColorsRes.cardpich];
}
