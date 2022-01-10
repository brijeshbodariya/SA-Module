import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';

class SmartKeyLeaderboardDesktop extends StatefulWidget {
  SmartKeyLeaderboardDesktop({Key key}) : super(key: key);

  @override
  _SmartKeyLeaderboardDesktopState createState() => _SmartKeyLeaderboardDesktopState();
}

class _SmartKeyLeaderboardDesktopState extends State<SmartKeyLeaderboardDesktop> with TickerProviderStateMixin {
  bool useMobileLayout;
  String dropdownValue = 'All';
  int offset = 0;
  List<String> spinnerItems = ['All', 'Monthly', 'Daily'];
  int total;
  int curNo;
  String curName, curScore, curProfile;
  bool curLoading = true;
  bool loading = true, errorExist = false;
  ScrollController _controller;
  bool rankVisible = true;
  List leaderList = [
    {'rank': "1", 'name': "Mac", 'score': "1000"},
    {'rank': "2", 'name': "Jac", 'score': "900"},
    {'rank': "3", 'name': "Dac", 'score': "500"},
  ];

  Widget rankLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        // CachedNetworkImage(imageUrl:"https://smartkit.wrteam.in/smartkit/images/l_back4.png"),
        Stack(
          children: <Widget>[
            Card(
                margin: EdgeInsets.only(right: 10, top: 10),
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 27, horizontal: 35),
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.black26,
                            child: CircleAvatar(
                                radius: 29,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: smartkey2,
                                  //backgroundImage:CachedNetworkImageProvider("https://smartkit.wrteam.in/smartkit/images/rank2.png"),
                                  backgroundImage: AssetImage("assets/rank1.png"),
                                ))),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Text(
                            leaderList[1]['name'],
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Text(
                          leaderList[1]['score'],
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ))),
            Positioned.fill(
              child: Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  "assets/rank1.png",
                  height: 30,
                  width: 30,
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 20),
        Stack(
          children: <Widget>[
            Card(
                margin: EdgeInsets.only(right: 10, top: 10),
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 35),
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.black26,
                            child: CircleAvatar(
                                radius: 29,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: smartkey2,
                                  //backgroundImage:CachedNetworkImageProvider("https://smartkit.wrteam.in/smartkit/images/rank2.png"),
                                  backgroundImage: AssetImage("assets/rank1.png"),
                                ))),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Text(
                            leaderList[0]['name'],
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Text(
                          leaderList[0]['score'],
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ))),
            Positioned.fill(
              child: Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  "assets/rank1.png",
                  height: 30,
                  width: 30,
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 20),
        Stack(
          children: <Widget>[
            Card(
                margin: EdgeInsets.only(right: 10, top: 10),
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 35),
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.black26,
                            child: CircleAvatar(
                                radius: 29,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: smartkey2,
                                  //backgroundImage:CachedNetworkImageProvider("https://smartkit.wrteam.in/smartkit/images/rank2.png"),
                                  backgroundImage: AssetImage("assets/rank1.png"),
                                ))),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Text(
                            leaderList[2]['name'],
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Text(
                          leaderList[2]['score'],
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ))),
            Positioned.fill(
              child: Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  "assets/rank1.png",
                  height: 30,
                  width: 30,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    useMobileLayout = shortestSide < 600;
    return Scaffold(
      backgroundColor: smartkey2,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: smartkeygradient),
        ),
        title: Text("Leaderboard"),
        actions: <Widget>[
          new Theme(
              data: Theme.of(context).copyWith(
                canvasColor: smartkey3,
              ),
              child: DropdownButton<String>(
                value: dropdownValue,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                ),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.white, fontSize: 18),
                underline: Container(
                  height: 2,
                  color: Colors.white,
                ),
                onChanged: (String data) {},
                items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )),
        ],
      ),
      persistentFooterButtons: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              child: Text(
                "20",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18, color: Colors.white),
              ),
              width: MediaQuery.of(context).size.width * 0.11,
            ),
            Container(
              child: SvgPicture.asset(
                "assets/smartkey.svg",
                color: Colors.white,
                width: 30,
                height: 30,
              ),
              width: MediaQuery.of(context).size.width * 0.15,
            ),
            Container(
              child: Text(
                "Mac",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18, color: Colors.white),
              ),
              width: MediaQuery.of(context).size.width * 0.54,
            ),
            Container(
              child: Text(
                "20",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18, color: Colors.white),
              ),
              width: MediaQuery.of(context).size.width * 0.15,
            )
          ],
        )
      ],
      body: SingleChildScrollView(
        controller: _controller,
        child: Column(
          children: <Widget>[
            rankLayout(),
            Card(
                margin: EdgeInsets.only(top: 50, left: 12, right: 12),
                //decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Rank", style: TextStyle(color: Colors.black)),
                      Text("Player", style: TextStyle(color: Colors.black)),
                      Text("Points", style: TextStyle(color: Colors.black)),
                    ],
                  ),
                )),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: leaderList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                      child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Card(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      leaderList[index]['rank'],
                                      style: TextStyle(color: Colors.white, fontSize: 10),
                                    ),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: smartkey2,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(25.0),
                                        child: SvgPicture.asset(
                                          "assets/smartkey.svg",
                                          width: 50,
                                          height: 50,
                                          fit: BoxFit.fill,
                                        )),
                                  ),
                                  Expanded(
                                      child: Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Text(
                                      leaderList[index]['name'],
                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                    ),
                                  )),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(leaderList[index]['score'], style: TextStyle(color: Colors.black)),
                                  )
                                ],
                              ),
                            ),
                          )));
                }),
          ],
        ),
      ),
    );
  }
}
