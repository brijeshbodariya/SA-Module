import 'package:flutter/material.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';

import 'SmartKeyHome.dart';

class SmartKeyReviewAnswere extends StatefulWidget {
  SmartKeyReviewAnswere({Key key}) : super(key: key);

  @override
  _SmartKeyReviewAnswereState createState() => _SmartKeyReviewAnswereState();
}

class _SmartKeyReviewAnswereState extends State<SmartKeyReviewAnswere> {
  Widget questionLayout() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
        Stack(children: <Widget>[
          Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(5.0)), // set rounded corner radius
                  boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black26, offset: Offset(1, 2))] // make rounded corner of border
                  ),
              width: MediaQuery.of(context).size.width * 0.8,
              height: 180,
              alignment: Alignment.center,
              child: getQuesText()),
        ]),
      ]),
    );
  }

  Widget getQuesText() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: SingleChildScrollView(
          child: Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  Widget getOption(String option, String optValue, int ans) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        child: Material(
          child: InkWell(
            splashColor: smartkey2,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                      child: Text(option,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          )),
                    ),
                    color: smartkey3,
                  ),
                ),
                Expanded(child: Text(optValue)),
              ],
            ),
            // onTap: () {
            //   Navigator.pushReplacement(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => SmartKeyResult(),
            //     ),
            //   );
            // }
          ),
          //elevation: 4,
          color: ans == 1
              ? Colors.greenAccent
              : ans == 2
                  ? Colors.redAccent[200]
                  : Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => SmartKeyHome(),
            ),
            (Route<dynamic> route) => false);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: smartkeygradient),
          ),
          title: Text("Review Answers"),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            questionLayout(),
            getOption("A", "Lorem Ipsum", 2),
            getOption("B", "Lorem Ipsum", 1),
            getOption("C", "Lorem Ipsum", 0),
            getOption("D", "Lorem Ipsum", 0),
          ],
        )),
        persistentFooterButtons: <Widget>[
          Material(
            child: InkWell(
                splashColor: smartkey3,
                child: Container(
                  width: MediaQuery.of(context).size.width * .4,
                  child: Icon(
                    Icons.navigate_before,
                    color: smartkey2,
                    size: 50,
                  ),
                ),
                onTap: () {
                  // setState(() {
                  //   if (curIndex > 1) {
                  //     curIndex--;
                  //     getNextQuestion();
                  //   }
                  // });
                }),
          ),
          Container(
            width: MediaQuery.of(context).size.width * .11,
            child: Text(
              "1",
              textAlign: TextAlign.center,
            ),
          ),
          Material(
            child: InkWell(
                splashColor: smartkey3,
                child: Container(
                  width: MediaQuery.of(context).size.width * .4,
                  child: Icon(
                    Icons.navigate_next,
                    color: smartkey2,
                    size: 50,
                  ),
                ),
                onTap: () {
                  // setState(() {
                  //   if (curIndex <MAX_QUE_PER_LEVEL) {
                  //     curIndex++;
                  //     getNextQuestion();
                  //   }
                  // });
                }),
          ),
        ],
      ),
    );
  }
}
