import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Video_Des_1.dart';

class Video_5 extends StatefulWidget {
  @override
  _Video_5State createState() => _Video_5State();
}

class _Video_5State extends State<Video_5> {
  List listCat;
  bool loading = true;
  bool useMobileLayout;

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

    var shortestSide = MediaQuery.of(context).size.shortestSide;

    useMobileLayout = shortestSide < 600;

    // if (loading) {
    //   return Container(color: Colors.white, child: Center(child: CircularProgressIndicator()));
    // } else {
    return Scaffold(
        // backgroundColor: Color(0xff252D4A),
        appBar: AppBar(
          title: new Text('Video Style 5', style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,leading: BackButton(
            color: Colors.black
        ),
        ),
        drawer: new Drawer(),
        body: new ListView.builder(
            itemCount: listCat.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                  child: Stack(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Card(
                        color: Color(0xff252D4A),
                        elevation: 15,
                        child: Container(
                          //margin: EdgeInsets.only(left: 70),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    listCat[index]["title"],
                                    style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),
                                    maxLines: 1,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    '${listCat[index]["description"]}',
                                    style: Theme.of(context).textTheme.caption.copyWith(color: Colors.white24),
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          height: useMobileLayout ? 180 : 260,
                          width: double.infinity,
                        ),
                        margin: EdgeInsets.only(left: 30, right: 30, top: 60),
                      ),
                    ),
                    Container(
                      child: Card(
                        color: Color(0xff343D5E),
                        child: ClipPath(
                          child: Container(
                            child: CachedNetworkImage(
                              imageUrl: listCat[index]["thumbnail"],
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
                        ),
                      ),
                      margin: EdgeInsets.only(left: 50, right: 50, top: 10),
                      height: useMobileLayout ? 160 : 240,
                      width: double.infinity,
                    ),
                    new Container(
                        height: useMobileLayout ? 160 : 240,
                        width: double.infinity,
                        child: IconButton(
                          icon: Icon(
                            Icons.play_circle_outline,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () {},
                        )),
                  ]),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Video_Des_1(link: listCat[index]["link"], title: listCat[index]["title"], desc: listCat[index]["description"])));
                  });
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
