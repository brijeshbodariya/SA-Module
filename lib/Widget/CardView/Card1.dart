import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WrCard1 extends StatelessWidget {
  const WrCard1({
    Key key,
    this.image,
    this.title,
    this.country,
    this.price,
    this.press,
  }) : super(key: key);

  final String image, title, country;
  final int price;
  final Function press;

  @override
  Widget build(BuildContext context) {
    const double DefaultPadding = 20.0;
    const PrimaryColor = Color(0xFF0C9869);
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: 15,
      ),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          CachedNetworkImage(imageUrl: image),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(DefaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: "$title\n".toUpperCase(), style: Theme.of(context).textTheme.button),
                        TextSpan(
                          text: "$country".toUpperCase(),
                          style: TextStyle(
                            color: PrimaryColor.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    '\₹$price',
                    style: Theme.of(context).textTheme.button.copyWith(color: PrimaryColor),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
