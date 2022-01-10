import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../helper/ColorsRes.dart';
import '../Item.dart';

class FirebaseRealtimeDb extends StatefulWidget {
  @override
  _FirebaseRealtimeDbState createState() => _FirebaseRealtimeDbState();
}

class _FirebaseRealtimeDbState extends State<FirebaseRealtimeDb> {
  final databaseReference = FirebaseDatabase.instance.reference();
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            bottom: TabBar(
              unselectedLabelColor: ColorsRes.black,
              indicatorColor: ColorsRes.black,
              labelColor: ColorsRes.black,
              tabs: [
                Tab(
                  text: "Insert",
                ),
                Tab(
                  text: "View",
                ),
                Tab(
                  text: "Update",
                ),
                Tab(
                  text: "Delete",
                ),
              ],
            ),
            title: Text('Firebase Realtime DB', style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.white,
            leading: BackButton(color: Colors.black),
          ),
          body: TabBarView(children: [
            insertItemWidget(),
            itemListWidget(0),
            itemListWidget(1),
            itemListWidget(2),
          ]),
        ));
  }

  Widget insertItemWidget() {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: TextField(
            controller: nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Item Name',
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: TextField(
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
            controller: priceController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Item price',
            ),
          ),
        ),
        ElevatedButton(
          child: Text('Insert Item Details'),
          style: ElevatedButton.styleFrom(
            onPrimary: ColorsRes.white,
            primary: Colors.black,
          ),
          onPressed: () {
            if (nameController.text.trim().isEmpty || priceController.text.trim().isEmpty) {
              _showMessageInScaffold("Fill all filed");
            } else {
              String name = nameController.text;
              String price = priceController.text;

              databaseReference.child("items").push().set({'itemname': name, 'itemprice': price}).then((value) {
                nameController.clear();
                priceController.clear();
                _showMessageInScaffold("Item inserted");
              });
            }
          },
        ),
      ],
    );
  }

  Widget itemListWidget(int type) {
    //type = 0 (read)
    //type = 1 (edit)
    //type = 2 (delete)
    return Column(
      children: [
        new Flexible(
          child: new FirebaseAnimatedList(
              query: databaseReference.reference().child('items'),
              itemBuilder: (_, DataSnapshot snapshot, Animation<double> animation, int index) {
                Item item = Item.fromRealtimeDB(snapshot);
                TextEditingController nameController = TextEditingController(text: item.itemname);
                TextEditingController priceController = TextEditingController(text: item.itemprice.toString());
                return new ListTile(
                  title: new Text(item.itemname),
                  subtitle: new Text(item.itemprice),
                  leading: Text("${index + 1}"),
                  trailing: type == 0
                      ? null
                      : IconButton(
                          padding: EdgeInsets.zero,
                          alignment: Alignment.centerRight,
                          icon: Icon(
                            type == 1 ? Icons.edit : Icons.delete_forever,
                            color: Colors.black,
                          ),
                          onPressed: () async {
                            if (type == 1) {
                              editDialog(nameController, priceController, snapshot.key);
                            } else {
                              databaseReference.child('items/${snapshot.key}').remove();
                            }
                          },
                        ),
                );
              }),
        )
      ],
    );
  }

  Future<void> editDialog(TextEditingController nameController, TextEditingController priceController, String itemid) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Update'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  onChanged: (value) {},
                  controller: nameController,
                  decoration: InputDecoration(hintText: "Item Name"),
                ),
                TextField(
                  onChanged: (value) {},
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  controller: priceController,
                  decoration: InputDecoration(hintText: "Item price"),
                ),
              ],
            ),
            actions: [
              new TextButton(
                child: new Text(
                  'CANCEL',
                  style: TextStyle(color: ColorsRes.black),
                ),
                onPressed: () {
                  Navigator.of(context).pop("");
                },
              ),
              new TextButton(
                child: new Text(
                  'UPDATE',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  if (nameController.text.trim().isNotEmpty && priceController.text.trim().isNotEmpty) {
                    databaseReference.child('items/$itemid').update({'itemname': nameController.text, 'itemprice': priceController.text});

                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          );
        });
  }

  void _showMessageInScaffold(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}
