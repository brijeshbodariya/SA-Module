import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/Quotes/mobile/QuotesScreen/QuotePageMobile.dart';

class QuotesCategoryMobile extends StatefulWidget {
  QuotesCategoryMobile({Key key}) : super(key: key);

  @override
  _QuotesCategoryStateMobile createState() => _QuotesCategoryStateMobile();
}

class _QuotesCategoryStateMobile extends State<QuotesCategoryMobile> {
  List listCat = [
    {'image': "https://smartkit.wrteam.in/smartkit/quotes/1.1.jpg", 'name': 'Quotes About Change'},
    {'image': "https://smartkit.wrteam.in/smartkit/quotes/2.2.jpg", 'name': 'Happy Quotes'},
    {'image': "https://smartkit.wrteam.in/smartkit/quotes/3.3.jpg", 'name': 'Family Quotes'},
    {'image': "https://smartkit.wrteam.in/smartkit/quotes/4.4.jpeg", 'name': 'Best Love Quotes'},
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: listCat == null ? 0 : listCat.length,
        itemBuilder: (context, i) {
          return listItem(i);
        });
  }

  Widget listItem(int i) {
    return Center(
        child: Column(children: <Widget>[
      new GestureDetector(
          child: Card(
              color: Colors.white,
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 1.0,
              margin: EdgeInsets.all(7),
              child: Stack(
                children: <Widget>[
                  // listCat[i]["image"].toString().compareTo("") == 0
                  CachedNetworkImage(
                    imageUrl: listCat[i]["image"],
                    width: double.infinity,
                    // height: 200,
                    height: MediaQuery.of(context).size.width / 1.8,
                    fit: BoxFit.cover,
                  ),
                  //   : CachedNetworkImage(
                  // imageUrl:    listCat[i]["image"],
                  //       fit: BoxFit.fill,
                  //       width: double.infinity,
                  //       height: 200,
                  //     ),
                  Container(
                      height: MediaQuery.of(context).size.width / 1.8,
                      color: Colors.black.withOpacity(0.5),
                      padding: const EdgeInsets.all(10.0),
                      child: Center(child: Padding(padding: EdgeInsets.symmetric(vertical: 10), child: Text(listCat[i]["name"], style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold))))),
                ],
              )),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QuotePageMobile(),
              ),
            );
          })
    ]));
  }
}
