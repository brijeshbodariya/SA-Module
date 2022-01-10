import 'package:flutter/material.dart';
import 'package:launch_review/launch_review.dart';
import 'package:share/share.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/FullApp/BookKing/Model/BookKingDetail.dart';
import 'package:smartkit/FullApp/BookKing/databaseHelper/BookKingdbhelper.dart';
import '../Model/BookKingBookmark.dart';
import '../databaseHelper/BookKingBookmarkDbHelper.dart';
import 'BookKingDetailPage.dart';

class BookKingBookmarkList extends StatefulWidget {
  final int id;
  BookKingBookmarkList({Key key, this.id}) : super(key: key);

  @override
  _BookKingBookmarkListState createState() => _BookKingBookmarkListState();
}

class _BookKingBookmarkListState extends State<BookKingBookmarkList> {
  // static final BookKingBookmarkHelper instance = BookKingBookmarkHelper.privateConstructor();

  TextEditingController _textController = TextEditingController();

  List<BookKingBookmark> item = [];
  List<BookKingBookmark> _notesForDisplay = [];
  BookKingBookmark it;
  bool typing = false;
  String query;
  //dynamic source;

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
      getBookmarksdata().then((value) {
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
              ? TextField(
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
                        print("in search op");
                        var noteTitle = items.vid.toString().toLowerCase();
                        return noteTitle.contains(text);
                      }).toList();
                    });
                  })
              : Text("Bookmark List", style: TextStyle(color: Colors.white)),
          actions: <Widget>[
            IconButton(
              icon: Icon(typing ? Icons.clear : Icons.search),
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
                      if (itemSelected == null) return;
                      if (itemSelected == "0") {
                        PopupMenuItem(
                          value: Share.share('https://play.google.com/store/apps/details? id=com.book.reading'),
                          child: null,
                        );
                      } else if (itemSelected == "1") {
                        LaunchReview.launch(
                          androidAppId: "com.example.ebook",
                          iOSAppId: "585027354",
                        );
                      }
                    });
                  });
                })
          ]),
      body: FutureBuilder(
          //Fetching all the persons from the list using the istance of the DatabaseHelper class
          future: getBookmarksdata(),
          // initialData: [instance1.getDetail1(widget.id),],
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                  shrinkWrap: true,
                  itemCount: _notesForDisplay.length,
                  separatorBuilder: (BuildContext context, int index) => Divider(
                        color: Colors.white,
                        height: 5,
                        thickness: 8,
                      ),
                  itemBuilder: (context, index) {
                    //Bookmark  it= snapshot.data[index] as Bookmark;
                    it = _notesForDisplay[index++];
                    print('IT: ${it}');
                    return ListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                        dense: true,
                        tileColor: bookKing1,
                        leading: RichText(text: TextSpan(children: highlightOccurrences("$index.", query), style: TextStyle(fontSize: 20, color: Colors.black, fontFamily: 'Times new Roman'))),
                        title: BookmarkTitle(v_id: it.vid)
                        // RichText(text:TextSpan(children: highlightOccurrences(BookmarkTitle(v_id: it.v_id.toString(),),query)))
                        );
                  });
            } else {
              return new CircularProgressIndicator();
            }
          }),
    );
  }
}

class BookmarkTitle extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final int v_id;

  // ignore: non_constant_identifier_names
  BookmarkTitle({Key key, this.v_id}) : super(key: key);
  @override
  _BookmarkTitleState createState() => _BookmarkTitleState();
}

class _BookmarkTitleState extends State<BookmarkTitle> {
  // static final DatabaseHelper instance = DatabaseHelper.privateConstructor();
  List<BookKingDetail> item = [];
  List<BookKingDetail> _notesForDisplay = [];
  @override
  void initState() {
    setState(() {
      getDetail1(widget.v_id).then((value) {
        item.addAll(value);
        _notesForDisplay = item;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getDetail1(widget.v_id),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          //Checking if we got data or not from the DB
          if (snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: _notesForDisplay.length,
                itemBuilder: (context, index) {
                  var item = _notesForDisplay[index];
                  debugPrint("listbookssss----" + item.id.toString());
                  return ListTile(
                    title: Text(item.title, style: TextStyle(fontSize: 20, color: Colors.black, fontFamily: 'Times new Roman')),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BookKingDetailPage(
                                  id1: item.id,
                                  title: item.title,
                                )),
                      );
                    },
                  );
                });
          } else {
            return Center(child: new CircularProgressIndicator());
          }
        });
  }
}
