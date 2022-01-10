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
const String bio = "bio";
const String dob = "dob";

class Profile2 extends StatefulWidget {
  // Profile2({this.record});

  @override
  _profile_socialState createState() => _profile_socialState();
}

class _profile_socialState extends State<Profile2> {
  bool loading = true;
  List list;
  bool useMobileLayout;

  // Social_Media_2({this.record});

  @override
  Widget build(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;

    useMobileLayout = shortestSide < 600;

    return Scaffold(
        body:
            //  ListView(children: <Widget>[
            Stack(children: <Widget>[
      // The containers in the background
      new Column(children: <Widget>[
        new Hero(
            tag: "WRTeam",
            child: Container(
              height: useMobileLayout ? MediaQuery.of(context).size.height * .35 : MediaQuery.of(context).size.height * .30,
              decoration: BoxDecoration(
                // Box decoration takes a gradient
                gradient: LinearGradient(
                  // Where the linear gradient begins and ends
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  // Add one stop for each color. Stops should increase from 0 to 1
                  stops: [0.1, 0.5, 0.7, 0.9],
                  colors: [
                    Colors.red[300],
                    Colors.red[300],
                    Colors.deepOrange[300],
                    Colors.deepOrange[200],
                  ],
                ),
              ),
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: CachedNetworkImageProvider("https://smartkit.wrteam.in/smartkit/images/profile2.png"),
                      backgroundColor: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Text("Diane	Wilson", style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            )),
      ]),

      Column(
        children: <Widget>[
          new Container(
              padding: new EdgeInsets.only(top: useMobileLayout ? MediaQuery.of(context).size.height * .27 : MediaQuery.of(context).size.height * .25, right: 20.0, left: 20.0),
              child: new Container(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  color: Colors.white,
                  elevation: 4.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          children: <Widget>[
                            Text("Photos", style: Theme.of(context).textTheme.subtitle2),
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
                            Text("Following", style: Theme.of(context).textTheme.subtitle2),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("54", style: Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.red[400], fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          children: <Widget>[
                            Text("Followers", style: Theme.of(context).textTheme.subtitle2),
                            Padding(padding: const EdgeInsets.all(8.0), child: Text("5445", style: Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.red[400], fontWeight: FontWeight.bold))),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )),
          new Container(
              padding: new EdgeInsets.only(top: 20, right: 20.0, left: 20.0),
              child: new Container(
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                      color: Colors.white,
                      elevation: 4.0,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.email,
                                  color: Colors.red[400],
                                ),
                              ),
                              Text(
                                "demo@demo.com",
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.phone,
                                  color: Colors.red[400],
                                ),
                              ),
                              Text(
                                "545644454",
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.cake,
                                  color: Colors.red[400],
                                ),
                              ),
                              Text(
                                "2096-12-31",
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.info_outline,
                                  color: Colors.red[400],
                                ),
                              ),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                ),
                              )),
                            ],
                          ),
                        ],
                      )))),
        ],
      ),

      Center(
        child: new Container(
            padding: new EdgeInsets.only(top: MediaQuery.of(context).size.height * .80, right: 20.0, left: 20.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoButton(
                borderRadius: BorderRadius.circular(100.0),
                child: const Text(
                  'Follow',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.red[400],
                onPressed: () {},
              ),
            )),
      ),
    ])
        // ]
        );
  }
}
