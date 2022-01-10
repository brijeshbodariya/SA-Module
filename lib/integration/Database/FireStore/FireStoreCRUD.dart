import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../helper/ColorsRes.dart';
import '../Item.dart';

class FireStoreCRUD extends StatefulWidget {
  @override
  _FireStoreCRUDState createState() => _FireStoreCRUDState();
}

class _FireStoreCRUDState extends State<FireStoreCRUD> {
  final firestoreInstance = FirebaseFirestore.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  Query query = FirebaseFirestore.instance.collection('items');

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
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
            title: Text(
              'FireStore',style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,leading: BackButton(
              color: Colors.black
          ),),
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
          onPressed: () {
            if (nameController.text.trim().isEmpty || priceController.text.trim().isEmpty)
              _showMessageInScaffold("Fill all filed");
            else {
              String name = nameController.text;
              int price = int.parse(priceController.text);

              firestoreInstance.collection("items").add({
                "itemname": name,
                "itemprice": price,
              }).then((value) {
                print(value.id);
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
    return StreamBuilder<QuerySnapshot>(
      stream: query.snapshots(),
      builder: (context, stream) {
        if (stream.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (stream.hasError) {
          return Center(child: Text(stream.error.toString()));
        }

        QuerySnapshot querySnapshot = stream.data;

        return Column(children: [
          if (querySnapshot.size != 0)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              child: Row(children: [
                Expanded(
                    flex: 1,
                    child: Text(
                      "No.",
                      style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(fontWeight: FontWeight.bold)),
                    )),
                Expanded(
                    flex: 4,
                    child: Text(
                      "Name",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(fontWeight: FontWeight.bold)),
                    )),
                Expanded(
                    flex: 3,
                    child: Text(
                      "price",
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(fontWeight: FontWeight.bold)),
                    )),
                if (type != 0)
                  Expanded(
                    flex: 1,
                    child: Text(""),
                  ),
              ]),
            ),
          if (querySnapshot.size != 0) Divider(),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                itemCount: querySnapshot.size,
                itemBuilder: (BuildContext context, int index) {
                  Item item = Item.fromFireStore(querySnapshot.docs[index], querySnapshot.docs[index].reference.id);

                  TextEditingController nameController = TextEditingController(text: item.itemname);
                  TextEditingController priceController = TextEditingController(text: item.itemprice.toString());

                  return Row(children: [
                    Expanded(flex: 1, child: Text("${index + 1}", style: Theme.of(context).textTheme.subtitle1)),
                    Expanded(flex: 4, child: Text(item.itemname, textAlign: TextAlign.center, style: Theme.of(context).textTheme.subtitle1)),
                    Expanded(flex: 3, child: Text(item.itemprice.toString(), textAlign: TextAlign.end, style: Theme.of(context).textTheme.subtitle1)),
                    if (type != 0)
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          alignment: Alignment.centerRight,
                          icon: Icon(
                            type == 1 ? Icons.edit : Icons.delete_forever,
                            color: ColorsRes.appcolor,
                          ),
                          onPressed: () async {
                            if (type == 1) {
                              editDialog(nameController, priceController, querySnapshot.docs[index].reference);
                            } else {
                              await firestoreInstance.runTransaction((Transaction myTransaction) async {
                                await myTransaction.delete(querySnapshot.docs[index].reference);
                              });
                            }
                          },
                        ),
                      ),
                  ]);
                }),
          ),
        ]);
      },
    );
  }

  Future<void> editDialog(TextEditingController nameController, TextEditingController priceController, DocumentReference docref) async {
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
                  style: TextStyle(color: ColorsRes.appcolor),
                ),
                onPressed: () {
                  if (nameController.text.trim().isNotEmpty && priceController.text.trim().isNotEmpty) {
                    firestoreInstance.runTransaction<String>((transaction) async {
                      DocumentSnapshot txSnapshot = await transaction.get(docref);

                      if (!txSnapshot.exists) {
                        throw Exception('Document does not exist!');
                      }

                      transaction.update(docref, {'itemname': nameController.text, "itemprice": priceController.text});
                      return "";
                    });

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
