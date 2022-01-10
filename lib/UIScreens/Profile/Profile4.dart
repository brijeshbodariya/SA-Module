import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String name = "name";
const String following = "following";
const String follower = "followers";
const String profile = "image";
const String photoes = "posts";
const String email = "email";
const String phone = "phone";
const String city = "city";
const String dob = "dob";

class profile4 extends StatefulWidget {
  @override
  Social4state createState() => Social4state();
}

class Social4state extends State<profile4> {
  String record;
  List list;
  bool loading = true;
  bool useMobileLayout;

  @override
  Widget build(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    useMobileLayout = shortestSide < 600;
    list = [
      {'img': "https://smartkit.wrteam.in/smartkit/images/back6.jpg"},
      {'img': "https://smartkit.wrteam.in/smartkit/images/back7.jpg"},
      {'img': "https://smartkit.wrteam.in/smartkit/images/back3.jpg"},
      {'img': "https://smartkit.wrteam.in/smartkit/images/back1.jpg"},
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter UI Component",style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,leading: BackButton(
            color: Colors.black
        ),),
        body: Column(
          children: <Widget>[
            Stack(children: <Widget>[
              // The containers in the background
              new Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * .35,
                  child: Stack(
                    children: <Widget>[
                      CachedNetworkImage(
                        imageUrl: "https://smartkit.wrteam.in/smartkit/images/shopping.jpg",
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      Opacity(
                          opacity: 0.5,
                          child: Container(
                            decoration: BoxDecoration(
                              // Box decoration takes a gradient
                              gradient: LinearGradient(
                                // Where the linear gradient begins and ends

                                // Add one stop for each color. Stops should increase from 0 to 1
                                stops: [0.3, 0.7],
                                colors: [
                                  Colors.lightBlue[200],
                                  Colors.deepPurple[300],
                                ],
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ]),

              new Container(
                  padding: new EdgeInsets.only(top: MediaQuery.of(context).size.height * .20, right: 20.0, left: 20.0),
                  child: new Container(
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      color: Colors.white,
                      elevation: 4.0,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 100.0),
                            child: Text("Jasmine	Fisher", style: Theme.of(context).textTheme.headline6),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Bhuj - Kuchhch', style: Theme.of(context).textTheme.subtitle2),
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Column(
                                children: <Widget>[
                                  Text("Purchase", style: Theme.of(context).textTheme.subtitle2),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("5", style: Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.red[400], fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Column(
                                children: <Widget>[
                                  Text("Wish", style: Theme.of(context).textTheme.subtitle2),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("2", style: Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.red[400], fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Column(
                                children: <Widget>[
                                  Text("Like", style: Theme.of(context).textTheme.subtitle2),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("4", style: Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.red[400], fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ),
                  )),

              Center(
                child: new Container(
                  child: Card(
                    child: CircleAvatar(
                      maxRadius: 54.0,
                      backgroundImage: CachedNetworkImageProvider("https://smartkit.wrteam.in/smartkit/images/profile2.png"),
                    ),
                    elevation: 25.0,
                    shape: CircleBorder(),
                    clipBehavior: Clip.antiAlias,
                  ),
                  padding: new EdgeInsets.only(
                      //top:useMobileLayout?
                      // MediaQuery.of(context).size.height * .12: MediaQuery.of(context).size.height *12 ,
                      top: useMobileLayout ? MediaQuery.of(context).size.height * .12 : MediaQuery.of(context).size.height * .15,
                      right: 20.0,
                      left: 20.0),
                ),
              ),
            ]),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Collections", style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.black)),
                )),
            Flexible(
                flex: 1,
                child: new ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: list.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      print("list--/--" + list[index]["img"]);
                      return Stack(children: <Widget>[
                        Container(
                            width: 120.0,
                            height: 150,
                            margin: EdgeInsets.all(5),
                            child: ClipRRect(
                                borderRadius: new BorderRadius.circular(8.0),
                                child: Image(
                                    image: CachedNetworkImageProvider(
                                      list[index]["img"],
                                    ),
                                    fit: BoxFit.cover))),
                        Opacity(
                            opacity: 0.5,
                            child: Container(
                              margin: EdgeInsets.all(5),
                              width: 120.0,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                // Box decoration takes a gradient
                                gradient: LinearGradient(
                                  // Where the linear gradient begins and ends
                                  // Add one stop for each color. Stops should increase from 0 to 1
                                  stops: [0.3, 0.7],
                                  colors: [
                                    Colors.lightBlue[200],
                                    Colors.deepPurple[300],
                                  ],
                                ),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                " ${index + 1}",
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                            ],
                          ),
                        )
                      ]);
                    }))
          ],
        ));
  }
}
