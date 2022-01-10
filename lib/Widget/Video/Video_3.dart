import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'Video_Des_2.dart';

class Video3 extends StatefulWidget {
  @override
  _Video3_State createState() => _Video3_State();
}

class _Video3_State extends State<Video3> {
  List listCat;
  bool loading = true;

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

    double cWidth = MediaQuery.of(context).size.width * 0.55;

    return Scaffold(
      body:
          //Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Stack(children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * .35,
          child: Stack(
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: 'https://smartkit.wrteam.in/smartkit/images/top_header.png',
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
                  )),
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * .08, left: 20),
                child: Text("Style 3", style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.white)),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * .20),
          child: new ListView.builder(
              shrinkWrap: true,
              itemCount: listCat.length,
              itemBuilder: (BuildContext context, int index) {
                return Stack(children: <Widget>[
                  GestureDetector(
                    child: Card(
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        elevation: 15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: cWidth,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      listCat[index]["title"],
                                      style: Theme.of(context).textTheme.subtitle2,
                                      maxLines: 1,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        listCat[index]["description"],
                                        style: Theme.of(context).textTheme.caption,
                                        maxLines: 3,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                                child: CachedNetworkImage(
                              imageUrl: listCat[index]["thumbnail"],
                              width: MediaQuery.of(context).size.width * 0.4,
                              fit: BoxFit.cover,
                            )),
                          ],
                        )),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => new Video_Des_2(link: listCat[index]["link"], title: listCat[index]["title"], desc: listCat[index]["description"])));
                    },
                  ),
                ]);
              }),
        )
      ]),
      //]),
    );
  }

  // Future<String> getVideo() async {
  //   var data = {'access_key': "90336", 'get_video_list': "1"};
  //   var response = await http.post(base_url, body: data);

  //   var getdata = json.decode(response.body);
  //   String total = getdata["total"];
  //   if (int.parse(total) > 0) {
  //     setState(() {
  //       loading = false;

  //       listCat = getdata["rows"];
  //     });
  //   }
  // }
}
