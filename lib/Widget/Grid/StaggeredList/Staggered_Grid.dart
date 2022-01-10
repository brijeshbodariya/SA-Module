import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';

final List<String> _listUrl = [
  "https://smartkit.wrteam.in/smartkit/images/back7.jpg",
  "https://smartkit.wrteam.in/smartkit/images/benassi3.jpg",
  "https://smartkit.wrteam.in/smartkit/images/twitter.jpg",
  "https://smartkit.wrteam.in/smartkit/images/sunset.jpg",
  "https://smartkit.wrteam.in/smartkit/images/Nikereak1.jpg",
  "https://smartkit.wrteam.in/smartkit/images/back5.jpg",
  "https://smartkit.wrteam.in/smartkit/images/1573810839.322.jpeg",
  "https://smartkit.wrteam.in/smartkit/images/back8.jpg",
  "https://smartkit.wrteam.in/smartkit/images/back9.jpg",
];

final List<String> _listName = ["Nature", "Image1", "Lorem", "Ipsum", "Neque ", "Quisquam", "Dolorem", "Quia ", "Amet"];

List<DetailRecord> _createSizes(int count) {
  return new List.generate(count, (i) => new DetailRecord(_listName[i], _listUrl[i]));
}

class StraggerdGrid extends StatelessWidget {
  StraggerdGrid() : _detail = _createSizes(_kItemCount).toList();

  static const int _kItemCount = 9;
  final List<DetailRecord> _detail;
  List<Color> _color = [
    Color(0xFFE25141),
    Color(0xFF4154AF),
    Color(0xFFD0DA58),
    Color(0xFF9036AC),
    Color(0xFF66AC5D),
    Color(0xFFD73A63),
    Color(0xFF52B9D2),
    Color(0xFFF7C245),
    Color(0xFFEB5F5A),
    Color(0xFF419387),
    Color(0xFFF29C37),
    Color(0xFF735649),
  ];
  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      primary: false,
      itemCount: 9,
      crossAxisCount: 4,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      itemBuilder: (context, index) {
        Color bg = _color[index % _color.length];
        return _Tile(index, _detail[index], bg);
      },
      staggeredTileBuilder: (index) => new StaggeredTile.fit(2),
      /* staggeredTileBuilder: (index) {
          new StaggeredTile.fit(2);
          //new StaggeredTile.count(2,2);
        }*/
    );
  }
}

class DetailRecord {
  const DetailRecord(this.name, this.url);

  final String name;
  final String url;
}

class _Tile extends StatelessWidget {
  const _Tile(this.index, this.detail, this.color);

  final int index;
  final DetailRecord detail;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(color: color.withOpacity(0.5), borderRadius: BorderRadius.circular(10.0)),
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: new FadeInImage(
              placeholder: CachedNetworkImageProvider("https://smartkit.wrteam.in/smartkit/images/placeholder.png"),
              image: CachedNetworkImageProvider(detail.url),
            ),
          ),
          Positioned(
            bottom: 0.0,
            right: 0.0,
            left: 0.0,
            child: Container(
              decoration: BoxDecoration(
                color: color.withOpacity(0.5),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
              ),
              height: MediaQuery.of(context).size.height / 20,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                child: new Text(
                  detail.name,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
