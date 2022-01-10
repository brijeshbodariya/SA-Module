import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Leaderboard_sim extends StatefulWidget {
  @override
  _LeaderState createState() => _LeaderState();
}

class _LeaderState extends State<Leaderboard_sim> {
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

    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          // Add box decoration
          decoration: BoxDecoration(
            // Box decoration takes a gradient
            gradient: LinearGradient(
              // Where the linear gradient begins and ends
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              // Add one stop for each color. Stops should increase from 0 to 1
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                Colors.pink[400],
                Colors.pink[300],
                Colors.indigo[400],
                Colors.indigo[600],
              ],
            ),
          ),
          child: Container(
            child: SingleChildScrollView(
                child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CachedNetworkImage(
                            imageUrl: "https://smartkit.wrteam.in/smartkit/images/trophy.png",
                            width: 80,
                            height: 200,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Leaderboard", style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.white)),
                                Text(
                                  "Month's January",
                                  style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    getrank(),
                  ],
                )
              ],
            )),
          )),
    );
  }

  Widget getrank() {
    Color color;

    return ListView.builder(
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
                            "No User Found...",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        )
                      : Container(
                          color: color,
                          child: ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                              leading: Container(
                                child: Text(listCat[index]["rank"].toString() + ".", style: TextStyle(color: Colors.white)),
                              ),
                              title: Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 20,
                                    backgroundImage: CachedNetworkImageProvider(listCat[index]["image"]),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      listCat[index]["name"],
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              trailing: Text(listCat[index]["score"], style: TextStyle(color: Colors.white))))));
        });
  }
}

class LoadingListPage extends StatelessWidget {
  //**********************************shimmer effect*********************************
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[200],
        highlightColor: Colors.white,
        child: Column(
          children: [0, 1, 2, 3, 4, 5, 6]
              .map((_) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 48.0,
                          height: 48.0,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 8.0,
                                color: Colors.white,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 2.0),
                              ),
                              Container(
                                width: double.infinity,
                                height: 8.0,
                                color: Colors.white,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 2.0),
                              ),
                              Container(
                                width: 40.0,
                                height: 8.0,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

Widget shimmer_widget() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
    child: Shimmer.fromColors(
      baseColor: Colors.grey[350],
      highlightColor: Colors.grey[50],
      child: Column(
        children: [0, 1, 2, 3, 4, 5, 6]
            .map((_) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 48.0,
                        height: 48.0,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 8.0,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2.0),
                            ),
                            Container(
                              width: double.infinity,
                              height: 8.0,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2.0),
                            ),
                            Container(
                              width: 40.0,
                              height: 8.0,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ))
            .toList(),
      ),
    ),
  );
}
