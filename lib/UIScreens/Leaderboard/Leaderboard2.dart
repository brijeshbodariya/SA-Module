import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Leaderboard2 extends StatefulWidget {
  @override
  _LeaderState createState() => _LeaderState();
}

class _LeaderState extends State<Leaderboard2> {
  List listCat;
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    listCat = [
      {"id": "28", "user_id": "76", "name": "Mac", "score": "5300", "rank": 1, "image": "https://smartkit.wrteam.in/smartkit/images/le1.png", "date_created": "27-08-2019 10:08:30"},
      {"id": "27", "user_id": "77", "name": "neque", "score": "5200", "rank": 2, "image": "https://smartkit.wrteam.in/smartkit/images/le2.png", "date_created": "27-08-2019 10:08:22"},
      {"id": "22", "user_id": "75", "name": "Hetal gohil", "score": "5000", "rank": 3, "image": "https://smartkit.wrteam.in/smartkit/images/profile2.png", "date_created": "26-08-2019 09:08:38"},
      {"id": "26", "user_id": "78", "name": " Gravida", "score": "214", "rank": 4, "image": "https://smartkit.wrteam.in/smartkit/imagesmsmartkit.000webhostapp.com/smartkit/images/le4.png", "date_created": "27-08-2019 10:08:12"},
      {
        "id": "23",
        "user_id": "74",
        "name": "Image Cat",
        "score": "200",
        "rank": 5,
        "image": "https://smartkit.wrteam.in/smartkit/imagesmsmartkit.000webhostapp.com/smartkit/imagesmsmartkit.000webhostapp.com/smartkit/images/le5.png",
        "date_created": "26-08-2019 09:08:45"
      },
      {"id": "25", "user_id": "79", "name": "porttitor", "score": "200", "rank": 6, "image": "https://smartkit.wrteam.in/smartkit/images/le6.png", "date_created": "27-08-2019 10:08:04"},
      {"id": "20", "user_id": "72", "name": "Test RO", "score": "100", "rank": 7, "image": "https://smartkit.wrteam.in/smartkit/images/le1.png", "date_created": "22-08-2019 11:08:24"},
      {"id": "21", "user_id": "71", "name": "The Path", "score": "100", "rank": 8, "image": "https://smartkit.wrteam.in/smartkit/images/le2.png", "date_created": "22-08-2019 11:08:34"}
    ];

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
          body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                  //  height: MediaQuery.of(context).size.height,
                  color: Color(0xFFD6D3D3),
                  child: Column(
                    children: <Widget>[
                      profile(),
                      getrank(),
                    ],
                  )))),
    );
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  Widget profile() {
    return Stack(
      children: <Widget>[
        CachedNetworkImage(
          imageUrl: "https://smartkit.wrteam.in/smartkit/images/l_back2.png",
          fit: BoxFit.fill,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Text(
              "Leaderboard",
              style: Theme.of(context).textTheme.headline6.copyWith(
                    color: Colors.white,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
              Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                          width: ((MediaQuery.of(context).size.width / 3) - 40),
                          margin: EdgeInsets.only(top: 120),
                          //right: (MediaQuery.of(context).size.width / 2) + 30),
                          child: Card(
                              margin: EdgeInsets.all(0),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0))),
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                  child: Column(
                                    children: <Widget>[
                                      CircleAvatar(
                                          radius: 30,
                                          backgroundColor: Colors.black26,
                                          child: CircleAvatar(
                                              radius: 29,
                                              backgroundColor: Colors.white,
                                              child: CircleAvatar(
                                                radius: 25,
                                                backgroundColor: Color(0xff571855),
                                                backgroundImage: CachedNetworkImageProvider(listCat[1]["image"]),
                                              ))),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          listCat[1]["name"],
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )
                                    ],
                                  )))),
                      CachedNetworkImage(
                        imageUrl: "https://smartkit.wrteam.in/smartkit/images/ranks_two.png",
                        width: ((MediaQuery.of(context).size.width / 3) - 20),
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 110, left: ((MediaQuery.of(context).size.width) / 3) - 50),
                      child: CachedNetworkImage(
                        imageUrl: "https://smartkit.wrteam.in/smartkit/images/rank2.png",
                        height: 30,
                        width: 30,
                      )),
                ],
              ),
              Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                          width: ((MediaQuery.of(context).size.width / 3) - 40),
                          margin: EdgeInsets.only(top: 110),
                          child: Card(
                              margin: EdgeInsets.all(0),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0))),
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                  child: Column(
                                    children: <Widget>[
                                      CircleAvatar(
                                          radius: 30,
                                          backgroundColor: Colors.black26,
                                          child: CircleAvatar(
                                              radius: 29,
                                              backgroundColor: Colors.white,
                                              child: CircleAvatar(
                                                radius: 25,
                                                backgroundColor: Color(0xff571855),
                                                backgroundImage: CachedNetworkImageProvider(listCat[0]["image"]),
                                              ))),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(listCat[0]["name"]),
                                      )
                                    ],
                                  )))),
                      CachedNetworkImage(imageUrl: "https://smartkit.wrteam.in/smartkit/images/ranks_one.png", width: ((MediaQuery.of(context).size.width / 3) - 20), fit: BoxFit.cover),
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 100, left: (MediaQuery.of(context).size.width) / 3 - 50),
                      child: CachedNetworkImage(
                        imageUrl: "https://smartkit.wrteam.in/smartkit/images/rank1.png",
                        height: 30,
                        width: 30,
                      )),
                ],
              ),
              Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                          width: ((MediaQuery.of(context).size.width / 3) - 40),
                          margin: EdgeInsets.only(top: 132),
                          // left: (MediaQuery.of(context).size.width / 2) + 40),
                          child: Card(
                              margin: EdgeInsets.all(0),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0))),
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                  child: Column(
                                    children: <Widget>[
                                      CircleAvatar(
                                          radius: 30,
                                          backgroundColor: Colors.black26,
                                          child: CircleAvatar(
                                              radius: 29,
                                              backgroundColor: Colors.white,
                                              child: CircleAvatar(
                                                radius: 25,
                                                backgroundColor: Color(0xff571855),
                                                backgroundImage: CachedNetworkImageProvider(listCat[2]["image"]),
                                              ))),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          listCat[2]["name"],
                                          maxLines: 1,
                                        ),
                                      )
                                    ],
                                  )))),
                      CachedNetworkImage(imageUrl: "https://smartkit.wrteam.in/smartkit/images/ranks_three.png", width: ((MediaQuery.of(context).size.width / 3) - 20), fit: BoxFit.cover),
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 120, left: (MediaQuery.of(context).size.width) / 3 - 50),
                      child: CachedNetworkImage(
                        imageUrl: "https://smartkit.wrteam.in/smartkit/images/rank3.png",
                        height: 30,
                        width: 30,
                      )),
                ],
              ),
            ]),
          ),
        ),
      ],
    );
  }

  Widget getrank() {
    return ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: listCat == null ? 0 : listCat.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
              child: listCat == null
                  ? CircularProgressIndicator()
                  : (listCat.isEmpty
                      ? Center(
                          child: Text(
                            "No User Found...",
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        )
                      : Container(
                          margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                          child: Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0), bottomLeft: Radius.circular(25.0), topRight: Radius.circular(10), bottomRight: Radius.circular(10))),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: CircleAvatar(
                                      radius: 17,
                                      backgroundColor: Color(0xff571855),
                                      child: CircleAvatar(
                                        radius: 15,
                                        backgroundColor: Color(0xff571855),
                                        backgroundImage: CachedNetworkImageProvider(listCat[index]["image"]),
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(listCat[index]["rank"].toString(), style: Theme.of(context).textTheme.subtitle1.copyWith(color: Color(0xff571855))),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 18.0),
                                  child: Text(listCat[index]["name"], style: Theme.of(context).textTheme.subtitle2.copyWith(color: Color(0xff571855))),
                                )
                              ],
                            ),
                          ))));
        });
  }
}
