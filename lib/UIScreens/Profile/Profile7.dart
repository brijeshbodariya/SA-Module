import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

const String name = "name";
const String following = "following";
const String follower = "followers";
const String profile = "image";
const String photoes = "posts";
const String email = "email";
const String phone = "phone";
const String city = "city";
const String bio = "bio";

const CURVE_HEIGHT = 600.0;

class profile7 extends StatefulWidget {
  profile7({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<profile7> {
  List list;
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: [
          CurvedShape(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 80),
                child: CircleAvatar(
                  radius: 40.0,
                  backgroundImage: CachedNetworkImageProvider("https://smartkit.wrteam.in/smartkit/images/profile2.png"),
                  backgroundColor: Colors.black,
                ),
              )
            ],
          ),
          Container(
            width: double.infinity,
            child: Card(
              elevation: 5,
              margin: EdgeInsets.only(top: 180, left: 50, right: 50),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text("Diana	Metcalfe", style: Theme.of(context).textTheme.headline6),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Bhuj-Kuchhch", style: Theme.of(context).textTheme.subtitle2),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: Card(
              elevation: 5,
              margin: EdgeInsets.only(top: 270, left: 50, right: 50),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text("demo@demo.com", textAlign: TextAlign.center, style: Theme.of(context).textTheme.subtitle2),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: Card(
              elevation: 5,
              margin: EdgeInsets.only(top: 320, left: 50, right: 50),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text("545644454", textAlign: TextAlign.center, style: Theme.of(context).textTheme.subtitle2),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: Card(
              elevation: 5,
              margin: EdgeInsets.only(top: 370, left: 50, right: 50),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam", textAlign: TextAlign.center, style: Theme.of(context).textTheme.subtitle2),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 500, left: 50, right: 50),
            child: CupertinoButton(
              borderRadius: BorderRadius.circular(100.0),
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.deepPurple[500],
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class CurvedShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: CURVE_HEIGHT,
      child: CustomPaint(
        painter: CurvePainter(),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.deepPurple[500];
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width / 2, size.height / 2, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
