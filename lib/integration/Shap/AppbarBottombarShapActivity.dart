import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_builder/responsive_builder.dart';


const curveHeight = 160.0;
const centerRoundResial = curveHeight * 0.28;
const center_shap = centerRoundResial * 2;
class AppbarBottombarShapActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new AppbarBottombarShapActivityState();
  }
}

class AppbarBottombarShapActivityState extends State<AppbarBottombarShapActivity> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar And Bottom Shape',style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,leading: BackButton(
          color: Colors.black
      ),),
        resizeToAvoidBottomInset: false,
        body: ScreenTypeLayout(
          mobile: AppWidget(),
          tablet: AppWidget(),
          desktop: WebWidget(),
        ),
    );
  }
}

class CurvedShap extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Color(0xffbc5090)
      ..strokeWidth = 15;

    var path = Path();

    path.moveTo(0, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.7,
        size.width * 0.5, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.9,
        size.width * 1.0, size.height * 0.8);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class CenterCurveShap extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Color(0xff58508d);
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.25);
    path.quadraticBezierTo(
        size.width / 2, size.height / 2, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class CustomShapeBorder extends ContinuousRectangleBorder {
  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {

    final double innerCircleRadius = 150.0;

    Path path = Path();
    path.lineTo(0, rect.height);
    path.quadraticBezierTo(rect.width / 2 - (innerCircleRadius / 2) - 30, rect.height + 15, rect.width / 2 - 75, rect.height + 50);
    path.cubicTo(
        rect.width / 2 - 40, rect.height + innerCircleRadius - 40,
        rect.width / 2 + 40, rect.height + innerCircleRadius - 40,
        rect.width / 2 + 75, rect.height + 50
    );
    path.quadraticBezierTo(rect.width / 2 + (innerCircleRadius / 2) + 30, rect.height + 15, rect.width, rect.height);
    path.lineTo(rect.width, 0.0);
    path.close();

    return path;
  }
}

Widget AppWidget(){
  return Container(
    child: Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(child: Text("Appbar Shape",style: TextStyle(color: Colors.black,fontSize: 20))),
            SizedBox(height: 20),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: curveHeight,
                  child: CustomPaint(
                    painter: AppbarShape(),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: curveHeight - center_shap),
                    width: double.infinity,
                    height: center_shap,
                    padding: EdgeInsets.all(8),
                    child: Container(
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff003f5c),
                      ),
                      child: new Icon(
                        Icons.person_rounded,
                        color: Colors.white,
                        size: centerRoundResial,
                      ),
                    )),
              ],
            ),
            SizedBox(height: 20),
            Divider(height: 2,color: Colors.grey),
            Column(
              children: [
                SizedBox(height: 20),
                Center(child: Text("Bottom Shape",style: TextStyle(color: Colors.black,fontSize: 20))),
                ClipPath(
                    clipper: WaveClipperTwo(reverse: true),child: Container(height: 100,color: Color(0xffbc5090),child: Row(
                  children: [
                    Column(
                      children: [
                        Text("Home",style: TextStyle(color: Colors.white,fontSize: 10)),
                        SizedBox(height: 2),
                      ],
                    ),
                    Column(
                      children: [
                        Text("Setting",style: TextStyle(color: Colors.white,fontSize: 10)),
                        SizedBox(height: 2),
                      ],
                    ),
                    Column(
                      children: [
                        Text("More",style: TextStyle(color: Colors.white,fontSize: 10)),
                        SizedBox(height: 2),
                      ],
                    ),
                  ],
                ),)),
                SizedBox(height: 20),
                Divider(height: 2,color: Colors.grey),
                SizedBox(height: 20),
                Center(child: Text("Chat Shape",style: TextStyle(color: Colors.black,fontSize: 20))),
                SizedBox(height: 20),
                ClipPath(
                    clipper: OvalRightShape(),child: Container(height: 100,color: Color(0xff58508d),child: Column(
                  children: [
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(width: 10),
                        Text("Me: Hey",style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: 10),
                        Text("You: Hey",style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: 10),
                        Text("Me: How Are You?",style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: 10),
                        Text("You: Good",style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ],
                ),)),
                SizedBox(height: 20),
                Divider(height: 2,color: Colors.grey),
                SizedBox(height: 20),
                Center(child: Text("Appbar Shape",style: TextStyle(color: Colors.black,fontSize: 20))),
                SizedBox(height: 20),
                ClipPath(
                    clipper: OvalBottomShape(),child: Container(height: 100,color: Color(0xffffa600),child: Center(child: Text("SmartKit",style: TextStyle(color: Colors.white,fontSize: 20))),)),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget WebWidget(){
  return Center(
    child: Container(width: 500,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(child: Text("Appbar Shape",style: TextStyle(color: Colors.black,fontSize: 20))),
              SizedBox(height: 20),
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: curveHeight,
                    child: CustomPaint(
                      painter: AppbarShape(),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: curveHeight - center_shap),
                      width: double.infinity,
                      height: center_shap,
                      padding: EdgeInsets.all(8),
                      child: Container(
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff003f5c),
                        ),
                        child: new Icon(
                          Icons.person_rounded,
                          color: Colors.white,
                          size: centerRoundResial,
                        ),
                      )),
                ],
              ),
              SizedBox(height: 20),
              Divider(height: 2,color: Colors.grey),
              Column(
                children: [
                  SizedBox(height: 20),
                  Center(child: Text("Bottom Shape",style: TextStyle(color: Colors.black,fontSize: 20))),
                  ClipPath(
                      clipper: WaveClipperTwo(reverse: true),child: Container(height: 100,color: Color(0xffbc5090),child: Row(
                    children: [
                      Column(
                        children: [
                          Text("Home",style: TextStyle(color: Colors.white,fontSize: 10)),
                          SizedBox(height: 2),
                        ],
                      ),
                      Column(
                        children: [
                          Text("Setting",style: TextStyle(color: Colors.white,fontSize: 10)),
                          SizedBox(height: 2),
                        ],
                      ),
                      Column(
                        children: [
                          Text("More",style: TextStyle(color: Colors.white,fontSize: 10)),
                          SizedBox(height: 2),
                        ],
                      ),
                    ],
                  ),)),
                  SizedBox(height: 20),
                  Divider(height: 2,color: Colors.grey),
                  SizedBox(height: 20),
                  Center(child: Text("Chat Shape",style: TextStyle(color: Colors.black,fontSize: 20))),
                  SizedBox(height: 20),
                  ClipPath(
                      clipper: OvalRightShape(),child: Container(height: 100,color: Color(0xff58508d),child: Column(
                    children: [
                      SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Text("Me: Hey",style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Text("You: Hey",style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Text("Me: How Are You?",style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Text("You: Good",style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ],
                  ),)),
                  SizedBox(height: 20),
                  Divider(height: 2,color: Colors.grey),
                  SizedBox(height: 20),
                  Center(child: Text("Appbar Shape",style: TextStyle(color: Colors.black,fontSize: 20))),
                  SizedBox(height: 20),
                  ClipPath(
                      clipper: OvalBottomShape(),child: Container(height: 100,color: Color(0xffffa600),child: Center(child: Text("SmartKit",style: TextStyle(color: Colors.white,fontSize: 20))),)),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class AppbarShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..style = PaintingStyle.fill
      ..isAntiAlias = true
      ..color = Color(0xff003f5c);

    Offset circleCenter = Offset(size.width / 2, size.height - centerRoundResial);

    Offset topLeft = Offset(0, 0);
    Offset bottomLeft = Offset(0, size.height * 0.25);
    Offset topRight = Offset(size.width, 0);
    Offset bottomRight = Offset(size.width, size.height * 0.5);

    Offset leftCurveControlPoint = Offset(circleCenter.dx * 0.5, size.height - centerRoundResial * 1.5);
    Offset rightCurveControlPoint = Offset(circleCenter.dx * 1.6, size.height - centerRoundResial);

    final arcStartAngle = 200 / 180 * pi;
    final avatarLeftPointX = circleCenter.dx + centerRoundResial * cos(arcStartAngle);
    final avatarLeftPointY = circleCenter.dy + centerRoundResial * sin(arcStartAngle);
    Offset avatarLeftPoint = Offset(avatarLeftPointX, avatarLeftPointY); // the left point of the arc

    final arcEndAngle = -5 / 180 * pi;
    final avatarRightPointX = circleCenter.dx + centerRoundResial * cos(arcEndAngle);
    final avatarRightPointY = circleCenter.dy + centerRoundResial * sin(arcEndAngle);
    Offset avatarRightPoint = Offset(avatarRightPointX, avatarRightPointY); // the right point of the arc

    Path path = Path()
      ..moveTo(topLeft.dx, topLeft.dy) // this move isn't required since the start point is (0,0)
      ..lineTo(bottomLeft.dx, bottomLeft.dy)
      ..quadraticBezierTo(leftCurveControlPoint.dx, leftCurveControlPoint.dy, avatarLeftPoint.dx, avatarLeftPoint.dy)
      ..arcToPoint(avatarRightPoint, radius: Radius.circular(centerRoundResial))
      ..quadraticBezierTo(rightCurveControlPoint.dx, rightCurveControlPoint.dy, bottomRight.dx, bottomRight.dy)
      ..lineTo(topRight.dx, topRight.dy)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class WaveClipperTwo extends CustomClipper<Path> {
  bool reverse;
  bool flip;

  WaveClipperTwo({this.reverse = true, this.flip = false});

  @override
  Path getClip(Size size) {
    var path = Path();
    if (!reverse && !flip) {
      path.lineTo(0.0, size.height - 20);

      var firstControlPoint = Offset(size.width / 4, size.height);
      var firstEndPoint = Offset(size.width / 2.25, size.height - 30.0);
      path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
          firstEndPoint.dx, firstEndPoint.dy);

      var secondControlPoint =
      Offset(size.width - (size.width / 3.25), size.height - 65);
      var secondEndPoint = Offset(size.width, size.height - 40);
      path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
          secondEndPoint.dx, secondEndPoint.dy);

      path.lineTo(size.width, size.height - 40);
      path.lineTo(size.width, 0.0);
      path.close();
    } else if (!reverse && flip) {
      path.lineTo(0.0, size.height - 40);
      var firstControlPoint = Offset(size.width / 3.25, size.height - 65);
      var firstEndPoint = Offset(size.width / 1.75, size.height - 20);
      path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
          firstEndPoint.dx, firstEndPoint.dy);

      var secondCP = Offset(size.width / 1.25, size.height);
      var secondEP = Offset(size.width, size.height - 30);
      path.quadraticBezierTo(
          secondCP.dx, secondCP.dy, secondEP.dx, secondEP.dy);

      path.lineTo(size.width, size.height - 20);
      path.lineTo(size.width, 0.0);
      path.close();
    } else if (reverse && flip) {
      path.lineTo(0.0, 20);
      var firstControlPoint = Offset(size.width / 3.25, 65);
      var firstEndPoint = Offset(size.width / 1.75, 40);
      path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
          firstEndPoint.dx, firstEndPoint.dy);

      var secondCP = Offset(size.width / 1.25, 0);
      var secondEP = Offset(size.width, 30);
      path.quadraticBezierTo(
          secondCP.dx, secondCP.dy, secondEP.dx, secondEP.dy);

      path.lineTo(size.width, size.height);
      path.lineTo(0.0, size.height);
      path.close();
    } else {
      path.lineTo(0.0, 20);

      var firstControlPoint = Offset(size.width / 4, 0.0);
      var firstEndPoint = Offset(size.width / 2.25, 30.0);
      path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
          firstEndPoint.dx, firstEndPoint.dy);

      var secondControlPoint = Offset(size.width - (size.width / 3.25), 65);
      var secondEndPoint = Offset(size.width, 40);
      path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
          secondEndPoint.dx, secondEndPoint.dy);

      path.lineTo(size.width, size.height);
      path.lineTo(0.0, size.height);
      path.close();
    }

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class OvalRightShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width - 40, 0);
    path.quadraticBezierTo(
        size.width, size.height / 4, size.width, size.height / 2);
    path.quadraticBezierTo(size.width, size.height - (size.height / 4),
        size.width - 40, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}


class OvalBottomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(
        size.width - size.width / 4, size.height, size.width, size.height - 40);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

