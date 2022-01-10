import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/Grobag/Helper/GrobagAppbar.dart';
import 'package:smartkit/FullApp/Grobag/Helper/GrobagColor.dart';

class GrobagNotificationTablet extends StatefulWidget {
  @override
  _GrobagNotificationTabletState createState() => _GrobagNotificationTabletState();
}

class _GrobagNotificationTabletState extends State<GrobagNotificationTablet> {
  List notiList = [
    {'img': "https://smartkit.wrteam.in/smartkit/grobag/cart-image-a.png", 'name': "Your Order no: 131344588 have been cancelled.", 'time': '2 day ago'},
    {'img': "https://smartkit.wrteam.in/smartkit/grobag/cart-image-b.png", 'name': "Order no: 1234577854 has delivered successfull.", 'time': '3 day ago'},
    {'img': "https://smartkit.wrteam.in/smartkit/grobag/cart-image-c.png", 'name': "Your Order no: 457898754 has been processed from our store.", 'time': '3 day ago'},
    {'img': "https://smartkit.wrteam.in/smartkit/grobag/cart-image-d.png", 'name': "Don't miss a 50% discount for Biggrocecery day.", 'time': '5 day ago'},
    {'img': "https://smartkit.wrteam.in/smartkit/grobag/cart-image-e.png", 'name': "Hurry! Big discount on backery product for limited stock", 'time': '7 day ago'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GrobagAppbar(
          title: "Notifications",
        ),
        body: ListView.builder(
          itemCount: notiList.length,
          physics: AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return listItem(index);
          },
        ));
  }

  Widget listItem(int index) {
    return Card(
      elevation: 0.1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: notiList[index]["img"],
              height: 80,
              width: 80,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      notiList[index]["name"],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.subtitle1.copyWith(color: fontColor, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      notiList[index]["time"],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: fontLight,
                          ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
