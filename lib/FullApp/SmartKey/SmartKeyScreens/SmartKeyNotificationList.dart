import 'package:flutter/material.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';

class SmartKeyNotificationList extends StatefulWidget {
  SmartKeyNotificationList({Key key}) : super(key: key);

  @override
  _SmartKeyNotificationListState createState() => _SmartKeyNotificationListState();
}

class _SmartKeyNotificationListState extends State<SmartKeyNotificationList> {
  List notifiList = [
    {'title': "Lorem Ipsum", 'message': 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'},
    {'title': "Lorem Ipsum", 'message': 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'},
    {'title': "Lorem Ipsum", 'message': 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'},
    {'title': "Lorem Ipsum", 'message': 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'},
    {'title': "Lorem Ipsum", 'message': 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'}
  ];

  Widget listItem(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: smartkey2,
              child: Text(
                '${index + 1}',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      notifiList[index]['title'],
                      style: TextStyle(fontWeight: FontWeight.bold, color: smartkey2),
                    ),
                    Text(notifiList[index]['message'])
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: smartkeygradient),
          ),
          title: Text("Notification"),
        ),
        body: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: notifiList.length,
            itemBuilder: (BuildContext context, int index) {
              return listItem(index);
            }));
  }
}
