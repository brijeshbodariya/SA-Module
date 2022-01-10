import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

const Color blue = Color(0xff0371dc);
const Color lovender = Color(0xffaa54ff);

class Leaderboard4 extends StatefulWidget {
  bool useMobileLayout;

  @override
  _LeaderState createState() => _LeaderState();
}

class _LeaderState extends State<Leaderboard4> {
  List listCat;
  bool loading = true;

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

    var shortestSide = MediaQuery.of(context).size.shortestSide;

// Determine if we should use mobile layout or not, 600 here is
// a common breakpoint for a typical 7-inch tablet.
    widget.useMobileLayout = shortestSide < 600;

    return Scaffold(
        backgroundColor: Color(0xfff4f4f4),
        body: SingleChildScrollView(
            child: Stack(
          children: <Widget>[
            profile(),
            getrank(),
          ],
        )));
  }

  Widget profile() {
    return Stack(
      children: <Widget>[
        CachedNetworkImage(imageUrl: "https://smartkit.wrteam.in/smartkit/images/l_back4.png"),
        Center(
            child: Container(
                margin: EdgeInsets.only(top: widget.useMobileLayout ? 150 : 250),
                child: Card(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Column(
                          children: <Widget>[
                            CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.black26,
                                child: CircleAvatar(
                                    radius: 39,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      radius: 35,
                                      backgroundColor: Color(0xff571855),
                                      backgroundImage: CachedNetworkImageProvider(listCat[0]["image"]),
                                    ))),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Text(
                                listCat[0]["name"],
                                style: TextStyle(color: blue),
                              ),
                            ),
                            Text(
                              listCat[0]["score"],
                              style: TextStyle(color: blue),
                            )
                          ],
                        ))))),
        Center(
            child: Container(
                margin: EdgeInsets.only(top: widget.useMobileLayout ? 165 : 265, right: (MediaQuery.of(context).size.width / 2) + 50),
                child: Stack(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Card(
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
                                      padding: const EdgeInsets.only(top: 15.0),
                                      child: Text(
                                        listCat[1]["name"],
                                        style: TextStyle(color: blue),
                                      ),
                                    ),
                                    Text(
                                      listCat[1]["score"],
                                      style: TextStyle(color: blue),
                                    )
                                  ],
                                )))),
                    Container(
                        margin: EdgeInsets.only(left: 70),
                        child: CachedNetworkImage(
                          imageUrl: "https://smartkit.wrteam.in/smartkit/images/rank2.png",
                          height: 30,
                          width: 30,
                        )),
                  ],
                ))),
        Center(
            child: Container(
                margin: EdgeInsets.only(top: widget.useMobileLayout ? 170 : 270, left: (MediaQuery.of(context).size.width / 2) + 50),
                child: Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Card(
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
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Text(
                                      listCat[2]["name"],
                                      style: TextStyle(color: blue),
                                    ),
                                  ),
                                  Text(
                                    listCat[2]["score"],
                                    style: TextStyle(color: blue),
                                  )
                                ],
                              ))),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                          left: 70,
                        ),
                        child: CachedNetworkImage(
                          imageUrl: "https://smartkit.wrteam.in/smartkit/images/rank3.png",
                          height: 30,
                          width: 30,
                        )),
                  ],
                ))),
        Container(
          margin: EdgeInsets.only(top: widget.useMobileLayout ? 320 : 420),
          height: 3,
          decoration: BoxDecoration(
            // Box decoration takes a gradient
            gradient: LinearGradient(
              // Where the linear gradient begins and ends
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              // Add one stop for each color. Stops should increase from 0 to 1
              stops: [0.3, 0.7],
              colors: [blue, lovender],
            ),
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: widget.useMobileLayout ? 330 : 430),
            decoration: BoxDecoration(
              // Box decoration takes a gradient
              gradient: LinearGradient(
                // Where the linear gradient begins and ends
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                // Add one stop for each color. Stops should increase from 0 to 1
                stops: [0.3, 0.7],
                colors: [blue, lovender],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("Rank", style: TextStyle(color: Colors.white)),
                  Text("Player", style: TextStyle(color: Colors.white)),
                  Text("Points", style: TextStyle(color: Colors.white)),
                ],
              ),
            )),
        Container(
            margin: EdgeInsets.only(top: widget.useMobileLayout ? 140 : 240, left: (MediaQuery.of(context).size.width) / 2 + 35),
            child: CachedNetworkImage(
              imageUrl: "https://smartkit.wrteam.in/smartkit/images/rank1.png",
              height: 30,
              width: 30,
            )),
      ],
    );
  }

  Widget getrank() {
    return MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: Padding(
          padding: EdgeInsets.only(top: widget.useMobileLayout ? 370 : 470),
          child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: listCat == null ? 0 : listCat.length,
              itemBuilder: (BuildContext context, int index) {
                return Center(
                    child: listCat == null
                        ? CircularProgressIndicator()
                        : (listCat.isEmpty
                            ? Center(
                                child: Text(
                                  "No Player Found...",
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Card(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          child: Text(listCat[index]["rank"].toString() + ".", style: TextStyle(color: Color(0xff4a81c0))),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10.0),
                                          child: CircleAvatar(
                                            backgroundColor: Color(0xff4a81c0),
                                            radius: 20,
                                            backgroundImage: CachedNetworkImageProvider(listCat[index]["image"]),
                                          ),
                                        ),
                                        Expanded(
                                            child: Padding(
                                          padding: const EdgeInsets.only(left: 20.0),
                                          child: Text(
                                            listCat[index]["name"],
                                            style: TextStyle(
                                              color: Color(0xff4a81c0),
                                            ),
                                          ),
                                        )),
                                        CachedNetworkImage(
                                          imageUrl: "https://smartkit.wrteam.in/smartkit/images/smallstar.png",
                                          height: 20,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: Text(listCat[index]["score"], style: TextStyle(color: Color(0xff4a81c0))),
                                        )
                                      ],
                                    ),
                                  ),
                                ))));
              }),
        ));
  }
}
