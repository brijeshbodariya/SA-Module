import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'MusicFuntions.dart';

class MusicStaggeredList extends StatefulWidget {
  MusicStaggeredList({Key key}) : super(key: key);

  @override
  _MusicStaggeredListState createState() => _MusicStaggeredListState();
}

class _MusicStaggeredListState extends State<MusicStaggeredList> {
  List catList = [
    {'cat_name': "Like it Doesn't Hurt", "image": "https://smartkit.wrteam.in/smartkit/music/sta1.jpg", "desc": "Charle Cardin"},
    {'cat_name': "Love on the Brain", "image": "https://smartkit.wrteam.in/smartkit/music/slider1.jpg", "desc": "Danito & Athina"},
    {'cat_name': "Lean On", "image": "https://smartkit.wrteam.in/smartkit/music/sta2.jpg", "desc": "Major Lazer"},
    {'cat_name': "Closer", "image": "https://smartkit.wrteam.in/smartkit/music/slider2.jpg", "desc": "The Chainsmokers"},
    {'cat_name': "Havana", "image": "https://smartkit.wrteam.in/smartkit/music/sta3.jpg", "desc": "Camila Cabello"},
    {'cat_name': "Taki Taki", "image": "https://smartkit.wrteam.in/smartkit/music/slider3.jpg", "desc": "DJ Snake"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StaggeredGridView.countBuilder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          itemCount: catList.length,
          staggeredTileBuilder: (index) {
            return new StaggeredTile.fit(1);
          },
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                player.play();
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(25.0), topLeft: Radius.circular(25.0), topRight: Radius.circular(10.0)),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(25.0), topLeft: Radius.circular(25.0), topRight: Radius.circular(10.0)),
                      child: new CachedNetworkImage(
                        imageUrl: catList[index]['image'],
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            catList[index]['cat_name'],
                            style: TextStyle(fontWeight: FontWeight.w600),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            catList[index]['desc'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                ]),
              ),
            );
          }),
    );
  }
}
