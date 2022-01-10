import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:screen/screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/FullApp/BookKing/Model/BookKingDetail.dart';
import 'package:smartkit/FullApp/BookKing/databaseHelper/BookKingdbhelper.dart';
import '../Model/BookKingBookmark.dart';
import 'BookKingBookmarkList.dart';
import '../databaseHelper/BookKingBookmarkDbHelper.dart';

class BookKingDetailPageDesktop extends StatefulWidget {
  final int id1;
  final String title;
  BookKingDetailPageDesktop({Key key, this.id1, this.title}) : super(key: key);

  @override
  _BookKingDetailPageDesktopState createState() => _BookKingDetailPageDesktopState();
}

class _BookKingDetailPageDesktopState extends State<BookKingDetailPageDesktop> {
  // static final DatabaseHelper instance = DatabaseHelper.privateConstructor();
  // static final BookKingBookmarkHelper instance1 = BookKingBookmarkHelper.privateConstructor();

  IconData indicatorIcon = Icons.bookmark_border;
  IconData bookmarkIcon = Icons.star_border;
  IconData scrollIcon = Icons.play_arrow;

  //List<detail> item = List<detail>();
  TextEditingController _textController = TextEditingController();
  ScrollController _scrollController = ScrollController();
  final key = new GlobalKey<ScaffoldState>();
  BookKingDetail item;
  double brightness = 0.1, _fontSize = 18, speedFactor = 15;
  bool _isVisible = false, bmark = true, typing = false, scrollText = true, scroll = false;
  int catId = 0, ccatId, bbmarkId;

  Color _tempMainColor, _mainColor = Colors.black;

  BookKingBookmark book;
  //get bookmarkIcon
  _restorebmark() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool("bookmark") ?? true;
  }

//set bookmarkIcon
  _bmark() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setBool("bookmark", bmark);
  }

//indicator move to main page
  setCategory(int catID) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt("Category", catID);
  }

  //set title for indicator page
  setTitle(String title) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("Title", title);
  }

  //set indicator in current page
  setIndicator() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setInt("In", ccatId);
  }

  getIndicator() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt("In");
  }

  setBookmarkId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setInt("bb", bbmarkId);
  }

  getBookmarkId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt("bb");
  }

  //brightness
  getBrightnessSlider() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.getDouble('brightness');
  }

//text color
  setColorSlider() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setInt('Color', _mainColor.value);
  }

  getColorSlider() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    Color myColor = Color(preferences.getInt('Color') ?? _mainColor.value);
    return myColor;
  }

  setFontSlider() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setDouble('Font', _fontSize);
    print("font size");
  }

  getFontSlider() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getDouble('Font');
  }

//reset font color ,text size,brightness
  resets() async {
    SharedPreferences prefrences = await SharedPreferences.getInstance();
    await prefrences.remove('Color');
    await prefrences.remove('Font');
    await prefrences.remove('brightness');
    setState(
      () {
        _mainColor = Colors.black;
        _fontSize = 18;
        Screen.setBrightness(0.03);
      },
    );
  }

//search Highlight
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
        children.add(
          TextSpan(
            text: source.substring(lastMatchEnd, match.end),
            style: TextStyle(
              backgroundColor: Color(0xff9a0b0b),
              color: Colors.white,
            ),
          ),
        );
      } else if (match.start > lastMatchEnd) {
        children.add(
          TextSpan(
            text: source.substring(lastMatchEnd, match.start),
          ),
        );

        children.add(
          TextSpan(
            text: source.substring(match.start, match.end),
            style: TextStyle(backgroundColor: Color(0xff9a0b0b), color: Colors.white),
          ),
        );
      }

      if (lastMatchEnd < match.end) {
        lastMatchEnd = match.end;
      }
    }
    if (lastMatchEnd < source.length) {
      children.add(
        TextSpan(
          text: source.substring(lastMatchEnd, source.length),
        ),
      );
    }
    return children;
  }

  //scroll content
  _scroll() {
    double maxExtent = _scrollController.position.maxScrollExtent;
    double distanceDifference = maxExtent - _scrollController.offset;
    double durationDouble = distanceDifference / speedFactor;

    _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: Duration(seconds: durationDouble.toInt()), curve: Curves.linear);
  }

  _toggleScrolling() {
    setState(
      () {
        scroll = !scroll;
      },
    );

    if (scroll) {
      _scroll();
    } else {
      _scrollController.animateTo(_scrollController.offset, duration: Duration(seconds: 10), curve: Curves.linear);
    }
  }

