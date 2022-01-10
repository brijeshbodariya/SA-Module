import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';

import '../QuotesMain.dart';
import 'QuotePage.dart';

class QuotesLatest extends StatefulWidget {
  QuotesLatest({Key key}) : super(key: key);

  @override
  _QuotesLatestState createState() => _QuotesLatestState();
}

class _QuotesLatestState extends State<QuotesLatest> {
  static GlobalObjectKey<ScaffoldState> _scaffoldKey;
  List listLatest = [
    {'image': "https://smartkit.wrteam.in/smartkit/images/anim_back1.jpg", 'quote': "Be yourself; everyone else is already taken.", 'auth_name': "Oscar Wilde"},
    {
      'image': "https://smartkit.wrteam.in/smartkit/images/anim_back.jpg",
      'quote': "I'm selfish, impatient and a little insecure. I make mistakes, I am out of control and at times hard to handle. But if you can't handle me at my worst, then you sure as hell don't deserve me at my best.",
      'auth_name': "Marilyn Monroe"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: listLatest.length,
        itemBuilder: (context, i) {
          _scaffoldKey = new GlobalObjectKey<ScaffoldState>(i);

          return listItem(i);
        });
  }

  Widget listItem(int i) {
    return RepaintBoundary(
        key: _scaffoldKey,
        child: Center(
          child: Column(children: <Widget>[
            GestureDetector(
              child: Card(
                  color: Colors.pink[200],
                  margin: EdgeInsets.all(7),
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 10,
                  child: Stack(
                    children: <Widget>[
                      // listLatest[i].image.toString().compareTo("") == 0
                      //     ?
                      CachedNetworkImage(
                        imageUrl: listLatest[i]['image'],
                        width: double.infinity,
                        height: MediaQuery.of(context).size.width / 1.8,
                        fit: BoxFit.fill,
                      ),

                      Container(
                          height: MediaQuery.of(context).size.width / 1.8,
                          color: Colors.black.withOpacity(0.5),
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  CachedNetworkImage(
                                    imageUrl: "https://smartkit.wrteam.in/smartkit/quotes/inverted.png",
                                    color: Colors.white,
                                    height: 25,
                                  )
                                ],
                              ),
                              Center(
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10.0),
                                      child: Text(listLatest[i]['quote'], maxLines: 6, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 18, color: Colors.white, height: 1.0, fontWeight: FontWeight.bold)))),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(left: 15.0),
                                        child: Text("~" + listLatest[i]['auth_name'],
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                            )),
                                      ),
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
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
                                                  Clipboard.setData(new ClipboardData(text: listLatest[i]['quote'] + " ~" + listLatest[i]['auth_name']));
                                                  ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                                                    content: new Text("Text copied to clipboard"),
                                                  ));
                                                },
                                              ),
                                            ),
                                          ),
                                          // SizedBox(
                                          //   width: 5,
                                          // ),
                                          // new ClipOval(
                                          //   child: Container(
                                          //     width: 30,
                                          //     height: 30,
                                          //     color: primary,
                                          //     child: new IconButton(
                                          //         icon: Icon(
                                          //           Icons.file_download,
                                          //           color: Colors.white,
                                          //           size: 15,
                                          //         ),
                                          //         tooltip: 'Download',
                                          //         onPressed: () async {
                                          //           PermissionStatus
                                          //               permission =
                                          //               await PermissionHandler()
                                          //                   .checkPermissionStatus(
                                          //                       PermissionGroup
                                          //                           .storage);
                                          //           if (permission ==
                                          //               PermissionStatus
                                          //                   .granted) {
                                          //             setState(() {
                                          //               _allowWriteFile =
                                          //                   true;
                                          //               _scaffoldKey =
                                          //                   new GlobalObjectKey<
                                          //                       ScaffoldState>(i);
                                          //               takescrshot(
                                          //                   listLatest[i].id);
                                          //             });
                                          //           } else {
                                          //             Map<PermissionGroup,
                                          //                     PermissionStatus>
                                          //                 permissions =
                                          //                 await PermissionHandler()
                                          //                     .requestPermissions([
                                          //               PermissionGroup
                                          //                   .storage
                                          //             ]);
                                          //           }
                                          //         }),
                                          //   ),
                                          // ),
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
                                                  Share.share(listLatest[i]['quote'] + "\n" + "-" + listLatest[i]['auth_name'] + "\n\n" + "Share from Quotes");
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ],
                  )),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuotePage(),
                  ),
                );
              },
            )
          ]),
        ));
  }
}
