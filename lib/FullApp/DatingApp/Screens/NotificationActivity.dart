import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit/FullApp/DatingApp/Model/NotificationPending_Model.dart';
import 'package:smartkit/FullApp/DatingApp/Model/NotificationView_Model.dart';
import 'package:smartkit/FullApp/DatingApp/Screens/LoginActivity.dart';
import 'package:smartkit/FullApp/DatingApp/Screens/MatchActivity.dart';
import 'package:smartkit/FullApp/DatingApp/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/DatingApp/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/DatingApp/helper/StringsRes.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitHome.dart';

class NotificationActivity extends StatefulWidget {
  NotificationActivity({Key key}) : super(key: key);

  @override
  _NotificationActivityState createState() => _NotificationActivityState();
}

class _NotificationActivityState extends State<NotificationActivity> {
  String gender = StringsRes.maleText;
  @override
  void initState() {
    super.initState();
  }

  Widget notificationView() {
    return ListView.separated(separatorBuilder: (BuildContext context, int index) => Divider(),
        padding: EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 10),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: notificationViewList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              margin: EdgeInsets.only(bottom: 5),
              child: ListTile(
                contentPadding: EdgeInsets.all(5),
                leading: new CircleAvatar(
                    radius: 30,
                    child: ClipOval(
                        child: DesignConfig.displayCourseImage(
                            notificationViewList[index].profile, 100.0, 100.0))),
                title: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(notificationViewList[index].name,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: ColorsRes.darkColor,fontWeight: FontWeight.bold)),
                            SizedBox(height: 5),
                            new Text(notificationViewList[index].subTitle,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: ColorsRes.grayColor,
                                  fontWeight: FontWeight.normal,
                                )),
                          ]),
                      Center(
                        child: Text(notificationViewList[index].time, style: TextStyle(fontSize: 14, color: ColorsRes.grayColor,fontWeight: FontWeight.normal,)),
                      )
                    ]),
                onTap: () {},
              ));
        });
  }

  Widget notificationPending() {
    return ListView.separated(separatorBuilder: (BuildContext context, int index) => Divider(),
        padding: EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 10),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: notificationPendingList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              margin: EdgeInsets.only(bottom: 5),
              child: ListTile(
                contentPadding: EdgeInsets.all(5),
                leading: new CircleAvatar(
                    radius: 30,
                    child: ClipOval(
                        child: DesignConfig.displayCourseImage(
                            notificationPendingList[index].profile, 100.0, 100.0))),
                title: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(notificationPendingList[index].name,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: ColorsRes.darkColor,fontWeight: FontWeight.bold)),
                            SizedBox(height: 5),
                            new Text(notificationPendingList[index].subTitle,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: ColorsRes.grayColor,
                                  fontWeight: FontWeight.normal,
                                )),
                          ]),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MatchActivity(),
                              ),
                            );
                          },
                          child: Container(decoration: DesignConfig.boxDecorationButtonColor(ColorsRes.gradientOne,ColorsRes.gradientTwo, 50),
                              padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                              alignment: Alignment.center,
                              child: Text(StringsRes.acceptText,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                    color: ColorsRes.white,
                                  ))),
                        ),
                      )
                    ]),
                onTap: () {},
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return navigationPage();
      },
      child: Scaffold(
        appBar: AppBar(shadowColor: Colors.transparent,backgroundColor: ColorsRes.backgroundColor,leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: ColorsRes.darkColor,), onPressed: (){ Navigator.pop(context);}, ), title: Text(
          StringsRes.notificationsText,textAlign: TextAlign.left,
          style: TextStyle(color: ColorsRes.darkColor, fontWeight: FontWeight.bold, fontSize: 20,),
        ),centerTitle: true, /*actions: [
          IconButton(icon: Icon(Icons.notifications_none),color: ColorsRes.darkColor,onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NotificationActivity(),
              ),
            );
          }),
          GestureDetector(onTap: (){DesignConfig.showFilter(context);},
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Center(
                  child: SvgPicture.asset("assets/datingapp/filter.svg", color: ColorsRes.darkColor,),
                ),
              ))
        ],*/),
        body: Stack(
          children: <Widget>[
            Container(color: ColorsRes.backgroundColor,
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      notificationView(),
                      Align(alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                          child: Text(
                            StringsRes.pendingRequestText,textAlign: TextAlign.left,
                            style: TextStyle(color: ColorsRes.darkColor, fontWeight: FontWeight.bold, fontSize: 20,),
                          ),
                        ),
                      ),
                      notificationPending(),
                      SizedBox(
                        height: 35.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Future<void> navigationPage() async {
    Navigator.pop(context);
  }
}
