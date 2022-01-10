import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WrCard3 extends StatelessWidget {
  final String title;
  final String image;
  final bool isFav;
  final double rating;
  final int raters;
  final VoidCallback onTap;
  final double width;
  final double imgheight;
  final double decsheight;

  WrCard3({Key key, @required this.title, @required this.image, @required this.isFav, @required this.rating, @required this.raters, @required this.onTap, @required this.width, this.imgheight, this.decsheight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: width,
                  height: imgheight,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: CachedNetworkImage(
                      imageUrl: "$image",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: -10.0,
                  bottom: 3.0,
                  child: RawMaterialButton(
                    onPressed: () {},
                    fillColor: Colors.white,
                    shape: CircleBorder(),
                    elevation: 4.0,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border,
                        color: Colors.red,
                        size: 17,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
                width: width,
                height: decsheight,
                padding: EdgeInsets.all(20 / 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 2.0, top: 8.0),
                    child: Text(
                      "$title",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w900,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 5.0, top: 2.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 25.0,
                        ),
                        Text(
                          " $rating ($raters Reviews)",
                          style: TextStyle(
                            fontSize: 11.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ])),
          ],
        ),
        onTap: onTap);
  }
}
