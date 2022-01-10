import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:smartkit/FullApp/DatingApp/Screens/MainActivity.dart';
import 'package:smartkit/FullApp/DatingApp/Screens/NotificationActivity.dart';
import 'package:smartkit/FullApp/DatingApp/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/DatingApp/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/DatingApp/helper/StringsRes.dart';
import 'package:smartkit/FullApp/DatingApp/Model/Search_Model.dart';

class DiscoverActivity extends StatefulWidget {
  DiscoverActivity({Key key}) : super(key: key);

  @override
  _DiscoverActivityState createState() => _DiscoverActivityState();
}

class _DiscoverActivityState extends State<DiscoverActivity> with TickerProviderStateMixin {
  int currentIndex = 0;
  PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          return navigationPage();
        },
        child: Scaffold(backgroundColor: ColorsRes.backgroundColor,
            appBar: AppBar(shadowColor: Colors.transparent,backgroundColor: ColorsRes.backgroundColor,leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: ColorsRes.darkColor,), onPressed: (){ Navigator.pop(context);}, ), title: Text(
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
            bottomNavigationBar: Container(decoration: DesignConfig.boxDecorationContainer(ColorsRes.backgroundColor, 0), child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(onTap:(){Navigator.pop(context);},child: SvgPicture.asset("assets/datingapp/close.svg")),
                GestureDetector(onTap: (){Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => MainActivity(id: 1)));},child: SvgPicture.asset("assets/datingapp/heart.svg")),
                GestureDetector(onTap: (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => MainActivity(id: 2)));
                },child: SvgPicture.asset("assets/datingapp/message.svg"))
              ],
            )),
            body: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap:(){
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0
                          ),
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
                            child: Container(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          searchList[index].image,
                                      ),
                                      fit: BoxFit.cover),
                                ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child:Stack(
                                            children: [
                                              Align(alignment: Alignment.bottomLeft,
                                                child: Column(mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Align(alignment: Alignment.bottomLeft,
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 10.0, right: 20.0),
                                                        child: Text(searchList[index].name,textAlign: TextAlign.left,
                                                          style: TextStyle(color: ColorsRes.white, fontWeight: FontWeight.bold, fontSize: 16,),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(alignment: Alignment.bottomLeft,
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 10.0, right: 20.0, bottom: 10.0),
                                                        child: Text(searchList[index].location,textAlign: TextAlign.left,
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
                        ),
                      );
                    },
                    itemCount: searchList.length,
                    itemWidth: 300.0,
                    //itemHeight: 340.0,
                    layout: SwiperLayout.STACK,
                  )),
                )
            );
  }


  Future<void> navigationPage() async {
    Navigator.pop(context);
  }
}
