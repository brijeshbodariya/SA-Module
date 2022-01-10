import 'dart:math' as math;
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'E_Comm_Edit.dart';

const String name = "name";
const String following = "following";
const String follower = "followers";
const String profile = "image";
const String country = "country";
const String email = "email";
const String phone = "phone";
const String address = "address";
const String city = "city";

class profile6 extends StatefulWidget {
  @override
  _Ecommerce_State createState() => _Ecommerce_State();
}

class _Ecommerce_State extends State<profile6> {
  String record;
  bool loading = true;
  List list;
  Object tag;
  HeroFlightShuttleBuilder flightShuttleBuilder;
  CreateRectTween createRectTween;
  TransitionBuilder placeholderBuilder;

  @override
  Widget build(BuildContext context) {
    // timeDilation = 3.0;

    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter UI Component",style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,leading: BackButton(
            color: Colors.black
        ),),
        body: new ListView(children: <Widget>[
          Stack(children: <Widget>[
            // The containers in the background
            new Column(children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * .35,
                width: double.infinity,
                child: Stack(children: <Widget>[
                  Image(
                    image: CachedNetworkImageProvider("https://smartkit.wrteam.in/smartkit/images/profile2.png"),
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Hero(
                          tag: 'profile',
                          child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 52,
                              child: CircleAvatar(
                                radius: 50.0,
                                backgroundImage: CachedNetworkImageProvider("https://smartkit.wrteam.in/smartkit/images/profile2.png"),
                                // AssetImage("https://smartkit.wrteam.in/smartkit/images/user.jpg"),
                                backgroundColor: Colors.white,
                              )),
                          flightShuttleBuilder: (
                            BuildContext flightContext,
                            Animation<double> animation,
                            HeroFlightDirection flightDirection,
                            BuildContext fromHeroContext,
                            BuildContext toHeroContext,
                          ) {
                            final Hero toHero = toHeroContext.widget;
                            return RotationTransition(
                              turns: animation,
                              child: toHero.child,
                            );
                          }),
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Text("Profile Name", style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: Align(
                            alignment: Alignment.bottomRight,
                            child: GestureDetector(
                              child: ClipOval(
                                  child: Container(
                                      width: 35,
                                      height: 35,
                                      color: Colors.black,
                                      child: Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      ))),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Ecommerce_Edit()),
                                );
                              },
                            )),
                      ),
                    ],
                  )
                ]),
              ),
              generateCard("Name.:", "Jennifer	Mathis"),
              generateCard("Email:", "demo@demo.com"),
              generateCard("Mobile No.:", "545644454"),
              generateCard("Address:", "Bhuj-Kuchhch"),
              generateCard("City:", "Bhuj"),
              generateCard("Country:", "India"),
              myDetailcard("My Orders", "View All Orders"),
              myDetailcard("My Wallets and Cards", "View Details"),
            ])
          ])
        ]));
  }

  @override
  dispose() {
    // timeDilation = 1.0;
    super.dispose();
  }

  Widget generateCard(String type, String text) {
    return Container(
      width: double.infinity,
      child: Card(
        elevation: 1.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  type,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              new Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  text,
                  style: TextStyle(color: Colors.pink),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget myDetailcard(String type, String text) {
  return Container(
    width: double.infinity,
    child: Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                type,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            new Divider(),
            Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    text,
                    style: TextStyle(color: Colors.pink),
                  ),
                )),
          ],
        ),
      ),
    ),
  );
}

class ValleyQuadraticCurve extends Curve {
  @override
  double transform(double t) {
    assert(t >= 0.0 && t <= 1.0);
    return 4 * math.pow(t - 0.5, 2);
  }
}