//brightness
  // brightnessSet() async {
  //   brightness = await Screen.brightness;
  //   setState(
  //     () {
  //       brightness = brightness;
  //     },
  //   );
  // }

//color dailog
  void _openDialog() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xffFFFAF0),
          insetPadding: EdgeInsets.symmetric(horizontal: 50, vertical: 130.0),
          //contentPadding: const EdgeInsets.all(6.0),
          title: Text(
            "Set color",
            style: TextStyle(fontSize: 18, fontFamily: 'Times New Roman', color: bookKing2),
          ),
          content: MaterialColorPicker(
            onMainColorChange: (ColorSwatch color) => setState(() => _tempMainColor = color),
          ),

          actions: [
            TextButton(
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.grey, fontSize: 18, fontFamily: 'Times New Roman'),
              ),
              onPressed: Navigator.of(context).pop,
            ),
            TextButton(
              child: Text(
                'Submit',
                style: TextStyle(color: bookKing2, fontSize: 18, fontFamily: 'Times New Roman'),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() => _mainColor = _tempMainColor);
                setColorSlider();
              },
            ),
          ],
        );
      },
    );
  }

  //Brightness dialog
  Future<Null> showBrightness() async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return FittedBox(
          child: AlertDialog(
            backgroundColor: Color(0xffFFFAF0),
            insetPadding: EdgeInsets.symmetric(horizontal: 70, vertical: 350),
            title: Text(
              'Brightness',
              style: TextStyle(fontSize: 18, fontFamily: 'Times New Roman'),
            ),
            content: StatefulBuilder(
              builder: (context, state) => FittedBox(
                child: Slider(
                  value: brightness,
                  divisions: 6,
                  activeColor: bookKing2,
                  onChanged: (double b) {
                    state(
                      () {
                        setState(
                          () {
                            brightness = b;
                          },
                        );
                        Screen.setBrightness(b);
                      },
                    );
                  },
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'OK',
                  style: TextStyle(color: bookKing3, fontSize: 18, fontFamily: 'Times New Roman'),
                ),
              )
            ],
          ),
        );
      },
    );
  }

// show font dialogbox
  void showFont() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return FittedBox(
          child: AlertDialog(
            backgroundColor: Color(0xffFFFAF0),
            insetPadding: EdgeInsets.symmetric(horizontal: 70, vertical: 300),
            title: RichText(
              text: TextSpan(
                text: 'Change font Size \n \n',
                style: TextStyle(color: Colors.black, fontSize: 20, fontFamily: 'Times New Roman'),
              ),
            ),
            content: StatefulBuilder(
                builder: (context, state) => FittedBox(
                      child: Slider(
                        label: (_fontSize ?? 18).toStringAsFixed(0),
                        value: _fontSize ?? 18,
                        activeColor: bookKing2,
                        min: 18,
                        max: 40,
                        divisions: 10,
                        onChanged: (value) {
                          state(() {
                            setState(() {
                              _fontSize = value;
                              setFontSlider();
                            });
                          });
                        },
                      ),
                    )),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  setFontSlider();
                  Navigator.pop(context);
                },
                child: Text(
                  'OK',
                  style: TextStyle(color: bookKing3, fontSize: 18, fontFamily: 'Times New Roman'),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  //color
  colorPicker() async {
    getColorSlider().then(
      (value) {
        setState(
          () {
            _mainColor = value;
          },
        );
      },
    );
  }

  //text size
  fontSize() async {
    getFontSlider().then(
      (value) {
        setState(
          () {
            _fontSize = value;
          },
        );
      },
    );
  }

//reset dailog
  void reset() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xffFFFAF0),
          insetPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 100),
          title: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(text: 'Conform Reset operations \n \n', style: TextStyle(color: Colors.black, fontSize: 20, fontFamily: 'Times New Roman'), children: <TextSpan>[
              TextSpan(
                text: ' Are you sure?All Changes made by you will be removed..',
                style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'Times New Roman'),
              )
            ]),
          ),
          actions: [
            TextButton(
              child: Text(
                'No',
                style: TextStyle(color: Color(0xff9a0b0b), fontSize: 18, fontFamily: 'Times New Roman'),
              ),
              onPressed: Navigator.of(context).pop,
            ),
            TextButton(
              child: Text(
                'Yes',
                style: TextStyle(color: Color(0xff9a0b0b), fontSize: 18, fontFamily: 'Times New Roman'),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                resets();
              },
            ),
          ],
        );
      },
    );
  }

