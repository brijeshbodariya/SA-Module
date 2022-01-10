import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/Quotes/desktop/QuotesScreen/QuotesSingleAuthorDesktop.dart';

class QuotesAuthorDesktop extends StatefulWidget {
  QuotesAuthorDesktop({Key key}) : super(key: key);

  @override
  _QuotesAuthorStateDesktop createState() => _QuotesAuthorStateDesktop();
}

class _QuotesAuthorStateDesktop extends State<QuotesAuthorDesktop> {
  List listCat = [
    {
      "name": "Albert Einstein",
      "image": "https://smartkit.wrteam.in/smartkit/quotes/1586952732.2919.jpg",
    },
    {
      "name": "Nelson Mandela",
      "image": "https://smartkit.wrteam.in/smartkit/quotes/1561118756.7788.jpg",
    },
    {
      "name": "Mahatma Gandhi",
      "image": "https://smartkit.wrteam.in/smartkit/quotes/1561118709.7116.jpg",
    },
    {
      "name": "A. P. J. Abdul Kalam",
      "image": "https://smartkit.wrteam.in/smartkit/quotes/1561118694.8622.jpg",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: listCat.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisExtent: 300,
        childAspectRatio: MediaQuery.of(context).size.height / 500,
      ),
      itemBuilder: (BuildContext context, int index) {
        String tag = "${listCat[index]}";
        return new GestureDetector(
          child: new Container(
            child: new Card(
                margin: EdgeInsets.all(20),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 10.0,
                child: Hero(
                    tag: tag,
                    flightShuttleBuilder: (
                      BuildContext flightContext,
                      Animation<double> animation,
                      HeroFlightDirection flightDirection,
                      BuildContext fromHeroContext,
                      BuildContext toHeroContext,
                    ) {
                      return SingleChildScrollView(
                        child: fromHeroContext.widget,
                      );
                    },
                    child: Container(
                      child: Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.spaceAround, children: <Widget>[
                        //SizedBox(height: 30),
                        Expanded(
                          child: CircleAvatar(
                            radius: 50,
                            child: ClipOval(
                              child: CachedNetworkImage(
                                imageUrl: listCat[index]["image"],
                                height: 90,
                                width: 90,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        //SizedBox(height: 7),
                        Text(listCat[index]["name"],
                            style: new TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              decoration: TextDecoration.none,
                            )),
                        SizedBox(height: 7),
                      ]),
                    ))),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QuotesSingleAuthorDesktop(
                  id: tag,
                  name: listCat[index]["name"],
                  image: listCat[index]["image"],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
