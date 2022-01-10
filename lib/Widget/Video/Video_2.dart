import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'Video_Des_1.dart';

class Video2 extends StatefulWidget {
  @override
  _Video2_State createState() => _Video2_State();
}

class _Video2_State extends State<Video2> {
  List listCat;
  bool loading = true;

  YoutubePlayerController controller;

  @override
  Widget build(BuildContext context) {
    listCat = [
      {"id": "17", "title": "iphone 11", "link": "https://www.youtube.com/watch?v=nKnW6IgbYk8", "description": "iPhone 11 Pro - 1 Week Later", "thumbnail": "https://img.youtube.com/vi/nKnW6IgbYk8/hqdefault.jpg", "date_created": "27-09-2019 15:09:42"},
      {
        "id": "16",
        "title": "Nature Beautiful short video 720p HD",
        "link": "https://www.youtube.com/watch?v=668nUCeBHyY",
        "description": "Small length, small size,Big quality,Big resolution.",
        "thumbnail": "https://img.youtube.com/vi/668nUCeBHyY/hqdefault.jpg",
        "date_created": "27-09-2019 15:09:52"
      },
      {
        "id": "14",
        "title": "The Kapil Sharma Show",
        "link": "https://www.youtube.com/watch?v=1AmZy4bSleY",
        "description": "The Kapil Sharma Show - Movie Chhichhore Uncensored | Sushant Singh Rajput, Shraddha, Varun Sharma",
        "thumbnail": "https://img.youtube.com/vi/1AmZy4bSleY/hqdefault.jpg",
        "date_created": "27-09-2019 15:09:57"
      },
      {
        "id": "13",
        "title": "Sandeep Maheshwari",
        "link": "https://www.youtube.com/watch?v=EDoD6K-xPro",
        "description": "Khud Ko Kisi Se Kam Mat Samjho - Motivational Speech By Sandeep Maheshwari",
        "thumbnail": "https://img.youtube.com/vi/EDoD6K-xPro/hqdefault.jpg",
        "date_created": "27-09-2019 15:09:08"
      },
      {
        "id": "12",
        "title": "Drawing Sunset Scenery ",
        "link": "https://www.youtube.com/watch?v=wPlea_vv414",
        "description": "How to draw easy and simple scenery for kids and beginners with oil pastels. Drawing a scenery of sunset step by step.",
        "thumbnail": "https://img.youtube.com/vi/wPlea_vv414/hqdefault.jpg",
        "date_created": "27-09-2019 15:09:32"
      }
    ];

    return Scaffold(
      appBar: AppBar(
          title: new Text(
            "Video Style 2", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,leading: BackButton(
          color: Colors.black
      ),),
      body: new ListView.builder(
          shrinkWrap: true,
          itemCount: listCat.length,
          itemBuilder: (BuildContext context, int index) {
            var id = YoutubePlayer.convertUrlToId(listCat[index]["link"]);

            controller = YoutubePlayerController(initialVideoId: id);

            return GestureDetector(
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                elevation: 15,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        CachedNetworkImage(
                          imageUrl: listCat[index]["thumbnail"],
                          width: double.maxFinite,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          width: double.maxFinite,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              listCat[index]["title"],
                              style: Theme.of(context).textTheme.subtitle2,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          color: Colors.black26,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => new Video_Des_1(link: listCat[index]["link"], title: listCat[index]["title"], desc: listCat[index]["description"])));
              },
            );
          }),
    );
  }
}