//indicator
  setDataIndic() async {
    getIndicator().then(
      (value) {
        setState(
          () {
            ccatId = value;
            setIconIndic();
          },
        );
      },
    );
  }

//indicator icon
  setIconIndic() async {
    if (ccatId != widget.id1) {
      setState(
        () {
          indicatorIcon = Icons.bookmark_border;
        },
      );
    } else {
      setState(
        () {
          indicatorIcon = Icons.bookmark;
        },
      );
    }
  }

  setScrollIcon() async {
    if (scrollText) {
      scrollIcon = Icons.play_arrow;
    } else {
      scrollIcon = Icons.pause;
    }
  }

//bookmark
  setDataBmark() async {
    getBookmarkId().then(
      (value) {
        setState(() {
          bbmarkId = value;
        });
      },
    );
  }

  setDataBmark1() async {
    _restorebmark().then(
      (value) {
        setState(() {
          bmark = value;
          setIconBmark();
        });
      },
    );
  }

  //bookmark icon
  setIconBmark() async {
    if (bbmarkId == widget.id1) {
      if (bmark) {
        setState(() {
          bookmarkIcon = Icons.star_border;
        });
      } else {
        setState(
          () {
            bookmarkIcon = Icons.star;
          },
        );
      }
    }
  }

  @override
  initState() {
    super.initState();
    // brightnessSet();
    setDataIndic();
    setDataBmark();
    setDataBmark1();
    getBrightnessSlider();
    colorPicker();
    fontSize();
    _scrollController.addListener(
      () {
        setState(() {
          _isVisible = _scrollController.position.userScrollDirection == ScrollDirection.forward;
        });
      },
    );
  }

  @override
  Widget build(BuildContext con) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: key,
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: bookKinggradient),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
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
                    setState(
                      () {
                        query = text;
                      },
                    );
                  },
                )
              : Text(widget.title),
          actions: <Widget>[
            IconButton(
              icon: Icon(typing ? Icons.clear : Icons.search),
              onPressed: () {
                _textController.clear();
                query = "";
                setState(
                  () {
                    typing = !typing;
                  },
                );
              },
            ),
            IconButton(
              icon: Icon(indicatorIcon),
              onPressed: () {
                if (ccatId == widget.id1) {
                  setIndicator();
                  setIconIndic();
                  setCategory(catId);
                  setTitle(widget.title);
                  ScaffoldMessenger.of(context).showSnackBar(
                    new SnackBar(
                      margin: EdgeInsets.all(70),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                      duration: Duration(seconds: 1),
                      content: new Text(
                        "Indicator set Successful !",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontFamily: 'Times new Roman'),
                      ),
                    ),
                  );
                } else {
                  setIndicator();
                  setState(
                    () {
                      getIndicator();
                      setIconIndic();
                    },
                  );
                  ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                    margin: EdgeInsets.all(70),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                    duration: Duration(seconds: 1),
                    content: new Text(
                      "Indicator set Successful !",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'Times new Roman'),
                    ),
                  ));
                }
              },
            ),
            IconButton(
              icon: Icon(bookmarkIcon),
              onPressed: () async {
                if (bbmarkId == widget.id1) {
                  if (bmark) {
                    bmark = false;

                    setBookmarkId();
                    _bmark();
                    setIconBmark();
                    // instance1.insertIntoDb(widget.id1);
                  } else {
                    bmark = true;

                    _bmark();
                    setBookmarkId();
                    setIconBmark();
                    // instance1.deleteid(widget.id1);
                  }
                }
              },
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                setState(
                  () {
                    showMenu<String>(
                      color: bookKing2,
                      context: con,
                      position: RelativeRect.fromLTRB(24.0, 25.0, 0.0, 0.0),
                      items: [
                        PopupMenuItem<String>(child: Text('Brightness', style: TextStyle(color: Colors.white)), value: '0'),
                        PopupMenuItem<String>(child: Text('Font color', style: TextStyle(color: Colors.white)), value: '1'),
                        PopupMenuItem<String>(child: Text('Text Size', style: TextStyle(color: Colors.white)), value: '2'),
                        PopupMenuItem<String>(child: Text('Reset', style: TextStyle(color: Colors.white)), value: '3'),
                      ],
                      elevation: 7.0,
                    ).then<void>(
                      (String itemSelected) {
                        if (itemSelected == null) return;
                        if (itemSelected == "0") {
                          showBrightness();
                        } else if (itemSelected == "1") {
                          _openDialog();
                        } else if (itemSelected == "2") {
                          showFont();
                        } else if (itemSelected == "3") {
                          reset();
                        } else {}
                      },
                    );
                  },
                );
              },
            )
          ],
        ),
        body: FutureBuilder(
          //Fetching all the persons from the list using the istance of the DatabaseHelper class
          future: getDetail1(widget.id1),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            //Checking if we got data or not from the DB
            if (snapshot.hasData) {
              return ListView.builder(
                  shrinkWrap: true,
                  controller: _scrollController,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    item = snapshot.data[index];
                    print('ITEM: $item');
                    catId = item.categoryId;
                    ccatId = item.id;
                    bbmarkId = item.id;
                    //book=item.Id;
                    return ccatId == widget.id1
                        ? ListTile(
                            tileColor: Color(0xffFFFAF0),
                            title: new Column(
                              children: <Widget>[
                                new Text(
                                  '${widget.title}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontFamily: 'Times new Roman',
                                    color: _mainColor,
                                  ),
                                ),
                                new Divider(
                                  color: bookKing2,
                                  height: 20.0,
                                  thickness: 3,
                                ) // add value for height or leave it blank for default
                              ],
                            ),
                            subtitle: RichText(
                              text: TextSpan(
                                children: highlightOccurrences(item.description, query),
                                style: TextStyle(fontSize: _fontSize, color: _mainColor ?? Colors.black, fontFamily: 'Times new Roman'),
                              ),
                            ),
                          )
                        : Container();
                  });
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
        bottomNavigationBar: Offstage(
          offstage: _isVisible,
          child: BottomAppBar(
            color: Color(0xffFFFAF0),
            child: FittedBox(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 20,
                  ),
                  //scrollbutton
                  FittedBox(
                    child: new FloatingActionButton(
                      mini: true,
                      heroTag: null,
                      backgroundColor: bookKing2,
                      child: Icon(scrollIcon),
                      onPressed: () {
                        setState(
                          () {
                            _toggleScrolling();
                            if (scrollText) {
                              scrollText = false;
                              setScrollIcon();
                            } else {
                              scrollText = true;
                              setScrollIcon();
                            }
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  //scroll speed slider
                  FittedBox(
                      child: Slider(
                    value: speedFactor,
                    min: 15,
                    max: 40,
                    activeColor: bookKing2,
                    onChanged: (double value) {
                      setState(() {
                        speedFactor = value;
                      });
                      _toggleScrolling();
                    },
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  //bookmarklist button
                  FittedBox(
                    child: new FloatingActionButton(
                      mini: true,
                      heroTag: null,
                      child: new Icon(
                        Icons.grade,
                        size: 10,
                      ),
                      backgroundColor: bookKing2,
                      onPressed: () {
                        Navigator.push(context, new MaterialPageRoute(builder: (context) => new BookKingBookmarkList()));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
