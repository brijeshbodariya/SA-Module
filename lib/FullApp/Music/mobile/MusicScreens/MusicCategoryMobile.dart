import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/Music/mobile/MusicScreens/MusicSubCategoryMobile.dart';

class MusicCategoryMobile extends StatefulWidget {
  MusicCategoryMobile({Key key}) : super(key: key);

  @override
  _MusicCategoryStateMobile createState() => _MusicCategoryStateMobile();
}

class _MusicCategoryStateMobile extends State<MusicCategoryMobile> {
  ScrollController _controller;
  List catList = [
    {'cat_name': "Hindi \nTop 50", "image": "https://smartkit.wrteam.in/smartkit/music/cat1.jpg"},
    {'cat_name': "Punjabi \nTop 50", "image": "https://smartkit.wrteam.in/smartkit/music/cat2.jpg"},
    {'cat_name': "International Top 50 ", "image": "https://smartkit.wrteam.in/smartkit/music/cat3.jpg"},
    {'cat_name': "Trending Songs - Hindi ", "image": "https://smartkit.wrteam.in/smartkit/music/cat4.jpg"},
    {'cat_name': " New Releases Hot 50 Punjabi  ", "image": "https://smartkit.wrteam.in/smartkit/music/cat5.jpg"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 200.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: catList.length,
                  controller: _controller,
                  itemBuilder: (context, index) {
                    return listItem(index);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listItem(int index) {
    return GestureDetector(
      child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 5.0,
          child: Stack(alignment: Alignment.bottomCenter, children: <Widget>[
            Center(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: CachedNetworkImage(
                    imageUrl: catList[index]['image'],

                    // fit: BoxFit.cover,
                  )),
            ),
            Container(
              width: double.infinity,
              color: Colors.black.withOpacity(0.6),
              padding: const EdgeInsets.all(5.0),
              child: Text(
                catList[index]['cat_name'],
                style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ])),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MusicSubCategoryMobile(),
          ),
        );
      },
    );
  }
}
