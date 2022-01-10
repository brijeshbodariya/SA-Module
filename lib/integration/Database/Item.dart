import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

import 'Sqflite/dbhelper.dart';

class Item {
  int id;
  String itemname;
  String itemprice;
  bool isexpand = false;

  String firebasid;

  Item(this.id, this.itemname, this.itemprice);

  Item.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    itemname = map['itemname'];
    itemprice = map['itemprice'].toString();
    isexpand = false;
  }

  Item.fromFireStore(DocumentSnapshot snapshot, String id) {
    Map<String, dynamic> map = snapshot.data();

    firebasid = id;
    itemname = map['itemname'];
    itemprice = map['itemprice'].toString();
  }

  Item.fromRealtimeDB(DataSnapshot snapshot) {
    firebasid = snapshot.key;
    itemname = snapshot.value['itemname'];
    itemprice = snapshot.value['itemprice'].toString();
  }

  Map<String, dynamic> toMap() {
    return {
      //DatabaseHelper.columnId: id,
      DatabaseHelper.columnName: itemname,
      DatabaseHelper.columnPrice: itemprice,
    };
  }
}
