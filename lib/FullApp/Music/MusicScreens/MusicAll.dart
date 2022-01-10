import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/Music/MusicScreens/MusicFuntions.dart';

import '../Constant.dart';

bool isplay = false;

class MusicAll extends StatefulWidget {
  MusicAll({Key key}) : super(key: key);

  @override
  _MusicAllState createState() => _MusicAllState();
}

class _MusicAllState extends State<MusicAll> {
  @override
  void dispose() {
    player.pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: getList());
  }

  bool isfavsub = false;

  List radioList = [
    {'cat_name': "Radha - Student Of The Year & Jab Harry Met Sejal", "image": "https://smartkit.wrteam.in/smartkit/music/cat1.jpg"},
    {'cat_name': "Hawa Hawa - Rockstar & Mubarakaan", "image": "https://smartkit.wrteam.in/smartkit/music/cat2.jpg"},
    {'cat_name': "Afreen - Nusrat Fateh Ali Khan ", "image": "https://smartkit.wrteam.in/smartkit/music/cat3.jpg"},
    {'cat_name': "Trending Songs - Hindi ", "image": "https://smartkit.wrteam.in/smartkit/music/cat4.jpg"},
    {'cat_name': "Dum Dum - Phillauri & Band Baaja Baaraat", "image": "https://smartkit.wrteam.in/smartkit/music/cat5.jpg"}
  ];

  int isfavindex = 0;
  int isplayindex = 0;
  bool isplay = false;

  getList() {
    return Padding(
        padding: const EdgeInsets.only(bottom: 190.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: radioList.length,
            itemBuilder: (context, index) {
              return listItem(index, radioList);
            },
          ),
        ));
  }

  Widget listItem(
    int index,
    List catRadioList,
  ) {
    return GestureDetector(
      child: Card(
          elevation: 5.0,
          child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(5.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: CachedNetworkImage(
                            imageUrl: catRadioList[index]['image'],
                            width: 50,
                            height: 50,
                          ))),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      catRadioList[index]['cat_name'],
                      style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )),
                  IconButton(
                      icon: Icon(
                        isplayindex == index
                            ? isplay == true
                                ? Icons.pause
                                : Icons.play_arrow
                            : Icons.play_arrow,
                        size: 40,
                        color: primary,
                      ),
                      onPressed: () {
                        setState(() {
                          isplayindex = index;

                          if (isplay == true) {
                            isplay = false;

                            player.pause();
                          } else {
                            isplay = true;

                            player.play();
                          }
                        });
                      }),
                  IconButton(
                    icon: Icon(
                      isfavindex == index
                          ? isfavsub == true
                              ? Icons.favorite
                              : Icons.favorite_border
                          : Icons.favorite_border,
                      size: 30,
                      color: primary,
                    ),
                    onPressed: () {
                      setState(() {
                        isfavindex = index;
                        if (isfavsub == true) {
                          isfavsub = false;
                          print('ISPLAYif: $isplay');
                        } else {
                          isfavsub = true;
                          print('ISPLAYelse: $isplay');
                        }
                      });
                    },
                  ),
                ],
              ))),
      onTap: () {
        // curPos = index;
      },
    );
  }
}
