import 'package:flutter/material.dart';

import 'User.dart';

class Radio_List extends StatefulWidget {
  @override
  _Radio_ListState createState() => new _Radio_ListState();
}

class _Radio_ListState extends State<Radio_List> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

// Declare this variable
  int selectedRadioTile;
  User selectedUser;
  int selectedRadio;
  List<User> users;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
    selectedRadioTile = 0;
    users = User.getUsers();
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  setSelectedUser(User user) {
    setState(() {
      selectedUser = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: _scaffoldKey,
        appBar: new AppBar(
          title: new Text("Radio List",style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,leading: BackButton(
            color: Colors.black
        ),),
        body: SingleChildScrollView(
            child: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            //***********************Radio Manually*************************
            RadioListTile(
              value: 1,
              groupValue: selectedRadioTile,
              title: Text("Radio 1"),
              subtitle: Text("Radio 1 Subtitle"),
              onChanged: (val) {
                setSelectedRadioTile(val);
              },
              activeColor: Colors.green,
            ),
            RadioListTile(
              value: 2,
              groupValue: selectedRadioTile,
              title: Text("Radio 2"),
              subtitle: Text("Radio 2 Subtitle"),
              onChanged: (val) {
                print("Radio Tile pressed $val");
                setSelectedRadioTile(val);
              },
              activeColor: Colors.green,
              selected: false,
            ),

            SizedBox(
              width: 20,
              height: 80,
            ),

            //***********************Radio get from list*************************
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                "Using List",
                style: TextStyle(fontSize: 20.0),
              )),
            ),
            Column(
              children: createRadioListUsers(),
            ),
          ]),
        )));
  }

  List<Widget> createRadioListUsers() {
    List<Widget> widgets = [];
    for (User user in users) {
      widgets.add(
        RadioListTile(
          value: user,
          groupValue: selectedUser,
          title: Text(user.firstName),
          subtitle: Text(user.lastName),
          onChanged: (currentUser) {
            print("Current User ${currentUser.firstName}");
            setSelectedUser(currentUser);
          },
          secondary: CircleAvatar(
            backgroundImage: NetworkImage(user.url),
            backgroundColor: Colors.blue,
          ),
          selected: selectedUser == user,
          activeColor: Colors.green,
        ),
      );
    }
    return widgets;
  }
}
