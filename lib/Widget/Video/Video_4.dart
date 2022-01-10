import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Video_Des_1.dart';

class Video4 extends StatefulWidget {
  @override
  _Video_4State createState() => _Video_4State();
}

class _Video_4State extends State<Video4> {
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

    // if (loading) {
    //   return Container(color: Colors.white, child: Center(child: CircularProgressIndicator()));
    // } else {
    return Scaffold(
        appBar: AppBar(
          title: new Text("Video Style 4", style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,leading: BackButton(
            color: Colors.black
        ),
        ),
        drawer: new Drawer(),
        body: new ListView.builder(
            itemCount: listCat.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return new GestureDetector(
                child: Stack(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Card(
                      color: Colors.white24,
                      elevation: 15,
                      child: Container(
                        margin: EdgeInsets.only(left: 100),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Text(
                                    listCat[index]["title"],
                                    style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),
                                    maxLines: 3,
                                  ),
                                ),
                              )),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: new IconButton(
                                    icon: Icon(
                                      Icons.play_circle_outline,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    tooltip: 'play',
                                    onPressed: () {
                                      // _displaySnackBar(context, "Icon Button Pressed..!");
                                    }),
                              )
                            ],
                          ),
                        ),
                        height: 160,
                        width: double.infinity,
                      ),
                      margin: EdgeInsets.only(left: 80, right: 30),
                    ),
                  ),
                  Hero(
                    tag: "item$index",
                    child: Container(
                      child: Card(
                        child: ClipPath(
                          child: Container(
                            child: CachedNetworkImage(
                              imageUrl: listCat[index]["thumbnail"],
                              height: 90,
                              width: 155,
                            ),
                            decoration: BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.black, width: 2), left: BorderSide(color: Colors.black, width: 2), top: BorderSide(color: Colors.black, width: 2), bottom: BorderSide(color: Colors.black, width: 2))),
                          ),
                          clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
                        ),
                      ),
                      margin: EdgeInsets.only(left: 20, top: 20),
                      height: 130,
                    ),
                  ),
                ]),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Video_Des_1(link: listCat[index]["link"], title: listCat[index]["title"], desc: listCat[index]["description"])));
                },
              );
            }));
  }

  // @override
  // void initState() {
  //   super.initState();
  //   getVideo();
  // }

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
