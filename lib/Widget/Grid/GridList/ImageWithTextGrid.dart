import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageWithTextGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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

    List data = [
      {'title': 'Item 1', 'img': "https://smartkit.wrteam.in/smartkit/images/Nikereak1.jpg", 'subti': "lorem ipsum"},
      {'title': 'Item 1', 'img': "https://smartkit.wrteam.in/smartkit/images/Nikereak1.jpg", 'subti': "lorem ipsum"},
      {'title': 'Item 1', 'img': "https://smartkit.wrteam.in/smartkit/images/Nikereak1.jpg", 'subti': "lorem ipsum"},
      {'title': 'Item 1', 'img': "https://smartkit.wrteam.in/smartkit/images/Nikereak1.jpg", 'subti': "lorem ipsum"},
      {'title': 'Item 1', 'img': "https://smartkit.wrteam.in/smartkit/images/Nikereak1.jpg", 'subti': "lorem ipsum"},
      {'title': 'Item 1', 'img': "https://smartkit.wrteam.in/smartkit/images/Nikereak1.jpg", 'subti': "lorem ipsum"},
    ];
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 3,
        children: List.generate(6, (index) {
          Color bg = _color[index % _color.length];
          var subtitle = data[index]['subti'];
          return new Container(
              decoration: BoxDecoration(color: bg.withOpacity(0.8), borderRadius: BorderRadius.circular(10.0)),
              margin: new EdgeInsets.all(6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: CachedNetworkImage(imageUrl: data[index]['img'], fit: BoxFit.cover, width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.width / 5.2),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          new Text(
                            '$subtitle',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ));
        }),
      ),
    );
  }
}
