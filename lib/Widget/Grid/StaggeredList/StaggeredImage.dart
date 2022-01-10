import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../GalleryList/hero_dialog_route.dart';

class StaggeredImage extends StatefulWidget {
  StaggeredImage({Key key}) : super(key: key);

  @override
  _StaggeredImageState createState() => _StaggeredImageState();
}

class _StaggeredImageState extends State<StaggeredImage> {
  final List<String> _listUrl = [
    "https://smartkit.wrteam.in/smartkit/images/back7.jpg",
    "https://smartkit.wrteam.in/smartkit/images/benassi3.jpg",
    "https://smartkit.wrteam.in/smartkit/images/twitter.jpg",
    "https://smartkit.wrteam.in/smartkit/images/sunset.jpg",
    "https://smartkit.wrteam.in/smartkit/images/back9.jpg",
    "https://smartkit.wrteam.in/smartkit/images/Nikereak1.jpg",
    "https://smartkit.wrteam.in/smartkit/images/back5.jpg",
    "https://smartkit.wrteam.in/smartkit/images/1573810839.322.jpeg",
    "https://smartkit.wrteam.in/smartkit/images/back8.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        // crossAxisSpacing: 12,
        // mainAxisSpacing: 12,
        itemCount: _listUrl.length,
        staggeredTileBuilder: (index) {
          return new StaggeredTile.fit(1);
        },
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, HeroDialogRoute(builder: (BuildContext context) => _buildPopUp(context, _listUrl[index], index)));
            },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                    // color: bg.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Hero(
                  tag: "$index",
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: new CachedNetworkImage(
                      imageUrl: _listUrl[index],
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  _buildPopUp(BuildContext context, String image, int index) {
    return Center(
      child: AlertDialog(
        contentPadding: EdgeInsets.all(0.0),
        content: Container(
          child: Hero(
              tag: "grid$index",
              child: CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.fill,
              )),
        ),
      ),
    );
  }
}
