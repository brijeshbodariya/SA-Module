import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/FoodMaster/tablet/activity/Notification/NotificationListTablet.dart';
import 'package:smartkit/FullApp/FoodMaster/tablet/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/FoodMaster/tablet/helper/Constant.dart';
import 'package:smartkit/FullApp/FoodMaster/tablet/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/FoodMaster/tablet/helper/StringsRes.dart';

class NotificationDetailActivityTablet extends StatefulWidget {
  @override
  NotificationDetailStateTablet createState() => new NotificationDetailStateTablet();
}

class NotificationDetailStateTablet extends State<NotificationDetailActivityTablet> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsRes.bgcolor,
      appBar: DesignConfig.setAppbar(StringsRes.notifications),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            selectednotification.data.title,
            style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: ColorsRes.appcolor, fontWeight: FontWeight.bold)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(Constant.getFormatparse(selectednotification.updatedAt), style: Theme.of(context).textTheme.caption.merge(TextStyle(color: ColorsRes.grey, fontWeight: FontWeight.w500))),
        ),
        Divider(
          color: ColorsRes.grey,
          indent: 8,
          endIndent: 8,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                selectednotification.data.body,
                style: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: ColorsRes.black)),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
