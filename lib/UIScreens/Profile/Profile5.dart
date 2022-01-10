import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

const String name = "name";
const String dob = "dob";
const String bio = "bio";
const String profile = "image";
const String photoes = "posts";
const String email = "email";
const String phone = "phone";
const String city = "city";
const String web = "website";

class Profile5 extends StatefulWidget {
  @override
  _MainCollapsingToolbarState createState() => _MainCollapsingToolbarState();
}

class _MainCollapsingToolbarState extends State<Profile5> {
  List list;
  bool loading = true;

  /* final List<String> _listImage = [
    "https://smartkit.wrteam.in/smartkit/images/back1.jpg",
    "https://smartkit.wrteam.in/smartkit/images/back2.jpg",
    "https://smartkit.wrteam.in/smartkit/images/back3.jpg",
    "https://smartkit.wrteam.in/smartkit/images/back4.jpg",
    "https://smartkit.wrteam.in/smartkit/images/back5.jpg",
    "https://smartkit.wrteam.in/smartkit/images/back6.jpg"
  ];
*/
  @override
  Widget build(BuildContext context) {
    list = [
      {'img': "https://smartkit.wrteam.in/smartkit/images/back6.jpg"},
      {'img': "https://smartkit.wrteam.in/smartkit/images/back7.jpg"},
      {'img': "https://smartkit.wrteam.in/smartkit/images/back3.jpg"},
      {'img': "https://smartkit.wrteam.in/smartkit/images/back1.jpg"},
    ];
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.black,
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("Stephanie	King",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                  background: Stack(children: <Widget>[
                    Image(image: CachedNetworkImageProvider("https://smartkit.wrteam.in/smartkit/images/profile2.png"), width: double.infinity, height: double.infinity, fit: BoxFit.fill),
                    Positioned(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ),
                    Center(
                      child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 52,
                          child: CircleAvatar(
                            radius: 50.0,
                            backgroundImage: CachedNetworkImageProvider("https://smartkit.wrteam.in/smartkit/images/profile2.png"),
                            backgroundColor: Colors.white,
                          )),
                    ),
                  ]),
                ),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey[600],
                    indicatorColor: Colors.white,
                    tabs: [
                      Tab(icon: Icon(Icons.info), text: "About"),
                      Tab(icon: Icon(Icons.format_list_bulleted), text: "Post"),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              first_tab(),
              // Icon(Icons.directions_car),
              second_tab(),
            ],
          ),
        ),
      ),
    );
  }

  Widget profile_info() {
    return Container(
      height: MediaQuery.of(context).size.height * .35,
      width: double.infinity,
      decoration: BoxDecoration(
        // Box decoration takes a gradient
        gradient: LinearGradient(
          // Where the linear gradient begins and ends
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          // Add one stop for each color. Stops should increase from 0 to 1
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            Colors.red[300],
            Colors.red[300],
            Colors.deepOrange[300],
            Colors.deepOrange[200],
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Hero(
              tag: 'profile',
              child: CachedNetworkImage(
                imageUrl: list[0][profile],
                fit: BoxFit.cover,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .35,
              )),
        ],
      ),
    );
  }

  Widget first_tab() {
    return Container(
        padding: new EdgeInsets.only(top: 10, right: 20.0, left: 20.0),
        child: new Container(
            width: MediaQuery.of(context).size.width,
            child: Card(
                color: Colors.white,
                elevation: 4.0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.email,
                          ),
                        ),
                        Text(
                          "demo@demo.com",
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.phone,
                          ),
                        ),
                        Text(
                          "545644454",
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.cake,
                          ),
                        ),
                        Text(
                          "1996-12-20",
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.public,
                          ),
                        ),
                        Text(
                          "www.google.com",
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.info_outline,
                          ),
                        ),
                        Flexible(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                          ),
                        )),
                      ],
                    ),
                  ],
                ))));
  }

  Widget second_tab() {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                elevation: 5.0,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 15.0,
                              backgroundImage: CachedNetworkImageProvider("https://smartkit.wrteam.in/smartkit/images/profile2.png"),
                              backgroundColor: Colors.white,
                            )),
                        Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "Afdf dfd",
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                                Text(
                                  "3h ago",
                                  style: Theme.of(context).textTheme.caption,
                                  textAlign: TextAlign.left,
                                )
                              ],
                            ))
                      ],
                    ),
                    new Image(
                      image: CachedNetworkImageProvider(list[index]['img']),
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.fill,
                    ),
                    ButtonTheme(
                        child: ButtonBar(children: <Widget>[
                      IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            final snackBar = SnackBar(
                              content: Text('Like  Button Pressed..!'),
                              action: SnackBarAction(
                                label: 'Like',
                                onPressed: () {
                                  // Some code to undo the change!
                                },
                              ),
                            );

                            // Find the Scaffold in the Widget tree and use it to show a SnackBar!
                            Scaffold.of(context).showSnackBar(snackBar);
                          }),
                      Text("34"),
                      IconButton(
                          icon: Icon(Icons.bookmark_border),
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
                            Scaffold.of(context).showSnackBar(snackBar);
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
                            Scaffold.of(context).showSnackBar(snackBar);
                          })
                    ])),
                  ],
                )),
          );
        });
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
      color: Colors.black,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
