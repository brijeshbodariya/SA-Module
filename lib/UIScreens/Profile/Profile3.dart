import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class profile3 extends StatefulWidget {
  @override
  _Social_SilverState createState() => _Social_SilverState();
}

class _Social_SilverState extends State<profile3> {
  final controller = ScrollController();
  double appBarHeight = 250.0, tabAppBarHeight = 300;
  List list;
  bool loading = true;
  bool useMobileLayout;
  @override
  Widget build(BuildContext context) {
    list = [
      {'img': "https://smartkit.wrteam.in/smartkit/images/back6.jpg"},
      {'img': "https://smartkit.wrteam.in/smartkit/images/back7.jpg"},
      {'img': "https://smartkit.wrteam.in/smartkit/images/back3.jpg"},
      {'img': "https://smartkit.wrteam.in/smartkit/images/back1.jpg"},
    ];

    var shortestSide = MediaQuery.of(context).size.shortestSide;

// Determine if we should use mobile layout or not, 600 here is
// a common breakpoint for a typical 7-inch tablet.
    useMobileLayout = shortestSide < 600;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
          body: Center(
              child: CustomScrollView(
        controller: controller,
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.black,
            pinned: true,
            expandedHeight: useMobileLayout ? appBarHeight : tabAppBarHeight,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text("Diana	White",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    )),
                background: Stack(
                  children: <Widget>[
                    Image(
                      image: CachedNetworkImageProvider("https://smartkit.wrteam.in/smartkit/images/profile2.png"),
                      fit: BoxFit.fill,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.5),
                    )
                  ],
                )),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
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
                                    "User $index",
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
                        image: CachedNetworkImageProvider(
                          list[index]["img"],
                        ),
                        width: double.infinity,
                        height: useMobileLayout ? 200 : 250,
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
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
            );
          }, childCount: list.length))
        ],
      ))),
    );
  }
}
