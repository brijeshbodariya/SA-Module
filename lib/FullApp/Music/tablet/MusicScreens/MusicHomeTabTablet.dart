import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/Music/tablet/MusicScreens/MusicForYouStaggeredTablet.dart';
import 'package:smartkit/FullApp/Music/tablet/MusicScreens/MusicFuntionsTablet.dart';
import 'package:smartkit/FullApp/Music/tablet/MusicScreens/MusicHomeTablet.dart';
import 'package:smartkit/FullApp/Music/tablet/MusicScreens/coarouselSliderTablet.dart';

import 'package:smartkit/FullApp/Music/Constant.dart';

class MusicHometabTablet extends StatefulWidget {
  MusicHometabTablet({Key key}) : super(key: key);

  @override
  _MusicHometabStateTablet createState() => _MusicHometabStateTablet();
}

class _MusicHometabStateTablet extends State<MusicHometabTablet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(bottom: 200.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[CarouselWithIndicatorTablet(), getLabel('Popular'), getCat(), getLabel('For You'), MusicStaggeredListTablet()],
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  List catList = [
    {'cat_name': "Hindi \nTop 50", "image": "https://smartkit.wrteam.in/smartkit/music/cat1.jpg"},
    {'cat_name': "Punjabi \nTop 50", "image": "https://smartkit.wrteam.in/smartkit/music/cat2.jpg"},
    {'cat_name': "International Top 50 ", "image": "https://smartkit.wrteam.in/smartkit/music/cat3.jpg"},
    {'cat_name': "Trending Songs - Hindi ", "image": "https://smartkit.wrteam.in/smartkit/music/cat4.jpg"},
    {'cat_name': " New Releases Hot 50 Punjabi  ", "image": "https://smartkit.wrteam.in/smartkit/music/cat5.jpg"}
  ];

  Widget getCat() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
            padding: EdgeInsets.all(10.0),
            // color: Colors.amber,
            height: 300,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: catList.isNotEmpty
                    ? catList.length > 5
                        ? 5
                        : catList.length
                    : 0,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    child: Container(
                      margin: EdgeInsets.only(right: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              height: 200,
                              width: 200,
                              padding: EdgeInsets.all(10.0),
                              child: Container(
                                height: 150,
                                width: 150,
                              ),
                              decoration: BoxDecoration(
                                // color: Colors.purple,
                                image: DecorationImage(fit: BoxFit.cover, image: CachedNetworkImageProvider('${catList[i]['image']}')),
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(25.0), topLeft: Radius.circular(25.0), topRight: Radius.circular(10.0)),
                                // boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(2, 2))],
                              )),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            width: 100,
                            child: Padding(
                              padding: EdgeInsets.all(3.0),
                              child: Text(
                                '${catList[i]['cat_name']}',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      player.play();
                    },
                  );
                })));
  }

  Widget getLabel(String cls) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              cls,
              style: Theme.of(context).textTheme.headline6,
            ),
            GestureDetector(
              child: Text(
                'See more',
                style: Theme.of(context).textTheme.caption.copyWith(
                      color: primary,
                      fontSize: 14,
                    ),
              ),
              onTap: () {
                if (cls == 'Category') {
                  tabController.animateTo(1);
                } else if (cls == 'Latest') {
                  tabController.animateTo(2);
                } else if (cls == 'Favorites') {}
              },
            ),
          ],
        ));
  }
}
