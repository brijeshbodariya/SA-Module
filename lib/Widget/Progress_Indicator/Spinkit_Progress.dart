import 'package:flutter/material.dart';

import './Showcase.dart';
import './Workspace.dart';

class spinkit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: new Text("Progress",style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,leading: BackButton(
          color: Colors.black
      ),),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Stack(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(
                child: LayoutBuilder(
                  builder: (context, _) {
                    return IconButton(
                      icon: Icon(
                        Icons.play_circle_filled,
                        color: Colors.blue,
                      ),
                      iconSize: 50.0,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => ShowCase(),
                            //fullscreenDialog: true,
                          ),
                        );
                      },
                    );
                  },
                ),
                alignment: Alignment.bottomCenter,
              ),
            ),
          ]),
          WorkSpace(),
        ],
      )),
      //),
    );
  }
}
