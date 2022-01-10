import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/Grobag/Helper/GrobagColor.dart';

import 'GrobagHomeMobile.dart';

class GrobagFavoriteMobile extends StatefulWidget {
  @override
  _GrobagFavoriteMobileState createState() => _GrobagFavoriteMobileState();
}

class _GrobagFavoriteMobileState extends State<GrobagFavoriteMobile> {
  List favList = [
    {'tag': "4", 'img': "https://smartkit.wrteam.in/smartkit/grobag/strawberries.png", 'name': "Starwberries", 'descprice': "1700", 'price': "2000", 'qty': '250 gm', 'isFav': true},
    {'tag': "5", 'img': "https://smartkit.wrteam.in/smartkit/grobag/kiwi.png", 'name': "Fresh Kiwi", 'descprice': "25", 'price': "2200", 'qty': '250 gm', 'isFav': true},
    {'tag': "1", 'img': "https://smartkit.wrteam.in/smartkit/grobag/banana.png", 'name': "Banana", 'descprice': "25", 'price': "50", 'qty': "1 kg", 'isFav': true},
    {'tag': "2", 'img': "https://smartkit.wrteam.in/smartkit/grobag/apple.png", 'name': "Shimla Apple", 'descprice': "1000", 'price': "1200", 'qty': '500 gm', 'isFav': true},
    {'tag': "3", 'img': "https://smartkit.wrteam.in/smartkit/grobag/watermelon.png", 'name': "Yummy Watermelon", 'descprice': "1300", 'price': "1400", 'qty': '2 kg', 'isFav': true},
    {'tag': "8", 'img': "https://smartkit.wrteam.in/smartkit/grobag/red_chili.png", 'name': "Spicy Red Chili", 'descprice': "1300", 'price': "1400", 'qty': '1 kg', 'isFav': true},
    {'tag': "6", 'img': "https://smartkit.wrteam.in/smartkit/grobag/mangosteens.png", 'name': "Mangosteens", 'descprice': "2500", 'price': "3500", 'qty': '250 gm', 'isFav': true},
    {'tag': "7", 'img': "https://smartkit.wrteam.in/smartkit/grobag/peas.png", 'name': "Green Peas", 'descprice': "1000", 'price': "1000", 'qty': '250 gm', 'isFav': true},
    {'tag': "9", 'img': "https://smartkit.wrteam.in/smartkit/grobag/muskmelon.png", 'name': "Muskmelon", 'descprice': "1700", 'price': "2000", 'qty': '500 gm', 'isFav': true},
    {'tag': "5", 'img': "https://smartkit.wrteam.in/smartkit/grobag/kiwi.png", 'name': "Fresh Kiwi", 'descprice': "25", 'price': "2200", 'qty': '250 gm', 'isFav': true},
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => GrobagHomeMobile(),
            ));
      },
      child: GridView.count(
          padding: EdgeInsets.all(20),
          crossAxisCount: 2,
          shrinkWrap: true,
          childAspectRatio: 0.8,
          physics: BouncingScrollPhysics(),
          mainAxisSpacing: 15,
          crossAxisSpacing: 10,
          children: List.generate(
            favList.length,
            (index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                width: MediaQuery.of(context).size.width * 0.4,
                child: GestureDetector(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Expanded(
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: CachedNetworkImage(
                                imageUrl: favList[index]['img'],
                              ),
                            ),
                            Positioned(
                              right: 5,
                              top: 5,
                              child: InkWell(
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: new BoxDecoration(
                                    color: secondary.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Icon(
                                    favList[index]['isFav'] ? Icons.favorite : Icons.favorite_border,
                                    size: 15,
                                    color: secondary,
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    favList[index]['isFav'] = !favList[index]['isFav'];
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      Text(
                        favList[index]['qty'],
                        style: Theme.of(context).textTheme.caption.copyWith(
                              color: secondary,
                            ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        favList[index]['name'],
                        style: Theme.of(context).textTheme.subtitle2.copyWith(
                              color: fontColor,
                              fontWeight: FontWeight.w700,
                            ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Row(
                        children: [
                          Text(
                            "\$ " + favList[index]['descprice'],
                            style: TextStyle(
                              color: primary,
                              fontWeight: FontWeight.w400,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          Spacer(),
                          new Container(
                            margin: EdgeInsets.only(bottom: 5, right: 5),
                            width: 24,
                            height: 24,
                            decoration: new BoxDecoration(color: primary.withOpacity(0.3), borderRadius: BorderRadius.circular(6)),
                            child: Icon(
                              Icons.add,
                              size: 12,
                              color: primary,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}
