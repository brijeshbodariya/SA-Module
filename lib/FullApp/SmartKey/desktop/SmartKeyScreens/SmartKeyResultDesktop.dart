import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/FullApp/SmartKey/desktop/SmartKeyScreens/SmartKeyHomeDesktop.dart';
import 'package:smartkit/FullApp/SmartKey/desktop/SmartKeyScreens/SmartKeyHomeDataDesktop.dart';
import 'package:smartkit/FullApp/SmartKey/desktop/SmartKeyScreens/SmartKeyPlayDesktop.dart';
import 'package:smartkit/FullApp/SmartKey/Widget/SmartKeyBtn.dart';

import 'SmartKeyReviewAnswersDesktop.dart';

class SmartKeyResultDesktop extends StatefulWidget {
  SmartKeyResultDesktop({Key key}) : super(key: key);

  @override
  _SmartKeyResultDesktopState createState() => _SmartKeyResultDesktopState();
}

class _SmartKeyResultDesktopState extends State<SmartKeyResultDesktop> {
  Widget totalCoinsLayout() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl: "https://smartkit.wrteam.in/smartkit/images/coins.png",
                  color: smartkey2,
                  width: 30,
                  height: 30,
                ),
                Text("150", style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  "Total Coins",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl: "https://smartkit.wrteam.in/smartkit/images/rank.png",
                  color: smartkey2,
                  width: 30,
                  height: 30,
                ),
                Text("200", style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  "Total Score",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  resultLayout() {
    double per = (int.parse("6") / 10);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Card(
          color: smartkey1,
          elevation: 5,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "completed",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            CachedNetworkImage(
                              imageUrl: "https://smartkit.wrteam.in/smartkit/images/correct.png",
                              width: 30,
                              height: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "6",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: <Widget>[
                              CachedNetworkImage(
                                imageUrl: "https://smartkit.wrteam.in/smartkit/images/incorrect.png",
                                width: 30,
                                height: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "4",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                        width: 100.0,
                        height: 100.0,
                        child: LiquidCircularProgressIndicator(
                          value: per.toDouble(),
                          backgroundColor: Colors.grey,
                          valueColor: AlwaysStoppedAnimation(smartkey2),
                          center: Text(
                            (per * 100).toInt().toString() + "%",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            CachedNetworkImage(
                              imageUrl: "https://smartkit.wrteam.in/smartkit/images/coins.png",
                              color: smartkey2,
                              width: 30,
                              height: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "60",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: <Widget>[
                              CachedNetworkImage(
                                imageUrl: "https://smartkit.wrteam.in/smartkit/images/rank.png",
                                width: 30,
                                height: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "70",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomLayout() {
    return Column(
      children: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: SmartKeyBtn(
            title: "Play Again",
            titlecolor: Colors.white,
            route: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SmartKeyPlayDesktop(),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: SmartKeyBtn(
              title: "Review Answers",
              titlecolor: Colors.white,
              route: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SmartKeyReviewAnswereDesktop(),
                  ),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: SmartKeyBtn(
              title: "Share Your Score",
              titlecolor: Colors.white,
              route: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SmartKeyHomeDesktop(),
                    ),
                    (Route<dynamic> route) => false);
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: SmartKeyBtn(
              title: "Home",
              titlecolor: Colors.white,
              route: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SmartKeyHomeDesktop(),
                    ),
                    (Route<dynamic> route) => false);
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => SmartKeyHomeDateDesktop(),
            ),
            (Route<dynamic> route) => false);
      },
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: smartkey3,
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: smartkeygradient),
          ),
          title: Text("Result"),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 5),
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[totalCoinsLayout(), resultLayout(), bottomLayout()],
          ),
        ),
      ),
    );
  }
}
