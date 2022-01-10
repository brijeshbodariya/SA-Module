import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/NewsApp/helper/ButtonClickAnimation.dart';
import 'package:smartkit/FullApp/NewsApp/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/NewsApp/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/NewsApp/helper/StringsRes.dart';
import 'package:smartkit/FullApp/NewsApp/model/NotificationData.dart';

class NotificationList extends StatefulWidget {
  @override
  _NotificationListState createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  List<NotificationData> notificationlist;
  @override
  void initState() {
    super.initState();
    notificationlist = [];
    notificationlist = setNotificationList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DesignConfig.setAppbar(StringsRes.notification),
      body: notificationlistWidget(),
    );
  }

  Widget notificationlistWidget() {
    return ListView.builder(
        padding: EdgeInsets.only(left: 10, top: 15, bottom: 15, right: 5),
        itemCount: notificationlist.length,
        itemBuilder: (BuildContext context, int index) {
          NotificationData item = notificationlist[index];
          return ButtonClickAnimation(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 20),
              child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
                CircleAvatar(
                  radius: 25,
                  child: ClipOval(
                    child: CachedNetworkImage(
                        imageUrl: item.userimage,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => CachedNetworkImage(imageUrl: "https://smartkit.wrteam.in/smartkit/newsapp/placeholder.png"),
                        errorWidget: (context, url, error) => CachedNetworkImage(imageUrl: "https://smartkit.wrteam.in/smartkit/newsapp/placeholder.png")),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold)),
                        text: "${item.username}",
                        children: <TextSpan>[
                          TextSpan(
                              text: item.islike
                                  ? "\tliked your article"
                                  : item.isfollow
                                      ? "\tfollowing you"
                                      : "",
                              style: Theme.of(context).textTheme.caption.merge(TextStyle(color: ColorsRes.grey))),
                        ],
                      ),
                    ),
                    Text(
                      "${item.time}",
                      style: Theme.of(context).textTheme.caption.merge(TextStyle(color: ColorsRes.grey)),
                    ),
                  ],
                )),
                item.isfollow
                    ? GestureDetector(
                        onTap: () {},
                        child: CachedNetworkImage(
                          imageUrl: "https://smartkit.wrteam.in/smartkit/newsapp/follow.png",
                          height: MediaQuery.of(context).size.width / 12,
                          width: MediaQuery.of(context).size.width / 12,
                        ))
                    : SizedBox(width: 10),
              ]),
            ),
          );
        });
  }

  List<NotificationData> setNotificationList() {
    List<NotificationData> list = [];
    list.add(new NotificationData(id: 1, username: "Dan Peck", islike: true, isfollow: false, userimage: "https://s.abcnews.com/images/US/hanna-swimmer-mo_hpMain_20200725-163152_2_4x3t_384.jpg", time: "10 minutes ago"));

    list.add(new NotificationData(id: 2, username: "TMZ Staff", isfollow: true, islike: false, userimage: "https://imagez.tmz.com/image/c1/4by3/2020/07/30/c115ad2dc849438a97a0ad3097b416df_md.jpg", time: "2 hours ago"));

    list.add(new NotificationData(
      id: 3,
      username: "Noah Manskar",
      islike: true,
      isfollow: false,
      userimage: "https://nypost.com/wp-content/uploads/sites/2/2021/02/CRYPTO-CURRENCY_TESLA-CLIMATE.jpg?quality=90&strip=all&w=1200",
      time: "1 days ago",
    ));

    list.add(new NotificationData(
      id: 4,
      username: "Michael Rothstein",
      islike: false,
      isfollow: true,
      userimage: "https://a4.espncdn.com/combiner/i?img=%2Fphoto%2F2020%2F0111%2Fr651071_1296x729_16%2D9.jpg",
      time: "2 days ago",
    ));

    return list;
  }
}
