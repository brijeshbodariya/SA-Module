import 'package:flutter/material.dart';

import '../helper/ColorsRes.dart';
import 'FireStore/FireStoreCRUD.dart';
import 'FirebaseRealtime/FirebaseRealtimeDb.dart';
import 'Sqflite/SqliteCRUD.dart';

class DatabaseListPage extends StatefulWidget {
  @override
  _DatabaseListPageState createState() => _DatabaseListPageState();
}

class _DatabaseListPageState extends State<DatabaseListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(
          "Database", style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,leading: BackButton(
        color: Colors.black
    ),
        centerTitle: true,
      ),
      body: ListView(children: [
        ExpansionTile(
          title: new Text(
            "Sqflite",
          ),
          onExpansionChanged: (bool val) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SqliteCRUD()));
          },
        ),
        // ExpansionTile(
        //   title: new Text(
        //     "FireStore",
        //   ),
        //   onExpansionChanged: (bool val) {
        //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => FireStoreCRUD()));
        //   },
        // ),
        ExpansionTile(
          title: new Text(
            "Firebase Realtime DB",
          ),
          onExpansionChanged: (bool val) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => FirebaseRealtimeDb()));
          },
        ),
      ]),
    );
  }
}
