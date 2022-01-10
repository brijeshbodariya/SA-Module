import 'package:flutter/material.dart';
import '../Progress_Indicator/color_loader.dart';
import '../Progress_Indicator/color_loader_2.dart';
import '../Progress_Indicator/color_loader_3.dart';
import '../Progress_Indicator/color_loader_4.dart';
import '../Progress_Indicator/color_loader_5.dart';
import '../Progress_Indicator/dot_type.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Login Screen 1',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new MyHomePage(),
        debugShowCheckedModeBanner: false);
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.indigo,
    Colors.pinkAccent,
    Colors.blue
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Center(
              child: SingleChildScrollView(
                  child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Divider(
                height: 50.0,
                color: Colors.white,
              ),
              ColorLoader(
                  colors: colors, duration: Duration(milliseconds: 1200)),
              Divider(
                height: 20.0,
                color: Colors.white,
              ),
              ColorLoader3(
                radius: 15.0,
                dotRadius: 6.0,
              ),
              ColorLoader3(
                radius: 20.0,
                dotRadius: 5.0,
              ),
              Divider(height: 20.0, color: Colors.white),
              ColorLoader2(),
              Divider(
                height: 40.0,
                color: Colors.white,
              ),
              ColorLoader4(),
              Divider(
                height: 35.0,
                color: Colors.white,
              ),
              ColorLoader4(
                dotOneColor: Colors.pink,
                dotTwoColor: Colors.amber,
                dotThreeColor: Colors.deepOrange,
                dotType: DotType.square,
                duration: Duration(milliseconds: 1200),
              ),
              Divider(
                height: 35.0,
                color: Colors.white,
              ),
              ColorLoader4(
                dotOneColor: Colors.pink,
                dotTwoColor: Colors.amber,
                dotThreeColor: Colors.deepOrange,
                duration: Duration(seconds: 2),
              ),
              Divider(
                height: 40.0,
                color: Colors.white,
              ),
              ColorLoader4(
                dotOneColor: Colors.indigoAccent,
                dotTwoColor: Colors.teal,
                dotThreeColor: Colors.pink,
                dotType: DotType.diamond,
                duration: Duration(milliseconds: 1500),
              ),
              Divider(
                height: 30.0,
                color: Colors.white,
              ),
              ColorLoader5(
                dotOneColor: Colors.redAccent,
                dotTwoColor: Colors.blueAccent,
                dotThreeColor: Colors.green,
                dotType: DotType.circle,
                dotIcon: Icon(Icons.adjust),
                duration: Duration(seconds: 1),
              ),
            ],
          ))),
        ));
  }
}
