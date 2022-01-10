import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Helper/polygon_clipper.dart';

class Leaderboard1 extends StatefulWidget {
  @override
  _LeaderState createState() => _LeaderState();
}

class _LeaderState extends State<Leaderboard1> {
  List listCat;
  // bool loading = true;

  @override
  Widget build(BuildContext context) {
    listCat = [
      {"id": "28", "user_id": "76", "name": "Mac", "score": "5300", "rank": 1, "image": "https://smartkit.wrteam.in/smartkit/images/le1.png", "date_created": "27-08-2019 10:08:30"},
      {"id": "27", "user_id": "77", "name": "neque", "score": "5200", "rank": 2, "image": "https://smartkit.wrteam.in/smartkit/images/le2.png", "date_created": "27-08-2019 10:08:22"},
      {"id": "22", "user_id": "75", "name": "Hetal gohil", "score": "5000", "rank": 3, "image": "https://smartkit.wrteam.in/smartkit/images/profile2.png", "date_created": "26-08-2019 09:08:38"},
      {"id": "26", "user_id": "78", "name": " Gravida", "score": "214", "rank": 4, "image": "https://smartkit.wrteam.in/smartkit/images/le4.png", "date_created": "27-08-2019 10:08:12"},
      {"id": "23", "user_id": "74", "name": "Image Cat", "score": "200", "rank": 5, "image": "https://smartkit.wrteam.in/smartkit/images/le5.png", "date_created": "26-08-2019 09:08:45"},
      {"id": "25", "user_id": "79", "name": "porttitor", "score": "200", "rank": 6, "image": "https://smartkit.wrteam.in/smartkit/images/le6.png", "date_created": "27-08-2019 10:08:04"},
      {"id": "20", "user_id": "72", "name": "Test RO", "score": "100", "rank": 7, "image": "https://smartkit.wrteam.in/smartkit/images/le1.png", "date_created": "22-08-2019 11:08:24"},
      {"id": "21", "user_id": "71", "name": "The Path", "score": "100", "rank": 8, "image": "https://smartkit.wrteam.in/smartkit/images/le2.png", "date_created": "22-08-2019 11:08:34"}
    ];
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
          body: SingleChildScrollView(
              child: Column(
        children: <Widget>[
          profile(),
          getrank(),
        ],
      ))),
    );
  }

  Widget profile() {
    return Stack(
      children: <Widget>[
        CachedNetworkImage(
          imageUrl: "https://smartkit.wrteam.in/smartkit/images/l_back.png",
          width: MediaQuery.of(context).size.width,
          height: 300,
          fit: BoxFit.cover,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Text(
              "Leaderboard",
              style: Theme.of(context).textTheme.headline6.copyWith(
                    color: Colors.white,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        firstno(),
        secondno(),
        thirdno()
      ],
    );
  }

  Widget firstno() {
    return Stack(
      children: <Widget>[
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 80),
            child: CachedNetworkImage(
              imageUrl: "https://smartkit.wrteam.in/smartkit/images/first.png",
              width: 101,
              height: 101,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Center(
          child: Container(
              margin: EdgeInsets.only(top: 84.5),
              height: 100,
              width: 100,
              child: ClipPolygon(
                child: Container(
                    child: Center(
                  child: Image(
                    image: CachedNetworkImageProvider(
                      listCat[0]["image"],
                    ),
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                )),
                boxShadows: [
                  PolygonBoxShadow(color: Colors.black, elevation: 5.0),
                ],
                sides: 5,
                borderRadius: 1.0,
              )),
        ),
        Container(
            margin: EdgeInsets.only(top: 168),
            child: Center(
              child: CachedNetworkImage(
                imageUrl: "https://smartkit.wrteam.in/smartkit/images/one.png",
                fit: BoxFit.cover,
                width: 35,
                height: 25,
              ),
            )),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 195.0),
            child: Text(listCat[0]["name"], style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.white)),
          ),
        ),
      ],
    );
  }

  Widget secondno() {
    return Container(
        margin: EdgeInsets.only(right: (MediaQuery.of(context).size.width / 2) + 20),
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 150),
                child: CachedNetworkImage(
                  imageUrl: "https://smartkit.wrteam.in/smartkit/images/first.png",
                  width: 81,
                  height: 81,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Center(
              child: Container(
                  margin: EdgeInsets.only(top: 154.5),
                  height: 80,
                  width: 80,
                  child: ClipPolygon(
                    child: Container(
                        child: Center(
                      child: CachedNetworkImage(
                        imageUrl: listCat[1]["image"],
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    )),
                    boxShadows: [
                      PolygonBoxShadow(color: Colors.black, elevation: 5.0),
                    ],
                    sides: 5,
                    borderRadius: 1.0,
                  )),
            ),
            Container(
                margin: EdgeInsets.only(top: 218),
                child: Center(
                  child: CachedNetworkImage(
                    imageUrl: "https://smartkit.wrteam.in/smartkit/images/two.png",
                    fit: BoxFit.cover,
                    width: 35,
                    height: 25,
                  ),
                )),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 245.0),
                child: Text(listCat[1]["name"], style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.white)),
              ),
            ),
          ],
        ));
  }

  Widget thirdno() {
    return Container(
        margin: EdgeInsets.only(left: (MediaQuery.of(context).size.width / 2) + 20),
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 150),
                child: CachedNetworkImage(
                  imageUrl: "https://smartkit.wrteam.in/smartkit/images/first.png",
                  width: 81,
                  height: 81,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Center(
              child: Container(
                  margin: EdgeInsets.only(top: 154.5),
                  height: 80,
                  width: 80,
                  child: ClipPolygon(
                    child: Container(
                        child: Center(
                      child: Image(
                        image: CachedNetworkImageProvider(listCat[2]["image"]),
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    )),
                    boxShadows: [
                      PolygonBoxShadow(color: Colors.black, elevation: 5.0),
                    ],
                    sides: 5,
                    borderRadius: 1.0,
                  )),
            ),
            Container(
                margin: EdgeInsets.only(top: 218),
                child: Center(
                  child: CachedNetworkImage(
                    imageUrl: "https://smartkit.wrteam.in/smartkit/images/three.png",
                    fit: BoxFit.cover,
                    width: 35,
                    height: 25,
                  ),
                )),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 245.0),
                child: Text(listCat[2]["name"], style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.white)),
              ),
            ),
          ],
        ));
  }

  Widget getrank() {
    Color color;
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: listCat == null ? 0 : listCat.length,
            itemBuilder: (BuildContext context, int index) {
              if (index % 2 == 0) {
                color = Color(0xffcfcfc);
              } else {
                color = Color(0xffebebeb);
              }
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
                              color: color,
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                                leading: Container(child: Text(listCat[index]["rank"].toString())),
                                title: Row(children: <Widget>[
                                  CircleAvatar(backgroundColor: Color(0xff571855), radius: 20, backgroundImage: CachedNetworkImageProvider(listCat[index]["image"])),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Text(
                                      listCat[index]["name"],
                                      style: TextStyle(color: Color(0xff571855), fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ]),
                              ))));
            }));
  }
}
