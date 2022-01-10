import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/FullApp/BookKing/databaseHelper/BookKingdbhelper.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitHome.dart';

import '../Model/BookKingCategory.dart';
import 'BookKingBookmarkList.dart';
import 'BookKingChapterList.dart';
import 'BookKingDetailPage.dart';
import 'BookKingListSearch.dart';

class BookKingHome extends StatefulWidget {
  BookKingHome({Key key}) : super(key: key);

  @override
  _BookKingHomeState createState() => _BookKingHomeState();
}

class _BookKingHomeState extends State<BookKingHome> {
  Icon searchIcon = Icon(Icons.search);
  int catid;
  String title;
  // Widget cusSearchBar =
  final key = new GlobalKey<ScaffoldState>();
  // static final DatabaseHelper instance = DatabaseHelper.privateConstructor();

  @override
  void initState() {
    getTitle();
    getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(),
          ),
        );
      },
      child: Scaffold(
          key: key,
          appBar: AppBar(
              flexibleSpace: Container(
                decoration: BoxDecoration(gradient: bookKinggradient),
              ),
              title: Center(
                child: Row(
                  children: [
                    SvgPicture.asset("assets/bookking.svg", color: Colors.white),
                    SizedBox(
                      width: 35.0,
                    ),
                    Text(
                      "How to get Rich?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Open sans',
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                IconButton(
                  icon: searchIcon,
                  onPressed: () {
                    Navigator.push(context, new MaterialPageRoute(builder: (context) => new BookKingListSearch()));
                  },
                ),
              ]),
          body: FutureBuilder(
              //Fetching all the persons from the list using the istance of the DatabaseHelper class
              future: getCategorydata(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                //Checking if we got data or not from the DB
                if (snapshot.hasData) {
                  return ListView.separated(
                    itemCount: snapshot.data.length,
                    separatorBuilder: (BuildContext context, int index) => Divider(
                      color: Colors.white,
                      height: 5,
                      thickness: 8,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      BookKingCategory item = snapshot.data[index];
                      return ListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                        dense: true,
                        tileColor: bookKing1,
                        title: Text(item.title, style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: 'Times new Roman')),
                        onTap: () {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                              builder: (context) => BookKingChapterList(
                                id: item.id,
                                title: item.title,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                } else {
                  return new CircularProgressIndicator();
                }
              }),
          floatingActionButton: new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              //Bookmark
              Container(
                child: new FloatingActionButton(
                  mini: true,
                  heroTag: null,
                  child: new Icon(Icons.grade),
                  backgroundColor: bookKing2,
                  onPressed: () {
                    Navigator.push(context, new MaterialPageRoute(builder: (context) => new BookKingBookmarkList()));
                  },
                ),
              ),
              SizedBox(height: 15.0),
              //Indicator
              Container(
                child: new FloatingActionButton(
                    mini: true,
                    heroTag: null,
                    child: new Icon(Icons.bookmark),
                    backgroundColor: bookKing2,
                    onPressed: () async {
                      await getTitle();
                      await getCategory();
                      if (catid == null) {
                        ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                          duration: Duration(seconds: 1),
                          content: new Text(
                            "Indicator not set !",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontFamily: 'Times new Roman'),
                          ),
                        ));
                      } else {
                        Navigator.push(context, new MaterialPageRoute(builder: (context) => new BookKingDetailPage(id1: catid, title: title)));
                      }
                    }),
              ),
            ],
          )),
    );
  }

  Future<String> getTitle() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    title = preferences.getString("Title");
    // print("Title- is ---$title");
    return title;
  }

  Future<int> getCategory() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    catid = preferences.getInt("Category");
    // print("Category id----" + preferences.getInt("Category").toString());
    return catid;
  }
}
