import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'hero_dialog_route.dart';

class GalleryThreeColumn extends StatefulWidget {
  @override
  _GalleryThreeColumnState createState() => new _GalleryThreeColumnState();
}

class _GalleryThreeColumnState extends State<GalleryThreeColumn> {
  @override
  Widget build(BuildContext context) {
    var imgs = [
      "https://smartkit.wrteam.in/smartkit/images/28.jpg",
      "https://smartkit.wrteam.in/smartkit/images/goggles1.jpg",
      "https://smartkit.wrteam.in/smartkit/images/google.jpg",
      "https://smartkit.wrteam.in/smartkit/images/Nikereak4.jpg",
      "https://smartkit.wrteam.in/smartkit/images/Nikereak2.jpg",
      "https://smartkit.wrteam.in/smartkit/images/profile2.png",
      "https://smartkit.wrteam.in/smartkit/images/le1.png",
      "https://smartkit.wrteam.in/smartkit/images/le2.png",
      "https://smartkit.wrteam.in/smartkit/images/le4.png",
      "https://smartkit.wrteam.in/smartkit/images/le5.png",
      "https://smartkit.wrteam.in/smartkit/images/le7.png",
    ];

    var myGridView = new GridView.builder(
      itemCount: imgs.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (BuildContext context, int index) {
        return new GestureDetector(
          child: new Card(
            elevation: 5.0,
            child: Hero(
                tag: "grid$index",
                child: CachedNetworkImage(
                  imageUrl: imgs[index],
                  fit: BoxFit.fill,
                  height: 180,
                )),
          ),
          onTap: () {
            Navigator.push(context, HeroDialogRoute(builder: (BuildContext context) => _buildPopUp(context, imgs[index], index)));
          },
        );
      },
    );

    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: myGridView,
    );
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
