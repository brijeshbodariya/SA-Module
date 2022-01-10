import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class profile1 extends StatefulWidget {
  @override
  _profile_socialState createState() => _profile_socialState();
}

class _profile_socialState extends State<profile1> {
  List list;
  bool loading = true;
  bool useMobileLayout;

  @override
  Widget build(BuildContext context) {
    list = [
      {'img': "https://smartkit.wrteam.in/smartkit/images/back6.jpg"},
      {'img': "https://smartkit.wrteam.in/smartkit/images/back7.jpg"},
      {'img': "https://smartkit.wrteam.in/smartkit/images/back3.jpg"},
      {'img': "https://smartkit.wrteam.in/smartkit/images/back1.jpg"},
    ];

    var shortestSide = MediaQuery.of(context).size.shortestSide;

    useMobileLayout = shortestSide < 600;

    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
      topHeader(),
      detailStories(),
    ])));
  }

  Widget topHeader() {
    return Stack(children: <Widget>[
      Container(
        height: MediaQuery.of(context).size.height * .25,
        decoration: BoxDecoration(
          // Box decoration takes a gradient
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: [0.1, 0.6, 0.9],
            colors: [
              Colors.deepOrange[200],
              Colors.red[200],
              Colors.red[300],
            ],
          ),
        ),
      ),
      GestureDetector(
        child: Hero(
            tag: "grid",
            child: Container(
              width: 90,
              height: 120,
              margin: new EdgeInsets.only(top: useMobileLayout ? MediaQuery.of(context).size.height * .15 : MediaQuery.of(context).size.height * .18, right: 20.0, left: 20.0),
              decoration: BoxDecoration(
                color: const Color(0xff7c94b6),
                image: DecorationImage(image: CachedNetworkImageProvider("https://smartkit.wrteam.in/smartkit/images/profile2.png"), fit: BoxFit.cover),
                border: Border.all(
                  color: Colors.white,
                  width: 2.0,
                ),
              ),
            )),
        onTap: () {},
      ),
      Container(
        margin: new EdgeInsets.only(top: useMobileLayout ? MediaQuery.of(context).size.height * .17 : MediaQuery.of(context).size.height * .19, right: 20.0, left: 130.0),
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              "Jan	Kerr",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          Text("Bhuj-Kuchhch", style: TextStyle(fontSize: 13, color: Colors.white))
        ]),
      ),
      Container(
        margin: new EdgeInsets.only(top: MediaQuery.of(context).size.height * .27, right: 20.0, left: 130.0),
        child: Column(children: <Widget>[
          Text(
            "5445",
            style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Text("Followers", style: TextStyle(fontSize: 13, color: Colors.black))
        ]),
      ),
      Container(
        margin: new EdgeInsets.only(top: MediaQuery.of(context).size.height * .27, right: 20.0, left: 210.0),
        child: Column(children: <Widget>[
          Text(
            "54",
            style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Text("Following", style: TextStyle(fontSize: 13, color: Colors.black))
        ]),
      )
    ]);
  }

  Widget detailStories() {
    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      Container(
          margin: new EdgeInsets.only(top: 10, right: 20.0, left: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Photos", style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.black)),
              Text("Show All", style: Theme.of(context).textTheme.caption.copyWith(color: Colors.black)),
            ],
          )),
      new Container(
          height: 165,
          margin: new EdgeInsets.only(top: 10, right: 20.0, left: 20.0),
          child: new ListView.builder(
            shrinkWrap: true,
            itemCount: list.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  Container(
                      width: 120.0,
                      height: 120,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: ClipRRect(
                        borderRadius: new BorderRadius.circular(8.0),
                        child: Image(
                            image: CachedNetworkImageProvider(
                              list[index]["img"],
                            ),
                            fit: BoxFit.cover),
                      )),
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(Icons.favorite_border),
                          Text("20"),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Icon(
                                Icons.comment,
                              )),
                          Text("20"),
                        ],
                      )),
                ],
              );
            },
          )),
      Container(
          margin: new EdgeInsets.only(top: 10, right: 20.0, left: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Stories", style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.black)),
              Text("Show All", style: Theme.of(context).textTheme.caption.copyWith(color: Colors.black)),
            ],
          )),
      new Container(
          height: 250,
          margin: new EdgeInsets.only(top: 10, right: 20.0, left: 20.0, bottom: 10),
          child: new ListView.builder(
            itemCount: list.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  Container(
                      width: 170.0,
                      height: 250,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: ClipRRect(
                        borderRadius: new BorderRadius.circular(8.0),
                        child: Image(
                            image: CachedNetworkImageProvider(
                              list[index]["img"],
                            ),
                            fit: BoxFit.cover),
                      )),
                ],
              );
            },
          ))
    ]);
  }
}
