import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

import 'Helper/E_Commerce_Model.dart';

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

class Detail_Ecmmerce_4 extends StatefulWidget {
  final E_Commerce_Model model;
  final int index;

  Detail_Ecmmerce_4({this.index, this.model});

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<Detail_Ecmmerce_4> {
  List list;
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: new Stack(
        children: [
          CurvedShape(),
          Container(
            height: MediaQuery.of(context).size.height * .45,
            child: Center(
                child: CachedNetworkImage(
              imageUrl: widget.model.imgs[0],
              width: 200,
              height: 200,
            )),
          ),
          Container(
            child: Divider(),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                getProductImage(),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[Text(widget.model.title, style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.black)), Text('\$${widget.model.price}', style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.black))],
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${widget.model.description}', style: Theme.of(context).textTheme.caption.copyWith(color: Colors.black)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "Color",
                    ),
                  ),
                ),
                getColorList(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "Size",
                    ),
                  ),
                ),
                getSizeList(),
              ],
            ),
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * .38),
          ),
        ],
      )),
    );
  }

  Widget getColorList() {
    return Container(
      height: 50,
      child: Center(
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: widget.model.variation.color == null ? 0 : widget.model.variation.color.length,
            itemBuilder: (BuildContext context, int i) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: getColor(i),
              );
            }),
      ),
    );
  }

  Widget getSizeList() {
    return Container(
      height: 50,
      child: Center(
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: widget.model.variation.size == null ? 0 : widget.model.variation.size.length,
            itemBuilder: (BuildContext context, int i) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: getSize(i),
              );
            }),
      ),
    );
  }

  Widget getSize(int index) {
    return Text(widget.model.variation.size[index]);
  }

  Widget getColor(int index) {
    if (widget.model.variation.color[index].compareTo("red") == 0) {
      return CircleAvatar(
        backgroundColor: Colors.red,
      );
    } else if (widget.model.variation.color[index].compareTo("blue") == 0) {
      return CircleAvatar(
        backgroundColor: Colors.blue,
      );
    } else if (widget.model.variation.color[index].compareTo("black") == 0) {
      return CircleAvatar(
        backgroundColor: Colors.black,
      );
    } else if (widget.model.variation.color[index].compareTo("green") == 0) {
      return CircleAvatar(
        backgroundColor: Colors.green,
      );
    } else if (widget.model.variation.color[index].compareTo("white") == 0) {
      return CircleAvatar(
        backgroundColor: Colors.white,
      );
    } else if (widget.model.variation.color[index].compareTo("yellow") == 0) {
      return CircleAvatar(
        backgroundColor: Colors.yellow,
      );
    } else if (widget.model.variation.color[index].compareTo("pink") == 0) {
      return CircleAvatar(
        backgroundColor: Colors.pink,
      );
    } else if (widget.model.variation.color[index].compareTo("purple") == 0) {
      return CircleAvatar(
        backgroundColor: Colors.purple,
      );
    } else if (widget.model.variation.color[index].compareTo("grey") == 0) {
      return CircleAvatar(
        backgroundColor: Colors.grey,
      );
    } else if (widget.model.variation.color[index].compareTo("orange") == 0) {
      return CircleAvatar(
        backgroundColor: Colors.orange,
      );
    }
  }

  Widget getProductImage() {
    return Container(
      height: 88,
      child: Center(
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: widget.model.imgs == null ? 0 : widget.model.imgs.length,
            itemBuilder: (BuildContext context, int i) {
              return getProduct(i);
            }),
      ),
    );
  }

  Widget getProduct(int i) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        child: CachedNetworkImage(
          imageUrl: widget.model.imgs[i],
          width: 80,
          height: 80,
        ),
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
    paint.color = Color(0xff252D4A);
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.20);
    path.quadraticBezierTo(size.width / 2, size.height / 2, size.width, size.height * 0.35);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
