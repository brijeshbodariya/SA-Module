import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String name = "name";
const String following = "following";
const String follower = "followers";
const String profile = "image";
const String country = "country";
const String email = "email";
const String phone = "phone";
const String address = "address";
const String city = "city";

class Ecommerce_Edit extends StatefulWidget {
  @override
  _Ecommerce_State createState() => _Ecommerce_State();
}

class _Ecommerce_State extends State<Ecommerce_Edit> {
  String record;
  bool loading = true;
  List list;
  Object tag;
  HeroFlightShuttleBuilder flightShuttleBuilder;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter UI Component"),
        ),
        body: new ListView(children: <Widget>[
          Stack(children: <Widget>[
            // The containers in the background
            new Column(children: <Widget>[
              profile(),
              generate_Card("Name.:", "Jennifer	Mathis"),
              generate_Card("Email:", "demo@demo.com"),
              generate_Card("Mobile No.:", "545644454"),
              generate_Card("Address:", "Bhuj-Kuchhch"),
              generate_Card("City:", "Bhuj"),
              generate_Card("Country:", "India"),
            ])
          ])
        ]));
  }

  Widget profile() {
    return Container(
      height: MediaQuery.of(context).size.height * .35,
      width: double.infinity,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Hero(
              tag: 'profile',
              child: CachedNetworkImage(
                imageUrl: "https://smartkit.wrteam.in/smartkit/images/user.jpg",
                fit: BoxFit.cover,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .35,
              )),
        ],
      ),
    );
  }

  Widget generate_Card(String type, String text) {
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
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: TextFormField(
                  initialValue: text,
                  // decoration: InputDecoration(hintText: text),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
