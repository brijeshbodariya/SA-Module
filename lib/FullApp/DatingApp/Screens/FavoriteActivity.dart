import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit/FullApp/DatingApp/Model/Profile_Model.dart';
import 'package:smartkit/FullApp/DatingApp/Screens/LoginActivity.dart';
import 'package:smartkit/FullApp/DatingApp/Screens/MainActivity.dart';
import 'package:smartkit/FullApp/DatingApp/Screens/NotificationActivity.dart';
import 'package:smartkit/FullApp/DatingApp/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/DatingApp/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/DatingApp/helper/StringsRes.dart';

class FavoriteActivity extends StatefulWidget {
  FavoriteActivity({Key key}) : super(key: key);

  @override
  _FavoriteActivityState createState() => _FavoriteActivityState();
}

class _FavoriteActivityState extends State<FavoriteActivity> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return /*WillPopScope(
        onWillPop: () {
          return Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MainActivity(),
            ),
          );
        },
        child:*/ Scaffold(
            appBar: AppBar(shadowColor: Colors.transparent,backgroundColor: ColorsRes.backgroundColor,leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: ColorsRes.darkColor,), onPressed: (){ Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MainActivity(),
              ),
            );}, ), title: Text(
              StringsRes.favouritesText,textAlign: TextAlign.left,
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
                    children: List.generate(5, (index) {
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
                                  children: [
                                    Image.asset(profileList[index].profile,
                                        fit: BoxFit.cover,
                                        width: MediaQuery.of(context).size.width,
                                        height: MediaQuery.of(context).size.width),
                                      Align(alignment: Alignment.topRight,
                                        child: SvgPicture.asset("assets/datingapp/heart.svg",height: 50,width: 50)
                                            ),
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
                        },
                      );
                    },)
                )))/*)*/;
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
