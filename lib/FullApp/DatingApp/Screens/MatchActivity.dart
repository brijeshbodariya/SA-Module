import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit/FullApp/DatingApp/Screens/LoginActivity.dart';
import 'package:smartkit/FullApp/DatingApp/Screens/NotificationActivity.dart';
import 'package:smartkit/FullApp/DatingApp/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/DatingApp/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/DatingApp/helper/StringsRes.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitHome.dart';

class MatchActivity extends StatefulWidget {
  MatchActivity({Key key}) : super(key: key);

  @override
  _MatchActivityState createState() => _MatchActivityState();
}

class _MatchActivityState extends State<MatchActivity> {
  String gender = StringsRes.maleText;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(),
          ),
        );
      },
      child: Scaffold(
        appBar: AppBar(shadowColor: Colors.transparent,backgroundColor: ColorsRes.backgroundColor,leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: ColorsRes.darkColor,), onPressed: (){ Navigator.pop(context);}, ), title: Text(
          StringsRes.matchText,textAlign: TextAlign.left,
          style: TextStyle(color: ColorsRes.darkColor, fontWeight: FontWeight.bold, fontSize: 20,),
        ),centerTitle: true, actions: [
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
    ],),
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
                      SizedBox(
                        height: 35.0,
                      ),
                      Stack(
                          children: [
                            // image set in circle
                            Container(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * .010),
                                child: CircleAvatar(radius: 80, backgroundColor: ColorsRes.backgroundColor, child : Container(child: ClipOval(child: Image.asset("assets/datingapp/profile_f.png", width: 195, height: 195, fit: BoxFit.fill,)),
                                ),
                                )
                            ),
                            Container(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * .35),
                                child: CircleAvatar(radius: 80, backgroundColor: ColorsRes.backgroundColor, child : Container(child: ClipOval(child: Image.asset("assets/datingapp/profile_k.png", width: 195, height: 195, fit: BoxFit.fill,)),
                                ),
                                )
                            ),
                            Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .030, left: MediaQuery.of(context).size.width * .25),
                              child: SvgPicture.asset("assets/datingapp/heart.svg"),
                            ),
                          ]
                      ),
                      SizedBox(
                          height: 60
                      ),
                      Align(alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Text(
                            StringsRes.nowFriendText,textAlign: TextAlign.center,
                            style: TextStyle(color: ColorsRes.gradientTwo, fontWeight: FontWeight.bold, fontSize: 40,),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          //Navigator.pop(context);
                        },
                        child: Container(decoration: DesignConfig.boxDecorationButtonColor(ColorsRes.gradientOne,ColorsRes.gradientTwo, 50),
                            margin: EdgeInsets.only(right: 20, left: 20, top: 60),
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            alignment: Alignment.center,
                            child: Text(StringsRes.sendMessageText,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: ColorsRes.white,
                                ))),
                      ),
                      GestureDetector(
                        onTap: () {
                          //Navigator.pop(context);
                        },
                        child: Container(decoration: DesignConfig.boxDecorationBorderButtonColor(ColorsRes.darkColor, 50),
                            margin: EdgeInsets.only(right: 20, left: 20, top: 20.0),
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            alignment: Alignment.center,
                            child: Text(StringsRes.findNewFriendFriendText,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: ColorsRes.darkColor,
                                ))),
                      ),
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
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginActivity(),
      ),
    );
  }
}
