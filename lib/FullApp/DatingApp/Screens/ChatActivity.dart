import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit/FullApp/DatingApp/Model/ChatMessage_Model.dart';
import 'package:smartkit/FullApp/DatingApp/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/DatingApp/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/DatingApp/helper/StringsRes.dart';

class ChatActivity extends StatefulWidget {
  String title, profile;
  ChatActivity({Key key, this.title, this.profile}) : super(key: key);

  @override
  _ChatActivityState createState() => _ChatActivityState();
}

class _ChatActivityState extends State<ChatActivity> {
  String gender = StringsRes.maleText;
  @override
  void initState() {
    super.initState();
  }

  Widget notificationView() {
    return ListView.builder(
      itemCount: chatList.length,
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 10,bottom: 10),
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index){
        return Container(
          padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
          child: chatList[index].messageType == "receiver"?Row(mainAxisAlignment: MainAxisAlignment.center,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 1,
                child: Align(alignment: Alignment.center,
                  child: new CircleAvatar(
                      radius: 20,
                      child: ClipOval(
                          child: DesignConfig.displayCourseImage(
                              widget.profile, 50.0, 50.0))),
                ),
              ),
              Expanded(flex: 3,
                child: Align(
                  alignment: (chatList[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      color: (chatList[index].messageType  == "receiver"?ColorsRes.white:ColorsRes.gradientTwo),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Text(chatList[index].messageContent, style: TextStyle(fontSize: 15, color: ColorsRes.darkColor, fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
              Expanded(flex: 1,
                child: Align(
                  alignment: (chatList[index].messageType == "receiver"?Alignment.bottomLeft:Alignment.bottomRight),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(chatList[index].time, style: TextStyle(fontSize: 10, color: ColorsRes.darkColor),
                    ),
                  ),
                ),
              ),
            ],
          ):
          Row(mainAxisAlignment: MainAxisAlignment.center,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Align(
                  alignment: (chatList[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(chatList[index].time, style: TextStyle(fontSize: 10, color: ColorsRes.darkColor),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: (chatList[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(0),
                        bottomLeft: Radius.circular(10),
                        topRight: Radius.circular(10),),
                      color: (chatList[index].messageType  == "receiver"?ColorsRes.white:ColorsRes.gradientTwo),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Text(chatList[index].messageContent, style: TextStyle(fontSize: 15, color: ColorsRes.white, fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return navigationPage();
      },
      child: Scaffold(
        appBar: AppBar(shadowColor: Colors.transparent,backgroundColor: ColorsRes.backgroundColor,leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: ColorsRes.darkColor,), onPressed: (){ Navigator.pop(context);}, ), title: Row(mainAxisAlignment: MainAxisAlignment.center,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            new CircleAvatar(
                radius: 20,
                child: ClipOval(
                    child: DesignConfig.displayCourseImage(
                        widget.profile, 50.0, 50.0))),
            SizedBox(width: 10),
            Text(
              widget.title,textAlign: TextAlign.center,
              style: TextStyle(color: ColorsRes.darkColor, fontWeight: FontWeight.bold, fontSize: 20,),
            ),
          ],
        ),),
        bottomNavigationBar: Container(decoration: DesignConfig.boxDecorationContainer(ColorsRes.white, 0), child: Row(
          children: [
            Expanded(flex:1,child: SvgPicture.asset("assets/datingapp/attachment.svg")),
            Expanded(flex:3,
              child: TextFormField(
                style: TextStyle(color: ColorsRes.darkColor, fontSize: 15, fontWeight: FontWeight.w500),
                cursorColor: ColorsRes.darkColor,
                decoration: InputDecoration(focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: ColorsRes.white,width: 2),),
                  hintText: StringsRes.writeSomethingHereText,
                  hintStyle: Theme.of(context).textTheme.subtitle2.merge(
                      TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: ColorsRes.darkColor)),
                  //border: InputBorder.none,
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            Expanded(flex:1,child: SvgPicture.asset("assets/datingapp/send.svg"))
          ],
        )),
        body: Stack(
          children: <Widget>[
            Container(color: ColorsRes.backgroundColor,
              width: double.infinity,
              height: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      notificationView(),
                    ],
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
