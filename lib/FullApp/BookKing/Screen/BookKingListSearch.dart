import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/FullApp/BookKing/Model/BookKingDetail.dart';
import 'package:smartkit/FullApp/BookKing/databaseHelper/BookKingdbhelper.dart';

import 'BookKingDetailPage.dart';

class BookKingListSearch extends StatefulWidget {
  final int id;
  BookKingListSearch({Key key, this.id}) : super(key: key);
  BookKingListSearchState createState() => BookKingListSearchState();
}

class BookKingListSearchState extends State<BookKingListSearch> {
  List<BookKingDetail> item = [];
  List<BookKingDetail> _notesForDisplay = [];
  TextEditingController _textController = TextEditingController();

  // static final DatabaseHelper instance = DatabaseHelper.privateConstructor();
  bool typing = false;

  //highlighttext
  String source, query;
  List<TextSpan> highlightOccurrences(source, query) {
    if (query == null || query.isEmpty) {
      return [TextSpan(text: source)];
    }
    var matches = <Match>[];
    for (final token in query.trim().toLowerCase().split(' ')) {
      matches.addAll(token.allMatches(source.toLowerCase()));
    }
    if (matches.isEmpty) {
      return [TextSpan(text: source)];
    }
    matches.sort((a, b) => a.start.compareTo(b.start));
    int lastMatchEnd = 0;
    final List<TextSpan> children = [];
    for (final match in matches) {
      if (match.end <= lastMatchEnd) {
        // already matched -> ignore
      } else if (match.start <= lastMatchEnd) {
        children.add(TextSpan(
          text: source.substring(lastMatchEnd, match.end),
          style: TextStyle(backgroundColor: bookKing3, color: Colors.white),
        ));
      } else if (match.start > lastMatchEnd) {
        children.add(TextSpan(
          text: source.substring(lastMatchEnd, match.start),
        ));

        children.add(TextSpan(
          text: source.substring(match.start, match.end),
          style: TextStyle(backgroundColor: bookKing2, color: Colors.white),
        ));
      }

      if (lastMatchEnd < match.end) {
        lastMatchEnd = match.end;
      }
    }

    if (lastMatchEnd < source.length) {
      children.add(TextSpan(
        text: source.substring(lastMatchEnd, source.length),
      ));
    }

    return children;
  }

  @override
  void initState() {
    setState(() {
      getSearch().then((value) {
        item.addAll(value);
        _notesForDisplay = item;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(gradient: bookKinggradient),
            ),
            title: typing
                ? Text("How to get Rich")
                : TextField(
                    style: TextStyle(color: Colors.white, fontFamily: 'Times new Roman', fontSize: 18),
                    cursorColor: Colors.white,
                    autofocus: true,
                    controller: _textController,
                    decoration: new InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search...',
                      hintStyle: TextStyle(color: Colors.white60, fontFamily: 'Times new Roman', fontSize: 18),
                    ),
                    onChanged: (text) {
                      text = text.toLowerCase();
                      setState(() {
                        query = text;
                        _notesForDisplay = item.where((items) {
                          var noteTitle = items.title.toLowerCase();
                          return noteTitle.contains(text);
                        }).toList();
                      });
                    }),
            actions: <Widget>[
              IconButton(
                icon: Icon(typing ? Icons.search : Icons.clear),
                onPressed: () {
                  setState(() {
                    typing = !typing;
                    _textController.clear();
                    query = "";
                    _notesForDisplay = item;
                  });
                },
              ),
              IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {
                    setState(() {
                      showMenu<String>(
                        color: bookKing2,
                        context: context,
                        position: RelativeRect.fromLTRB(24.0, 25.0, 0.0, 0.0),
                        items: [
                          PopupMenuItem<String>(child: Text('Share', style: TextStyle(color: Colors.white)), value: '0'),
                          PopupMenuItem<String>(child: Text('Rate Us', style: TextStyle(color: Colors.white)), value: '1'),
                        ],
                        elevation: 7.0,
                      ).then<void>((String itemSelected) {
                        // if (itemSelected == null) return;
                        // if (itemSelected == "0") {
                        //   // PopupMenuItem(
                        //   //   value: Share.share('https://play.google.com/store/apps/details? id=com.book.reading'),
                        //   //   child: null,
                        //   // );
                        // } else if (itemSelected == "1") {
                        //   // LaunchReview.launch(
                        //   //   androidAppId: "com.example.ebook",
                        //   //   iOSAppId: "585027354",
                        //   // );
                        // }
                      });
                    });
                  })
            ]),
        body: FutureBuilder(
            //Fetching all the persons from the list using the istance of the DatabaseHelper class
            future: getSearch(),
            builder: (context, index) {
              //Checking if we got data or not from the DB
              return ListView.separated(
                  itemCount: _notesForDisplay.length,
                  separatorBuilder: (BuildContext context, int index) => Divider(
                        color: Colors.white,
                        height: 5,
                        thickness: 8,
                      ),
                  itemBuilder: (context, index) {
                    var item = _notesForDisplay[index];
                    return ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                      dense: true,
                      tileColor: bookKing1,
                      leading: Text(
                        item.id.toString() + '.',
                        style: TextStyle(fontSize: 20, color: Colors.black, fontFamily: 'Times new Roman'),
                      ),
                      title: RichText(
                        text: TextSpan(
                          children: highlightOccurrences(item.title, query),
                          style: TextStyle(fontSize: 20, color: Colors.black, fontFamily: 'Times new Roman'),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              settings: RouteSettings(
                                arguments: item,
                              ),
                              builder: (context) => BookKingDetailPage(
                                    id1: item.id,
                                    title: item.title,
                                  )),
                        );
                      },
                    );
                  });
            }));
  }
}
