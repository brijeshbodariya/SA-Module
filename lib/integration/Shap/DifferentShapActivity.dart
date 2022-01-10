import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

enum ShapeList {Diagonal, Triangle, Arc, BottomCurve, TopBottomCurve, Square, Wave, Circle, Curve, RoundCornerLeft, Polygon, RoundRectangle, RoundDiagonal, Oval}


class DifferentShapActivity extends StatefulWidget {
  @override
  DifferentShapActivityState createState() => DifferentShapActivityState();
}

class DifferentShapActivityState extends State<DifferentShapActivity> {
  CustomClipper<Path> shape;
  ShapeList shapeType;

  List shapenamelist = [
    {
      'shapetype': ShapeList.Diagonal,
      'name': "Bottom Curve",
    },
    {
      'shapetype': ShapeList.Triangle,
      'name': "Triangle",
    },
    {
      'shapetype': ShapeList.Arc,
      'name': "Arc",
    },
    {
      'shapetype': ShapeList.BottomCurve,
      'name': "Bottom Curve",
    },
    {
      'shapetype': ShapeList.TopBottomCurve,
      'name': "Top Bottom Curve",
    },
    {
      'shapetype': ShapeList.Square,
      'name': "Square",
    },
    {
      'shapetype': ShapeList.RoundRectangle,
      'name': "Round Rectangle",
    },
    {
      'shapetype': ShapeList.Wave,
      'name': "Wave",
    },
    {
      'shapetype': ShapeList.Circle,
      'name': "Circle",
    },
    {
      'shapetype': ShapeList.Curve,
      'name': "Curve",
    },
    {
      'shapetype': ShapeList.RoundCornerLeft,
      'name': "Round Corner Left",
    },
    {
      'shapetype': ShapeList.RoundDiagonal,
      'name': "Round Diagonal",
    },
    {
      'shapetype': ShapeList.Diagonal,
      'name': "Diagonal",
    },
    {
      'shapetype': ShapeList.Oval,
      'name': "Oval",
    },
  ];

  @override
  void initState() {
    super.initState();
    shape = BottomCurveShape();
    shapeType = ShapeList.BottomCurve;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Different Shape',style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,leading: BackButton(
          color: Colors.black
      ),),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Container(
                margin: EdgeInsets.all(10),
                child: ClipPath(
                    clipper: shape,
                    child: Image.network('https://smartkit.wrteam.in/smartkit/ShapImage.jpg',fit: BoxFit.fill)
                ),
              ),
            ),
          ),

          btnListWidget(),
        ],
      ),
    );
  }

  Widget btnListWidget(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(alignment: WrapAlignment.center,spacing: 10,
          runSpacing: 4.0,children: List.generate(shapenamelist.length, (index) {
            return GestureDetector(
              onTap: () => setShape(shapenamelist[index]['shapetype']),
              child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xff58508d),
                      Color(0xff58508d),
                    ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    shapenamelist[index]['name'],
                    style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                  )),
            );
          })),
    );
  }

  void setShape(ShapeList shapeList) {
    CustomClipper<Path> selectedShape;
    switch (shapeList) {
      case ShapeList.Arc:
        selectedShape = ArcShape();
        break;
      case ShapeList.Diagonal:
        selectedShape = DiagonalShape();
        break;
      case ShapeList.BottomCurve:
        selectedShape = BottomCurveShape();
        break;
      case ShapeList.TopBottomCurve:
        selectedShape = TopBottomCurveShape();
        break;
      case ShapeList.Triangle:
        selectedShape = TriangleShape();
        break;
      case ShapeList.Square:
        selectedShape = SquareShape();
        break;
      case ShapeList.Wave:
        selectedShape = WaveShape();
        break;
      case ShapeList.Circle:
        selectedShape = CircleShape();
        break;
      case ShapeList.Curve:
        selectedShape = CurveShape();
        break;
      case ShapeList.RoundCornerLeft:
        selectedShape = RoundCornerLeftShape();
        break;
      case ShapeList.Polygon:
        selectedShape = PolygonShape();
        break;
      case ShapeList.RoundRectangle:
        selectedShape = RoundRectangleShape();
        break;
      case ShapeList.RoundDiagonal:
        selectedShape = RoundedDiagonalShape();
        break;
      case ShapeList.Oval:
        selectedShape = OvalShape();
        break;
    }
    setState(() {
      shape = selectedShape;
      shapeType = shapeList;
    });
  }

  TextStyle _getStyle(ShapeList shapeList) {
    if (shapeList != shapeType) return TextStyle();

    return TextStyle(
        color: Theme.of(context).primaryColor
    );
  }
}

class TriangleShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width/2, size.height * .8);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper customClipper) {
    return customClipper != this;
  }
}

class WaveShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * .65);
    var firstControlPoint = Offset(0, size.height * .75);
    var firstEndPoint = Offset(size.width / 6, size.height * .75);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.lineTo(size.width / 1.2, size.height * .75);
    var secControlPoint = Offset(size.width, size.height * .75);
    var secEndPoint = Offset(size.width, size.height * 0.85);
    path.quadraticBezierTo(
        secControlPoint.dx, secControlPoint.dy, secEndPoint.dx, secEndPoint.dy);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }


  @override
  bool shouldReclip(CustomClipper<Path> customClipper) {
    return customClipper != this;
  }
}

class CurveShape extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * .65);
    var firstControlPoint = Offset(0, size.height / 3.5);
    var firstEndPoint = Offset(size.width / 4.2, size.height / 3.5 + 10);
    var secControlPoint = Offset(size.width, size.height / 2.8);
    var secEndPoint = Offset(size.width, size.height / 3 - 40);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(
        secControlPoint.dx, secControlPoint.dy, secEndPoint.dx, secEndPoint.dy);
    path.lineTo(size.width, size.height / 3);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper customClipper) {
    return customClipper != this;
  }
}

class SquareShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addOval( Rect.largest);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper customClipper) {
    return customClipper != this;
  }
}

class CircleShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..addOval(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.height/2))
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper customClipper) {
    return customClipper != this;
  }
}

class RoundRectangleShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {

    double radius = 50;

    Path path = Path()
      ..lineTo(size.width - radius, 0)
      ..arcTo(
          Rect.fromPoints(
              Offset(size.width - radius, 0), Offset(size.width, radius)),
          1.5 * pi, 0.5 * pi, true)
      ..lineTo(size.width, size.height - radius)
      ..arcTo(Rect.fromCircle(center: Offset(size.width - radius, size.height - radius), radius: radius), 0, 0.5 * pi, false)
      ..lineTo(radius, size.height)
      ..arcTo(Rect.fromLTRB(0, size.height - radius, radius, size.height), 0.5 * pi, 0.5 * pi, false)
      ..lineTo(0, radius)
      ..arcTo(Rect.fromLTWH(0, 0, 70, 100), 1 * pi, 0.5 * pi, false)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper customClipper) {
    return customClipper != this;
  }
}

class RoundCornerLeftShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 50;

    Path path = Path()
      ..addRRect(RRect.fromRectAndCorners(
          Rect.fromCircle(
              center: Offset(size.width/2, size.height), radius: size.height
          ),
          topLeft: Radius.circular(radius)))
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper customClipper) {
    return customClipper != this;
  }
}

class PolygonShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var points = [
      Offset(size.width / 2, 0),
      Offset(0, size.height / 2),
      Offset(size.width / 2, size.height),
      Offset(size.width, size.height / 2)
    ];

    Path path = Path()
      ..addPolygon(points, false)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper customClipper) {
    return customClipper != this;
  }
}

class OvalShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {

    Path path = Path()
      ..addOval(Rect.fromLTWH(size.width/4, size.height/4, size.width / 2, size.height / 2))
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper customClipper) {
    return customClipper != this;
  }
}

class DiagonalShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * .95);
    path.lineTo(size.width, size.height * .7);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper customClipper) {
    return customClipper != this;
  }
}

class ArcShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * .7);
    path.arcToPoint(Offset(size.width, size.height), radius: Radius.elliptical(30, 10));
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper customClipper) {
    return customClipper != this;
  }
}

class PointsShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    double x = 0;
    double y = size.height;
    double increment = size.width / 20;
    while(x < size.width) {
      x += increment;
      y = (y == size.height) ? size.height * .88 : size.height;
      path.lineTo(x, y);
    }
    path.lineTo(size.width, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper customClipper) {
    return customClipper != this;
  }
}

class BottomCurveShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, size.height);
    double x = 0;
    double y = size.height;
    double yControlPoint = size.height * .88;
    double increment = size.width / 15;
    while (x < size.width) {
      path.quadraticBezierTo(x+increment/2, yControlPoint, x+increment, y);
      x += increment;
    }
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper customClipper) {
    return customClipper != this;
  }
}

class TopBottomCurveShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, size.height);
    double x = 0;
    double y = size.height;
    double yControlPoint = size.height * .85;
    double increment = size.width / 12;

    while (x < size.width) {
      path.quadraticBezierTo(x+increment/2, yControlPoint, x+increment, y);
      x += increment;
    }

    path.lineTo(size.width, 0.0);

    while (x > 0) {
      path.quadraticBezierTo(x-increment/2, size.height * .15, x-increment, 0);
      x -= increment;
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper customClipper) {
    return customClipper != this;
  }
}

class RoundedDiagonalShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0.0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0.0)
      ..quadraticBezierTo(size.width, 0.0, size.width - 20.0, 0.0)
      ..lineTo(40.0, 70.0)
      ..quadraticBezierTo(10.0, 85.0, 0.0, 120.0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> customClipper) {
    return customClipper != this;
  }
}