import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit/FullApp/DatingApp/Model/Profile_Model.dart';
import 'package:smartkit/FullApp/DatingApp/Screens/DiscoverActivity.dart';
import 'package:smartkit/FullApp/DatingApp/Screens/NotificationActivity.dart';
import 'package:smartkit/FullApp/DatingApp/Screens/UserDetailActivity.dart';
import 'package:smartkit/FullApp/DatingApp/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/DatingApp/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/DatingApp/helper/StringsRes.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitHome.dart';

class HomeActivity extends StatefulWidget {
  HomeActivity({Key key}) : super(key: key);

  @override
  _HomeActivityState createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return /*WillPopScope(
      onWillPop: () {
        return Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => MyHomePage()));
      },
      child:*/ Scaffold(
          appBar: AppBar(shadowColor: Colors.transparent,backgroundColor: ColorsRes.backgroundColor,leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: ColorsRes.darkColor,), onPressed: (){ Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => MyHomePage()));}, ), title: Text(
            StringsRes.discoverText,textAlign: TextAlign.left,
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
        body: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: GridView.count(physics: AlwaysScrollableScrollPhysics(),
                crossAxisCount: 2,
                children: List.generate(profileList.length, (index) {
                  var no = index + 1;
                  return GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child:
                          ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: ShaderMask(
                                shaderCallback: (rect) {
                                  return LinearGradient(
                                    begin: Alignment.center,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Colors.black.withOpacity(0.85)
                                    ],
                                  ).createShader(rect);
                                },
                                blendMode: BlendMode.overlay,
                                child:  Stack(
                                    children: [Image.asset(profileList[index].profile,
                                    fit: BoxFit.cover,
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.width),
                                  Align(alignment: Alignment.bottomLeft,
                                  child: Column(mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Align(alignment: Alignment.bottomLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 10.0, right: 20.0),
                                          child: Text(
                                            profileList[index].name,textAlign: TextAlign.left,
                                            style: TextStyle(color: ColorsRes.white, fontWeight: FontWeight.bold, fontSize: 16,),
                                          ),
                                        ),
                                      ),
                                    Align(alignment: Alignment.bottomLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 10.0, right: 20.0),
                                        child: Text(
                                          profileList[index].location,textAlign: TextAlign.left,
                                          style: TextStyle(color: ColorsRes.white.withOpacity(0.8), fontWeight: FontWeight.bold, fontSize: 12,),
                                        ),
                                      ),
                                    ),
                                    ],
                                  ),

                                ),
                                  ]
                              ),
                            ),
                          ),
                    ),
                    onTap: () {
                      /*Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => UserDetailActivity(
                            id: index,
                          )))*/
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => UserDetailActivity(id: index
                          )));
                    },
                  );
                },)
    )))/*)*/;
  }


  Future<void> navigationPage() async {
    Navigator.pop(context);
  }
}
