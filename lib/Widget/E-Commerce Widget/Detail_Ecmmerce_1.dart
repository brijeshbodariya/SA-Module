import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:smartkit/Widget/Dialog/Flutter_Rating_Bar.dart';

import 'Helper/E_Commerce_Model.dart';

class Detail_Ecmmerce_1 extends StatefulWidget {
  final int index;

  final E_Commerce_Model model;

  Detail_Ecmmerce_1({this.index, this.model});

  @override
  _Detail_Ecmmerce_1State createState() => _Detail_Ecmmerce_1State();
}

class _Detail_Ecmmerce_1State extends State<Detail_Ecmmerce_1> {
  @override
  Widget build(BuildContext context) {
    // timeDilation = 3.0;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Stack(children: <Widget>[
            CachedNetworkImage(
              imageUrl: widget.model.imgs[0],
              height: MediaQuery.of(context).size.height * .35,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Hero(
                tag: "item${widget.index}",
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * .23),
                      child: Card(
                        child: ClipPath(
                          child: Container(
                            child: CachedNetworkImage(
                              imageUrl: widget.model.imgs[0],
                              height: MediaQuery.of(context).size.width / 3.5,
                              width: MediaQuery.of(context).size.width / 3.5,
                            ),
                            height: 150,
                            decoration: BoxDecoration(
                                border: Border(right: BorderSide(color: Colors.black, width: 2), left: BorderSide(color: Colors.black, width: 2), top: BorderSide(color: Colors.black, width: 2), bottom: BorderSide(color: Colors.black, width: 2))),
                          ),
                          clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
                        ),
                      ),
                    ),
                  ],
                )),
          ]),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[Text(widget.model.title, style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.black)), Text('\$${widget.model.price}', style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.black))],
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlutterRatingBar(
                  initialRating: 3,
                  fillColor: Colors.amber,
                  borderColor: Colors.amber,
                  allowHalfRating: true,
                  itemSize: 20,
                  onRatingUpdate: (rating) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.model.description, style: Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.black)),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "Color",
                  ),
                ),
              ),
              getColorList(),
              getProductImage(),
            ],
          )
        ],
      ),
    ));
  }

  @override
  dispose() {
    // timeDilation = 1.0;
    super.dispose();
  }

  Widget getProductImage() {
    return Container(
      height: 120,
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
          width: (MediaQuery.of(context).size.width / 3) - 30,
          height: 100,
        ),
      ),
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

  @override
  void initState() {
    super.initState();
  }
}

class ValleyQuadraticCurve extends Curve {
  @override
  double transform(double t) {
    assert(t >= 0.0 && t <= 1.0);
    return 4 * math.pow(t - 0.5, 2);
  }
}
