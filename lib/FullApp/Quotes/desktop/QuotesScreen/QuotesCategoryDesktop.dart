import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/Quotes/desktop/QuotesScreen/QuotePageDesktop.dart';

class QuotesCategoryDesktop extends StatefulWidget {
  QuotesCategoryDesktop({Key key}) : super(key: key);

  @override
  _QuotesCategoryStateDesktop createState() => _QuotesCategoryStateDesktop();
}

class _QuotesCategoryStateDesktop extends State<QuotesCategoryDesktop> {
  List listCat = [
    {'image': "https://smartkit.wrteam.in/smartkit/quotes/1.1.jpg", 'name': 'Quotes About Change'},
    {'image': "https://smartkit.wrteam.in/smartkit/quotes/2.2.jpg", 'name': 'Happy Quotes'},
    {'image': "https://smartkit.wrteam.in/smartkit/quotes/3.3.jpg", 'name': 'Family Quotes'},
    {'image': "https://smartkit.wrteam.in/smartkit/quotes/4.4.jpeg", 'name': 'Best Love Quotes'},
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: listCat.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: MediaQuery.of(context).size.height / 200,
          mainAxisExtent: 400,
        ),
        itemBuilder: (BuildContext context, int index) {
          return listItem(index);
        });
  }

  Widget listItem(int i) {
    return Center(
        child: /*Column(children: <Widget>[*/
            new GestureDetector(
                child: Expanded(
                  child: Card(
                      color: Colors.white,
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 1.0,
                      margin: EdgeInsets.all(7),
                      child: Expanded(
                        child: Stack(
                          children: <Widget>[
                            // listCat[i]["image"].toString().compareTo("") == 0
                            Expanded(
                              child: CachedNetworkImage(
                                imageUrl: listCat[i]["image"],
                                width: double.infinity,
                                // height: 200,
                                height: double.maxFinite,
                                fit: BoxFit.cover,
                              ),
                            ),
                            //   : CachedNetworkImage(
                            // imageUrl:    listCat[i]["image"],
                            //       fit: BoxFit.fill,
                            //       width: double.infinity,
                            //       height: 200,
                            //     ),
                            Container(
                                //height: 500,
                                color: Colors.black.withOpacity(0.5),
                                padding: const EdgeInsets.all(10.0),
                                child: Center(child: Padding(padding: EdgeInsets.symmetric(vertical: 10), child: Text(listCat[i]["name"], style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold))))),
                          ],
                        ),
                      )),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuotePageDesktop(),
                    ),
                  );
                })
        /*])*/);
  }
}
