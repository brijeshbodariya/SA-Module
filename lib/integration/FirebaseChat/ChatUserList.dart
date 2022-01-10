import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:smartkit/integration/FirebaseChat/ChatLoading.dart';
import 'MainChatPage.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';

String removeusertitle = 'Remove your name from list';

class ChatUserList extends StatefulWidget {
  final String currentUserId;

  ChatUserList({Key key, @required this.currentUserId}) : super(key: key);

  @override
  State createState() => ChatUserListState(currentUserId: currentUserId);
}

class ChatUserListState extends State<ChatUserList> {
  ChatUserListState({Key key, @required this.currentUserId});

  final String currentUserId;

  final GoogleSignIn googleSignIn = GoogleSignIn();
  final ScrollController listScrollController = ScrollController();

  int _limit = 20;
  int _limitIncrement = 20;
  bool isLoading = false;
  List<Choice> choices = <Choice>[
    Choice(title: removeusertitle, icon: Icons.settings),
  ];

  @override
  void initState() {
    super.initState();

    listScrollController.addListener(scrollListener);
  }

  void scrollListener() {
    if (listScrollController.offset >= listScrollController.position.maxScrollExtent && !listScrollController.position.outOfRange) {
      setState(() {
        _limit += _limitIncrement;
      });
    }
  }

  Future<void> onItemMenuPress(Choice choice) async {
    if (choice.title == removeusertitle) {
      this.setState(() {
        isLoading = true;
      });

      print("---curr--$currentUserId---");

      FirebaseFirestore.instance.collection('chatusers').get().then((value) async {
        for (DocumentSnapshot doc in value.docs) {
          print('user-${doc.data()['id']}--${doc.data()['name']}');
          String id = currentUserId;
          String otheruserId = doc.data()['id'];
          String groupChatId;

          if (id.hashCode <= otheruserId.hashCode) {
            groupChatId = '$id-$otheruserId';
          } else {
            groupChatId = '$otheruserId-$id';
          }

          FirebaseFirestore.instance.collection('chatmessages/$groupChatId/$groupChatId').get().then((doc) {
            doc.docs.forEach((data) {
              data.reference.delete();
            });
            if (doc.docs.length != 0) doc.docs.removeLast();
          });
        }
      });

      await FirebaseFirestore.instance.collection("chatusers").doc(currentUserId).delete().then((_) {
        print("success!");
      });

      this.setState(() {
        isLoading = false;
      });
      onBackPress();
      Navigator.of(context).pop();
    }
  }

  Future<bool> onBackPress() async {
    handleSignOut();
    return Future.value(true);
  }

  Future<Null> handleSignOut() async {
    this.setState(() {
      isLoading = true;
    });

    await FirebaseAuth.instance.signOut();
    await googleSignIn.disconnect();
    await googleSignIn.signOut();

    this.setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'UserList',style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,leading: BackButton(
          color: Colors.black
      ),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton<Choice>(
            onSelected: onItemMenuPress,
            itemBuilder: (BuildContext context) {
              return choices.map((Choice choice) {
                return PopupMenuItem<Choice>(
                    value: choice,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          choice.icon,
                          color: purpal,
                        ),
                        Container(
                          width: 10.0,
                        ),
                        Text(
                          choice.title,
                          style: TextStyle(color: purpal),
                        ),
                      ],
                    ));
              }).toList();
            },
          ),
        ],
      ),
      body: WillPopScope(
        child: Stack(
          children: <Widget>[
            // List
            Container(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('chatusers').limit(_limit).snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if ((snapshot.hasData && snapshot.data.size == 1) || !snapshot.hasData) {
                    return Center(child: Text("No User Found"));
                  } else {
                    return new ListView(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      controller: listScrollController,
                      children: snapshot.data.docs.map((DocumentSnapshot document) {
                        return buildItem(context, document);
                      }).toList(),
                    );
                  }
                },
              ),
            ),

            // Loading
            Positioned(
              child: isLoading ? ChatLoading() : Container(),
            )
          ],
        ),
        onWillPop: onBackPress,
      ),
    );
  }

  Widget buildItem(BuildContext context, DocumentSnapshot document) {
    if (document.data()['id'] == currentUserId) {
      return Container();
    } else {
      return GestureDetector(
        child: Column(
          children: [
            Row(
              children: <Widget>[
                Icon(
                  Icons.account_circle,
                  size: 40.0,
                  color: Colors.grey,
                ),
                Flexible(
                  child: Container(
                    child: Text(
                      '${document.data()['name']}',
                      style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(fontWeight: FontWeight.w400)),
                    ),
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
                  ),
                ),
              ],
            ),
            Divider(),
          ],
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => MainChatPage(otheruserId: document.id, curruserid: currentUserId, username: document.data()['name'])));
        },
      );
    }
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}
