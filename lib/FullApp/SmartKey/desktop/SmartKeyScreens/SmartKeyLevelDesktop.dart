import 'package:flutter/material.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/FullApp/SmartKey/desktop/SmartKeyScreens/SmartKeyPlayDesktop.dart';

class SmartKeyLevelDesktop extends StatefulWidget {
  SmartKeyLevelDesktop({Key key}) : super(key: key);

  @override
  _SmartKeyLevel createState() => _SmartKeyLevel();
}

class _SmartKeyLevel extends State<SmartKeyLevelDesktop> {
  Widget listItem(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        child: Material(
            //color:primary,
            child: InkWell(
                splashColor: smartkey2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        color: Colors.grey[200],
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(
                              levelList[index]['unlock'] == true
                                  ? Icons.lock_open
                                  : Icons.lock,
                              color: levelList[index]['unlock'] == true
                                  ? smartkey2
                                  : Colors.grey),
                        ),
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                            levelList[index]['title'] + " " + "${index + 1}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: levelList[index]['unlock']
                                    ? Colors.black
                                    : Colors.grey)),
                      )),
                      Icon(Icons.keyboard_arrow_right,
                          color: levelList[index]['unlock'] == true
                              ? smartkey2
                              : Colors.grey)
                    ],
                  ),
                ),
                onTap: () {
                  if (levelList[index]['unlock'] == true) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SmartKeyPlayDesktop(),
                      ),
                    );
                  }
                })),
        elevation: 5,
      ),
    );
  }

  List levelList = [
    {'title': 'Level', "unlock": true},
    {'title': 'Level', "unlock": true},
    {'title': 'Level', "unlock": true},
    {'title': 'Level', "unlock": false},
    {'title': 'Level', "unlock": false},
    {'title': 'Level', "unlock": false},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            flexibleSpace: Container(
              decoration: BoxDecoration(gradient: smartkeygradient),
            ),
            title: Text("Level")),
        body: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: levelList.length,
            itemBuilder: (BuildContext context, int index) {
              return listItem(index);
            }));
  }
}
