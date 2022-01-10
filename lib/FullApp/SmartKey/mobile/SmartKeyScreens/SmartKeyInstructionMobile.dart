import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/FullApp/SmartKey/mobile/SmartKeyScreens/SmartKeyCategoryMobile.dart';

class SmartKeyinstructionMobile extends StatefulWidget {
  SmartKeyinstructionMobile({Key key}) : super(key: key);

  @override
  _SmartKeyinstructionMobileState createState() => _SmartKeyinstructionMobileState();
}

class _SmartKeyinstructionMobileState extends State<SmartKeyinstructionMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Instruction"),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: smartkeygradient),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "SmartKey" + " has four options",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CachedNetworkImage(
                    imageUrl: "https://smartkit.wrteam.in/smartkit/images/correct.png",
                    width: 30,
                    height: 30,
                  ),
                ),
                Text("For each right answer " + "4" + " points will be given.")
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CachedNetworkImage(
                    imageUrl: "https://smartkit.wrteam.in/smartkit/images/incorrect.png",
                    width: 30,
                    height: 30,
                  ),
                ),
                Expanded(child: Text("For each wrong answer " + '2' + " points will be deducted."))
              ],
            ),
            Divider(
              thickness: 1,
            ),
            Text(
              "Use of Lifeline: You can use only once per level",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(8.0),
                    child: CachedNetworkImage(
                      imageUrl: "https://smartkit.wrteam.in/smartkit/images/fiftyfifty.png",
                      height: 40,
                      width: 40,
                    ),
                  ),
                  Expanded(
                    child: Text("50 - 50 : for remove two options out of four and that will deduct 4 coins"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(8.0),
                    child: CachedNetworkImage(
                      imageUrl: "https://smartkit.wrteam.in/smartkit/images/skip.png",
                      height: 40,
                      width: 40,
                    ),
                  ),
                  Expanded(
                    child: Text("Skip Question : you can skip question and that will deduct 2 coins"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(8.0),
                    child: CachedNetworkImage(
                      imageUrl: "https://smartkit.wrteam.in/smartkit/images/audiencepool.png",
                      height: 40,
                      width: 40,
                    ),
                  ),
                  Expanded(
                    child: Text("Audience Poll : you can get other user's feedback about the question and that will deduct 4 coins"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(8.0),
                    child: CachedNetworkImage(
                      imageUrl: "https://smartkit.wrteam.in/smartkit/images/resettime.png",
                      height: 40,
                      width: 40,
                    ),
                  ),
                  Expanded(
                    child: Text("Reset Timer : you can get more time if you need, by reseting timer and that will deduct 4 coins"),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1,
            ),
            Text(
              "Leaderboard",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(8.0),
                    child: CachedNetworkImage(
                      imageUrl: "https://smartkit.wrteam.in/smartkit/images/leaderboard.png",
                      height: 40,
                      width: 40,
                    ),
                  ),
                  Expanded(
                    child: Text("In leaderboard you can see your score and compare it with rest of players."),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      persistentFooterButtons: <Widget>[
        Container(
          child: CupertinoButton(
            child: Text(
              "Let's Play",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            color: smartkey2,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SmartKeyCategoryMobile(),
                ),
              );
            },
          ),
          width: MediaQuery.of(context).size.width * 0.95,
        ),
        /*       CupertinoButton(
          child: Text(
            "Let's Play",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,

          ),
          color: primary,
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                  pageBuilder: (context, anim1, anim2) => (Category())),
            );



          },
        )*/
      ],
    );
  }
}
