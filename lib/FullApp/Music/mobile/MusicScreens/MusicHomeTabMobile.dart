import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/Music/mobile/MusicScreens/MusicForYouStaggeredMobile.dart';
import 'package:smartkit/FullApp/Music/mobile/MusicScreens/MusicFuntionsMobile.dart';
import 'package:smartkit/FullApp/Music/mobile/MusicScreens/MusicHomeMobile.dart';

import 'package:smartkit/FullApp/Music/Constant.dart';
import 'package:smartkit/FullApp/Music/mobile/MusicScreens/coarouselSliderMobile.dart';

class MusicHometabMobile extends StatefulWidget {
  MusicHometabMobile({Key key}) : super(key: key);

  @override
  _MusicHometabStateMobile createState() => _MusicHometabStateMobile();
}

class _MusicHometabStateMobile extends State<MusicHometabMobile> {
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
                      children: <Widget>[CarouselWithIndicatorMobile(), getLabel('Popular'), getCat(), getLabel('For You'), MusicStaggeredListMobile()],
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
            height: 200,
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
                              height: 95,
                              width: 95,
                              padding: EdgeInsets.all(10.0),
                              child: Container(
                                height: 55,
                                width: 55,
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
