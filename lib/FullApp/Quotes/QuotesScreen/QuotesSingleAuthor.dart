import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/FullApp/Quotes/QuotesScreen/QuotePage.dart';

import '../QuotesMain.dart';

class QuotesSingleAuthor extends StatefulWidget {
  final String id, name, image;
  QuotesSingleAuthor({Key key, this.name, this.image, this.id}) : super(key: key);

  @override
  _QuotesSingleAuthorState createState() => _QuotesSingleAuthorState();
}

class _QuotesSingleAuthorState extends State<QuotesSingleAuthor> {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  static GlobalObjectKey<ScaffoldState> _scaffoldKey;
  List quotelist = [
    {'image': "https://smartkit.wrteam.in/smartkit/quotes/logo.png", 'quote': "Be yourself; everyone else is already taken.", 'auth_name': "Oscar Wilde"},
    {
      'image': "https://smartkit.wrteam.in/smartkit/quotes/logo.png",
      'quote': "I'm selfish, impatient and a little insecure. I make mistakes, I am out of control and at times hard to handle. But if you can't handle me at my worst, then you sure as hell don't deserve me at my best.",
      'auth_name': "Marilyn Monroe"
    },
    {
      'image': "https://smartkit.wrteam.in/smartkit/quotes/logo.png",
      'quote': "My mother used to tell me that when push comes to shove, you always know who to turn to. That being a family isn't a social construct but an instinct.",
      'auth_name': "Jodi Picoult"
    },
    {'image': "https://smartkit.wrteam.in/smartkit/quotes/logo.png", 'quote': "Happiness is having a large, loving, caring, close-knit family in another city.", 'auth_name': "George Burns"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldkey,
        appBar: AppBar(
          title: Text(appName),
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [quotes2, quotes3], stops: [0, 1])),
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: new SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: new Column(children: <Widget>[
                    getImage(),
                    getAuthorname(),
                    getBorder(),
                    Container(
                      // color: Colors.amber,
                      child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: new GridView.builder(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: quotelist.length,
                            gridDelegate:
                                //SliverGridDelegateWithFixedCrossAxisCount
                                new SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              _scaffoldKey = new GlobalObjectKey<ScaffoldState>(index);
                              return getGridItem(index, context);
                            },
                          )),
                    ),
                  ])),
            ),
          ],
          // ],
          // )
        ));
  }

  getAuthorname() {
    return Container(
      color: Colors.white,
      child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(widget.name, style: Theme.of(context).textTheme.headline5.copyWith(color: quotes2)),
          )),
    );
  }

  Widget getBorder() {
    return Container(
      height: 1.5,
      color: quotes2,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    );
  }

  Widget getImage() {
    return Hero(
        tag: widget.id,
        child: Container(
          height: MediaQuery.of(context).size.height * .40,
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new CachedNetworkImageProvider(
                widget.image,
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Stack(alignment: Alignment.bottomLeft, children: <Widget>[
            CachedNetworkImage(imageUrl: "https://smartkit.wrteam.in/smartkit/quotes/curve.png"),
          ]),
        ));
  }

  Widget getGridItem(int index, BuildContext context) {
    return RepaintBoundary(
        key: _scaffoldKey,
        child: new GestureDetector(
          child: new Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 1.8,
              child: Container(
                  color: Colors.white,
                  // decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, stops: [0.1, 0.9], colors: [quotes2, quotes3])),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceAround, children: <Widget>[
                      CachedNetworkImage(
                        imageUrl: "https://smartkit.wrteam.in/smartkit/quotes/inverted.png",
                        color: Colors.white,
                        height: 25,
                      ),
                      Text(
                        quotelist[index]['quote'],
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black54, height: 1.0, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "-" + quotelist[index]['auth_name'],
                            style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 10),
                          )),
                      new Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                        new ClipOval(
                          child: Container(
                            width: 30,
                            height: 30,
                            color: primary,
                            child: new IconButton(
                              icon: Icon(
                                Icons.content_copy,
                                color: Colors.white,
                                size: 15,
                              ),
                              tooltip: 'Copy',
                              onPressed: () {
                                Clipboard.setData(new ClipboardData(text: quotelist[index]['quote'] + " ~" + quotelist[index]['auth_name']));
                                ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                                  content: new Text("Text copied to clipboard"),
                                ));
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        new ClipOval(
                          child: Container(
                            width: 30,
                            height: 30,
                            color: primary,
                            child: new IconButton(
                              icon: Icon(
                                Icons.share,
                                color: Colors.white,
                                size: 15,
                              ),
                              tooltip: 'Share',
                              onPressed: () {
                                Share.share(quotelist[index]['quote'] + "\n" + "-" + quotelist[index]['auth_name'] + "\n" + "Share from Quotes");
                              },
                            ),
                          ),
                        ),
                      ]),
                    ]),
                  ))),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QuotePage(),
              ),
            );
          },
        ));
  }
}
