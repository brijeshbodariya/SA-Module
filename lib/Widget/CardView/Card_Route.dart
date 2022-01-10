import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitAppbar.dart';
import 'package:smartkit/Widget/flare/flare_actor.dart';

import 'Card1.dart';
import 'Card2.dart';
import 'Card3.dart';

class Card_Route extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CardBasicState();
}

class _CardBasicState extends State<Card_Route> {
  BuildContext scaffoldContext;
  static final double containerSize = 20.0;

  // Wheather this element is a favorite or not.
  bool _isFav = false;
  bool _isFavSmall = false;
  bool _isFavSmall2 = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(56),
            child: SmartKitAppbar(
              title: "Card List",
            )),
        body: ListView(children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 15, bottom: 8, top: 20, right: 15),
            child: Text(
              "WrCard1",
              style: TextStyle(fontSize: 20.0, color: Color(0xff5AD2F1), fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 3, bottom: 3, left: 16),
            alignment: Alignment.bottomLeft,
            child: Container(
              width: 70,
              height: 3,
              decoration: BoxDecoration(
                color: Colors.pink[200],
                // color: Color(0xff5AD2F1).withOpacity(0.50),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, bottom: 0, top: 20, right: 15),
            height: MediaQuery.of(context).size.height / 2 - 90,
            child: ListView(physics: ScrollPhysics(), scrollDirection: Axis.horizontal, shrinkWrap: true, children: [
              WrCard1(
                image: "https://smartkit.wrteam.in/smartkit/images/image_1.png",
                title: "Aloe vera",
                country: "Plants",
                price: 240,
                press: () {},
              ),
              WrCard1(
                image: "https://smartkit.wrteam.in/smartkit/images/image_2.png",
                title: "Aloes",
                country: "Plant",
                price: 340,
                press: () {},
              ),
              WrCard1(
                image: "https://smartkit.wrteam.in/smartkit/images/image_3.png",
                title: "Neofinetia",
                country: "Plant",
                price: 440,
                press: () {},
              ),
            ]),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, bottom: 8, top: 20, right: 15),
            child: Text(
              "WrCard2",
              style: TextStyle(fontSize: 20.0, color: Colors.pink[300], fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 3, bottom: 3, left: 16),
            alignment: Alignment.bottomLeft,
            child: Container(
              width: 70,
              height: 3,
              decoration: BoxDecoration(
                color: Color(0xff5AD2F1),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, bottom: 8, top: 20, right: 15),
            child: WrCard2(
              image: "https://smartkit.wrteam.in/smartkit/images/facebook.jpg",
              title: "Lamborghini",
              isFav: false,
              raters: 14,
              rating: 5.4,
              onTap: () {},
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, bottom: 8, top: 20, right: 15),
            child: Text(
              "WrCard3",
              style: TextStyle(fontSize: 20.0, color: Color(0xff5AD2F1), fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 3, bottom: 3, left: 16),
            alignment: Alignment.bottomLeft,
            child: Container(
              width: 70,
              height: 3,
              decoration: BoxDecoration(
                color: Colors.pink[200],
                // color: Color(0xff5AD2F1).withOpacity(0.50),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, bottom: 0, top: 20, right: 15),
            height: MediaQuery.of(context).size.height / 2,
            child: ListView(physics: ScrollPhysics(), scrollDirection: Axis.horizontal, shrinkWrap: true, children: [
              WrCard3(
                width: MediaQuery.of(context).size.width / 2,
                imgheight: MediaQuery.of(context).size.width / 2,
                image: "https://smartkit.wrteam.in/smartkit/images/Nikereak3.jpg",
                title: "Nike reak",
                isFav: false,
                raters: 50,
                rating: 3.5,
                onTap: () {},
              ),
              SizedBox(
                width: 20.0,
              ),
              WrCard3(
                width: MediaQuery.of(context).size.width / 2,
                imgheight: MediaQuery.of(context).size.width / 2,
                image: "https://smartkit.wrteam.in/smartkit/images/Nikereak1.jpg",
                title: "Nike Air Max",
                isFav: true,
                raters: 50,
                rating: 4.5,
                onTap: () {},
              ),
              SizedBox(
                width: 20.0,
              ),
              WrCard3(
                width: MediaQuery.of(context).size.width / 2,
                imgheight: MediaQuery.of(context).size.width / 2,
                image: "https://smartkit.wrteam.in/smartkit/images/Nikereak1.jpg",
                title: "Metcon",
                isFav: false,
                raters: 50,
                rating: 2.5,
                onTap: () {},
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: (Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image(
                    image: new CachedNetworkImageProvider('https://smartkit.wrteam.in/smartkit/images/drawer.jpeg'),
                    fit: BoxFit.cover,
                  ),
                  const ListTile(
                    title: Text('The Enchanted Nightingale'),
                    subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                  ),
                  ButtonTheme(
                    // make buttons use the appropriate styles for cards
                    child: ButtonBar(
                      children: <Widget>[
                        TextButton(
                          child: const Text('SHARE'),
                          onPressed: () {
                            final snackBar = SnackBar(
                              content: Text('Share  Button Pressed..!'),
                              action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {
                                  // Some code to undo the change!
                                },
                              ),
                            );

                            // Find the Scaffold in the Widget tree and use it to show a SnackBar!
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          },
                        ),
                        TextButton(
                          child: const Text('EXPLORE'),
                          onPressed: () {
                            final snackBar = SnackBar(
                              content: Text('Explore  Button Pressed..!'),
                              action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {
                                  // Some code to undo the change!
                                },
                              ),
                            );

                            // Find the Scaffold in the Widget tree and use it to show a SnackBar!
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5.0,
                child: Column(
                  children: <Widget>[
                    Image(
                      image: new CachedNetworkImageProvider('https://smartkit.wrteam.in/smartkit/images/drawer.jpeg'),
                    ),
                    ButtonTheme(
                        child: ButtonBar(children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          // Toggle the state:
                          // This'll cause this widget to rebuild
                          // and the animation will be swapped.
                          setState(() {
                            _isFav = !_isFav;
                          });
                        },
                        child: Row(children: [
                          Container(
                              margin: EdgeInsets.only(right: 10),
                              width: containerSize,
                              height: containerSize,
                              child: FlareActor("assets/Favorite.flr",
                                  shouldClip: false,
                                  // Play the animation depending on the state.
                                  animation: _isFav ? "Favorite" : "Unfavorite" //_animationName

                                  )),
                          Text(
                            "Like",
                            style: TextStyle(fontSize: 11, fontFamily: "Montserrat", color: Colors.black45),
                          ),
                        ]),
                      ),
                      IconButton(
                          icon: Icon(Icons.bookmark),
                          onPressed: () {
                            final snackBar = SnackBar(
                              content: Text('Bookmark  Button Pressed..!'),
                              action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {
                                  // Some code to undo the change!
                                },
                              ),
                            );

                            // Find the Scaffold in the Widget tree and use it to show a SnackBar!
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }),
                      IconButton(
                          icon: Icon(Icons.share),
                          onPressed: () {
                            final snackBar = SnackBar(
                              content: Text('Share..!'),
                              action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {
                                  // Some code to undo the change!
                                },
                              ),
                            );

                            // Find the Scaffold in the Widget tree and use it to show a SnackBar!
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          })
                    ])),
                  ],
                )),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <Widget>[
            new Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5.0,
                      child: Column(
                        //mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Image(
                            image: new CachedNetworkImageProvider('https://smartkit.wrteam.in/smartkit/images/drawer.jpeg'),
                          ),
                          ButtonTheme(
                              // make buttons use the appropriate styles for cards
                              child: ButtonBar(children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                // Toggle the state:
                                // This'll cause this widget to rebuild
                                // and the animation will be swapped.
                                setState(() {
                                  _isFavSmall = !_isFavSmall;
                                });
                              },
                              child: Row(children: [
                                Container(
                                    margin: EdgeInsets.only(right: 10),
                                    width: containerSize,
                                    height: containerSize,
                                    child: FlareActor("assets/Favorite.flr",
                                        shouldClip: false,
                                        // Play the animation depending on the state.
                                        animation: _isFavSmall ? "Favorite" : "Unfavorite" //_animationName
                                        )),
                              ]),
                            ),
                            IconButton(icon: Icon(Icons.share), onPressed: () {})
                          ])),
                        ],
                      )),
                ),
                flex: 1),
            new Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5.0,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image(
                          image: new CachedNetworkImageProvider('https://smartkit.wrteam.in/smartkit/images/drawer.jpeg'),
                        ),
                        ButtonTheme(
                            // make buttons use the appropriate styles for cards
                            child: ButtonBar(children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              // Toggle the state:
                              // This'll cause this widget to rebuild
                              // and the animation will be swapped.
                              setState(() {
                                _isFavSmall2 = !_isFavSmall2;
                              });
                            },
                            child: Row(children: [
                              Container(
                                  margin: EdgeInsets.only(right: 10),
                                  width: containerSize,
                                  height: containerSize,
                                  child: FlareActor("assets/Favorite.flr",
                                      shouldClip: false,
                                      // Play the animation depending on the state.
                                      animation: _isFavSmall2 ? "Favorite" : "Unfavorite" //_animationName
                                      )),
                            ]),
                          ),
                          IconButton(
                              icon: Icon(Icons.share),
                              onPressed: () {
                                final snackBar = SnackBar(
                                  content: Text('Share..!'),
                                  action: SnackBarAction(
                                    label: 'Undo',
                                    onPressed: () {
                                      // Some code to undo the change!
                                    },
                                  ),
                                );

                                // Find the Scaffold in the Widget tree and use it to show a SnackBar!
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              })
                        ])),
                      ],
                    ),
                  ),
                ),
                flex: 1),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
              ),
            )
          ]),
        ]));
  }
}
