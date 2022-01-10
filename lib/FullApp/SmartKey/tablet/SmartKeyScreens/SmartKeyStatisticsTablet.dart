import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';

class SmartKeyStatisticsTablet extends StatefulWidget {
  SmartKeyStatisticsTablet({Key key}) : super(key: key);

  @override
  _SmartKeyStatisticsTabletState createState() => _SmartKeyStatisticsTabletState();
}

class _SmartKeyStatisticsTabletState extends State<SmartKeyStatisticsTablet> {
  String rank, coins, score, name, profile, strongCat, weakCat;

  int sRatio = 0, wRatio = 0, totalQue = 10, corQue = 0, incorQue = 0, corPer = 70;

  bool loading = true;
  bool hasError = false;
  profileLayout() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 45,
                        backgroundColor: smartkey2,
                        child: SvgPicture.asset(
                          "assets/smartkey.svg",
                          fit: BoxFit.cover,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Mac",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Text(
                      "Rank",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text("3"),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Text(
                      "Coins",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text("450"),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Text(
                      "Scores",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text("750")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  categirtLayout() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Strong Category",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text("70"),
              Container(
                height: 30,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: LiquidLinearProgressIndicator(
                    backgroundColor: Colors.white,
                    valueColor: AlwaysStoppedAnimation(Colors.greenAccent),
                    borderColor: Colors.green,
                    borderWidth: 1.0,
                    direction: Axis.horizontal,
                    borderRadius: 10,
                    value: 70 / 100,
                    center: Text(
                      "70",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 10.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Weak Category",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text(weakCat != null ? weakCat : " "),
              Container(
                height: 30,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: LiquidLinearProgressIndicator(
                    backgroundColor: Colors.white,
                    valueColor: AlwaysStoppedAnimation(Colors.redAccent[100]),
                    borderColor: Colors.red,
                    borderWidth: 1.0,
                    direction: Axis.horizontal,
                    borderRadius: 10,
                    value: 30 / 100,
                    center: Text(
                      "30",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 10.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  scoreLayout() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 5,
                      height: 40,
                      color: smartkey2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[Text("250"), Text("Attained Questions")],
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 5,
                      height: 40,
                      color: Colors.greenAccent,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[Text("150"), Text("Correct Questions")],
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 5,
                      height: 40,
                      color: Colors.redAccent,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("100"),
                        Text("In-Correct Questions"),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
          Container(
            height: 100,
            width: 100,
            child: LiquidCircularProgressIndicator(
              value: corPer / 100,
              backgroundColor: Colors.redAccent[100],
              valueColor: AlwaysStoppedAnimation(Colors.greenAccent),
              center: Text(
                corPer.toString() + "%",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: smartkeygradient),
        ),
        title: Text("Statistics"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[profileLayout(), categirtLayout(), scoreLayout()],
        ),
      ),
    );
  }
}
