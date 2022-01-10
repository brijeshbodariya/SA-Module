//TicketMessageListActivity

import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/StringsRes.dart';
import 'package:smartkit/FullApp/CryptoTech/model/TicketMessage.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/UIData.dart';
import 'package:smartkit/FullApp/CryptoTech/activity/SupportTicket/SupportTicketListActivity.dart';

List<String> msglistids;

StreamController<String> chatstreamdata;
List<TicketMessage> messages;

class TicketMessageListActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new TicketMessageListState();
  }
}

class TicketMessageListState extends State<TicketMessageListActivity> {
  bool isLoading = false, isloadmore = true;
  int pageno = 1;
  int pageoffset = 0;
  final TextEditingController textEditingController = new TextEditingController();
  ScrollController _scrollController = new ScrollController();
  String myid = "1";
  final _scaffoldKeychat = GlobalKey<ScaffoldState>();
  bool issending = false;
  String lastmsg = "";
  Timer timer;
  double toppadding;
  String ticketid;

  @override
  void initState() {
    super.initState();

    ticketid = selectedticket.id;
    msglistids = [];
    messages = [];
    pageno = 1;
    pageoffset = 0;
    //_getMoreData();

    messages.addAll(UIData.getTicketMessageList());
  }

  Future<bool> onBackPress() {
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    toppadding = kToolbarHeight + 40;

    return Scaffold(
      key: _scaffoldKeychat,
      backgroundColor: ColorsRes.bgcolor,
      body: Stack(children: <Widget>[
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
            child: Column(
              children: <Widget>[
                buildListMessage(),
                buildInput(),
              ],
            ),
          ),
        ),
        buildLoading(),
        Align(
          alignment: Alignment.topLeft,
          child: IntrinsicHeight(
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(StringsRes.supportticket, style: TextStyle(color: ColorsRes.white)),
              leading: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Padding(padding: const EdgeInsets.all(12.0), child: CachedNetworkImage(imageUrl: 'https://smartkit.wrteam.in/smartkit/cryptotech/back_button.png'))),
              actions: [
                selectedticket.status == '1'
                    ? GestureDetector(
                        onTap: () async {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: DesignConfig.roundedrectangleshape,
                                  title: Text(
                                    StringsRes.closeticket,
                                    style: TextStyle(color: ColorsRes.secondgradientcolor, fontWeight: FontWeight.bold),
                                  ),
                                  content: Text(StringsRes.closeticketmsg),
                                  actions: [
                                    FlatButton(
                                      child: Text(
                                        StringsRes.cancel,
                                        style: TextStyle(color: ColorsRes.secondgradientcolor),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    FlatButton(
                                        child: Text(
                                          StringsRes.closeticket,
                                          style: TextStyle(color: ColorsRes.secondgradientcolor),
                                        ),
                                        onPressed: () async {
                                          Navigator.of(context).pop();
                                        })
                                  ],
                                );
                              });
                        },
                        child: Center(
                            child: Card(
                                shape: DesignConfig.SetRoundedBorder(ColorsRes.red, 8),
                                color: ColorsRes.red,
                                child: Text(
                                  "\t${StringsRes.closeticket}\t",
                                  style: TextStyle(color: ColorsRes.white),
                                ))))
                    : Container(),
              ],
            ),
          ),
        )
      ]),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget buildListMessage() {
    return Flexible(
      child: ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemBuilder: (context, index) => buildItem(index, messages[index]),
        itemCount: messages.length,
        reverse: true,
        controller: _scrollController,
      ),
    );
  }

  Widget buildItem(int index, TicketMessage message) {
    if (message.userid == myid) {
      //Own message
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Container(),
          ),
          Flexible(
            flex: 2,
            child: MsgContent(index, message),
          ),
        ],
      );
    } else {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "${message.first_name} ${message.last_name}",
            style: TextStyle(color: ColorsRes.appcolor),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Flexible(
                flex: 2,
                child: MsgContent(index, message),
              ),
              Flexible(
                flex: 1,
                child: Container(),
              ),
            ],
          ),
        ],
      );
    }
  }

  Widget MsgContent(int index, TicketMessage message) {
    return Card(
      elevation: 5.0,
      color: message.userid == myid ? ColorsRes.chatbg : ColorsRes.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        child: Column(
          crossAxisAlignment: message.userid == myid ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: <Widget>[
            IntrinsicWidth(
              child: Text(message.message),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 5),
              child: Text(message.created_on, style: TextStyle(color: ColorsRes.textgrey, fontSize: 10)),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLoading() {
    return Positioned(
      child: isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(ColorsRes.appcolor)),
              ),
              color: Colors.white.withOpacity(0.8),
            )
          : Container(),
    );
  }

  Widget buildInput() {
    return Container(
      child: selectedticket.status == '0'
          ? IntrinsicHeight(
              child: Row(children: [
                Expanded(
                    child: Divider(
                  color: ColorsRes.red,
                  indent: 10,
                )),
                Expanded(
                    child: Text(
                  StringsRes.lblclosed,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: ColorsRes.red, fontWeight: FontWeight.bold),
                )),
                Expanded(
                    child: Divider(
                  color: ColorsRes.red,
                  endIndent: 10,
                )),
              ]),
            )
          : Row(
              children: <Widget>[
                Flexible(
                  child: Container(
                    margin: new EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      style: TextStyle(color: ColorsRes.appcolor, fontSize: 15.0),
                      controller: textEditingController,
                      decoration: InputDecoration.collapsed(
                        hintText: StringsRes.lbl_type_your_message,
                        hintStyle: TextStyle(color: ColorsRes.textgrey),
                      ),
                    ),
                  ),
                ),
                issending
                    ? Container()
                    : Material(
                        child: new Container(
                          margin: new EdgeInsets.symmetric(horizontal: 8.0),
                          child: new IconButton(
                            icon: new Icon(Icons.send),
                            onPressed: () {},
                            color: ColorsRes.appcolor,
                          ),
                        ),
                        color: Colors.white,
                      ),
              ],
            ),
      width: double.infinity,
      height: 50.0,
      decoration: new BoxDecoration(boxShadow: [DesignConfig.boxShadow], border: new Border(top: new BorderSide(color: ColorsRes.grey, width: 0.5)), color: Colors.white),
    );
  }
}
