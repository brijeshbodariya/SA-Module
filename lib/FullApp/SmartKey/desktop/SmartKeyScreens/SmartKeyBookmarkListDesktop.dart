import 'package:flutter/material.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';

class SmartKeyBookmarkListDesktop extends StatefulWidget {
  SmartKeyBookmarkListDesktop({Key key}) : super(key: key);

  @override
  _SmartKeyBookmarkListDesktopState createState() => _SmartKeyBookmarkListDesktopState();
}

class _SmartKeyBookmarkListDesktopState extends State<SmartKeyBookmarkListDesktop> {
  List bookmarkList = [
    {'question': 'Lorem Ipsum is simply dummy', 'answer': 'Lorem Ipsum', 'note': 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'},
    {'question': 'Lorem Ipsum is simply dummy', 'answer': 'Lorem Ipsum', 'note': 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'},
    {'question': 'Lorem Ipsum is simply dummy', 'answer': 'Lorem Ipsum', 'note': 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'},
    {'question': 'Lorem Ipsum is simply dummy', 'answer': 'Lorem Ipsum', 'note': 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'},
  ];

  Widget listItem(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "${index + 1}" + ".",
                  style: TextStyle(fontWeight: FontWeight.bold, color: smartkey2),
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      bookmarkList[index]['question'],
                      style: TextStyle(fontWeight: FontWeight.bold, color: smartkey2),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        children: <Widget>[
                          Text("Answer : ", style: TextStyle(color: smartkey3)),
                          Text(bookmarkList[index]['answer'], style: TextStyle(color: smartkey3)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Row(
                        children: <Widget>[Text("Note : "), Expanded(child: Text(bookmarkList[index]['note']))],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: const EdgeInsets.all(0.0),
                        width: 30,
                        height: 30,
                        child: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              bookmarkList.removeAt(index);
                            }),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: smartkeygradient),
        ),
        title: Text("Bookmark"),
      ),
      body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: bookmarkList.length,
          itemBuilder: (BuildContext context, int index) {
            return listItem(index);
          }),
      bottomNavigationBar: BottomAppBar(
        child: FloatingActionButton.extended(
          backgroundColor: smartkey3,
          label: Text('Play Bookmark'),
          onPressed: () {},
        ),
      ),
    );
  }
}
