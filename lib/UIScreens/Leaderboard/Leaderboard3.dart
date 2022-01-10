import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Leaderboard3 extends StatefulWidget {
  @override
  _LeaderState createState() => _LeaderState();
}

class _LeaderState extends State<Leaderboard3> with TickerProviderStateMixin {
  List listCat;
  bool loading = true;
  AnimationController _animationController;
  double animationDuration = 0.0;
  int totalItems = 10;

  @override
  void initState() {
    super.initState();
    final int totalDuration = 4000;
    _animationController = AnimationController(vsync: this, duration: new Duration(milliseconds: totalDuration));
    animationDuration = totalDuration / (100 * (totalDuration / totalItems));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    listCat = [
      {"id": "28", "user_id": "76", "name": "Mac", "score": "5300", "rank": 1, "image": "https://smartkit.wrteam.in/smartkit/images/le1.png", "date_created": "27-08-2019 10:08:30"},
      {"id": "27", "user_id": "77", "name": "neque", "score": "5200", "rank": 2, "image": "https://smartkit.wrteam.in/smartkit/images/le2.png", "date_created": "27-08-2019 10:08:22"},
      {"id": "22", "user_id": "75", "name": "Hetal gohil", "score": "5000", "rank": 3, "image": "https://smartkit.wrteam.in/smartkit/images/profile2.png", "date_created": "26-08-2019 09:08:38"},
      {"id": "26", "user_id": "78", "name": " Gravida", "score": "214", "rank": 4, "image": "https://smartkit.wrteam.in/smartkit/images/le4.png", "date_created": "27-08-2019 10:08:12"},
      {"id": "23", "user_id": "74", "name": "Image Cat", "score": "200", "rank": 5, "image": "https://smartkit.wrteam.in/smartkit/images/le5.png", "date_created": "26-08-2019 09:08:45"},
      {"id": "25", "user_id": "79", "name": "porttitor", "score": "200", "rank": 6, "image": "https://smartkit.wrteam.in/smartkit/images/le6.png", "date_created": "27-08-2019 10:08:04"},
      {"id": "20", "user_id": "72", "name": "Test RO", "score": "100", "rank": 7, "image": "https://smartkit.wrteam.in/smartkit/images/le1.png", "date_created": "22-08-2019 11:08:24"},
      {"id": "21", "user_id": "71", "name": "The Path", "score": "100", "rank": 8, "image": "https://smartkit.wrteam.in/smartkit/images/le2.png", "date_created": "22-08-2019 11:08:34"}
    ];
    return Scaffold(
        backgroundColor: Color(0xffd1d1d1),
        body: SingleChildScrollView(
            child: Stack(
          children: <Widget>[
            profile(),
            firstno(),
            getrank(),
          ],
        )));
  }

  Widget profile() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          stops: [0.3, 0.7],
          colors: [
            Color(0xff5792d1),
            Color(0xff2f5e9e),
          ],
        ),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Text("Leaderboard", style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.white)),
          ),
          Text(
            "14 Dec 2020",
            style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 7.0),
            child: CachedNetworkImage(
              imageUrl: "https://smartkit.wrteam.in/smartkit/images/trophies.png",
              height: 150,
            ),
          ),
        ],
      ),
    );
  }

  Widget getrank() {
    return MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: Padding(
          padding: const EdgeInsets.only(top: 315.0),
          child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: listCat == null ? 0 : listCat.length,
              itemBuilder: (BuildContext context, int index) {
                return new Item(
                  index: index,
                  animationController: _animationController,
                  duration: animationDuration,
                  listCat: listCat,
                );
              }),
        ));
  }

  Widget firstno() {
    return Container(
        decoration: new BoxDecoration(color: Color(0xff4a81c0), boxShadow: [
          BoxShadow(
            color: Color(0xff4a81c0),
            blurRadius: 20.0, // has the effect of softening the shadow
            spreadRadius: 1.0, // has the effect of extending the shadow
            offset: Offset(
              5.0, // horizontal, move right 10
              5.0, // vertical, move down 10
            ),
          )
        ]),
        margin: const EdgeInsets.only(top: 250.0),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            child: Row(
              children: <Widget>[
                Container(
                  child: Text(listCat[0]["rank"].toString() + ".", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20,
                    backgroundImage: CachedNetworkImageProvider(listCat[0]["image"]),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    listCat[0]["name"],
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                )),
                CachedNetworkImage(
                  imageUrl: "https://smartkit.wrteam.in/smartkit/images/smallstar.png",
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(listCat[0]["score"], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                )
              ],
            ),
          ),
        ));
  }
}

class Item extends StatefulWidget {
  final int index;
  final AnimationController animationController;
  final double duration;
  List listCat;

  Item({this.index, this.animationController, this.duration, this.listCat});

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  Animation _animation;
  double start;
  double end;

  @override
  void initState() {
    super.initState();
    start = (widget.duration * widget.index).toDouble();
    end = start + widget.duration;
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: Interval(
          start,
          end,
          curve: Curves.easeIn,
        ),
      ),
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _animation.value,
      child: Center(
          child: widget.listCat == null
              ? CircularProgressIndicator()
              : (widget.listCat.isEmpty
                  ? Center(
                      child: Text(
                        "No Player Found...",
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                          child: Row(
                            children: <Widget>[
                              Container(
                                child: Text(widget.listCat[widget.index]["rank"].toString() + ".", style: TextStyle(color: Color(0xff4a81c0))),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: CircleAvatar(
                                  backgroundColor: Color(0xff4a81c0),
                                  radius: 20,
                                  backgroundImage: CachedNetworkImageProvider(widget.listCat[widget.index]["image"]),
                                ),
                              ),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  widget.listCat[widget.index]["name"],
                                  style: TextStyle(
                                    color: Color(0xff4a81c0),
                                  ),
                                ),
                              )),
                              CachedNetworkImage(
                                imageUrl: "https://smartkit.wrteam.in/smartkit/images/smallstar.png",
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(widget.listCat[widget.index]["score"], style: TextStyle(color: Color(0xff4a81c0))),
                              )
                            ],
                          ),
                        ),
                      )))),
    );
  }
}
