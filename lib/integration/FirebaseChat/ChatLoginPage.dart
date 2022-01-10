import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/ColorsRes.dart';
import 'ChatLoading.dart';
import 'ChatUserList.dart';

String curruserid = '', currusername = '';
User currentUser;

class ChatLoginPage extends StatefulWidget {
  ChatLoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  ChatLoginPageState createState() => ChatLoginPageState();
}

class ChatLoginPageState extends State<ChatLoginPage> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  Future<Null> handleSignIn() async {
    this.setState(() {
      isLoading = true;
    });

    if (googleSignIn != null && await googleSignIn.isSignedIn()) {
      await googleSignIn.disconnect();
      await googleSignIn.signOut();
    }

    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    User firebaseUser =
        (await firebaseAuth.signInWithCredential(credential)).user;

    print("==user--${firebaseUser.uid}");

    if (firebaseUser != null) {
      final QuerySnapshot result = await FirebaseFirestore.instance
          .collection('chatusers')
          .where('id', isEqualTo: firebaseUser.uid)
          .get();
      final List<DocumentSnapshot> documents = result.docs;
      if (documents.length == 0) {
        FirebaseFirestore.instance
            .collection('chatusers')
            .doc(firebaseUser.uid)
            .set({
          'name': firebaseUser.displayName,
          'id': firebaseUser.uid,
          'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
          'chattingWith': null
        });

        // Write data to local
        currentUser = firebaseUser;
        curruserid = currentUser.uid;
        currusername = currentUser.displayName;
      } else {
        // Write data to local
        curruserid = documents[0].data()['id'];
        currusername = documents[0].data()['name'];
      }

      this.setState(() {
        isLoading = false;
      });

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ChatUserList(currentUserId: firebaseUser.uid)));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Sign in failed')));
      this.setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Login',style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,leading: BackButton(
            color: Colors.black
        ),
          centerTitle: true,
        ),
        body: Stack(
          children: <Widget>[
            Center(
              child: ElevatedButton(
                onPressed: () => handleSignIn().catchError((err) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Sign in failed')));
                  this.setState(() {
                    isLoading = false;
                  });
                }),
                child: Text(
                  'SIGN IN WITH GOOGLE',
                  style: TextStyle(fontSize: 16.0),
                ),
                style: raisedButtonStyle,
              ),
            ),

            // Loading
            Positioned(
              child: isLoading ? ChatLoading() : Container(),
            ),
          ],
        ));
  }

  ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: ColorsRes.white,
    primary: Color(0xffdd4b39),

    // highlightColor: Color(0xffff7f7f),
    padding: EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
    /* shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),*/
  );
}
