import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/Widget/Image_Slider/Image_Slider.dart';

class CarouselWithIndicatorDesktop extends StatefulWidget {
  @override
  _CarouselWithIndicatorStateDesktop createState() => _CarouselWithIndicatorStateDesktop();
}

class _CarouselWithIndicatorStateDesktop extends State<CarouselWithIndicatorDesktop> {
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider(
        items: child,
        options: CarouselOptions(
          height: 450,
          autoPlay: true,
          enlargeCenterPage: false,
          viewportFraction: 1.0,
          aspectRatio: 1.8,
          onPageChanged: (index, reason) {
            setState(() {
              current = index;
            });
          },
        ),
      ),
    ]);
  }
}

final List child = map<Widget>(
  homeSliderList,
  (index, i) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(children: <Widget>[
          CachedNetworkImage(
            imageUrl: i,
            fit: BoxFit.fill,
            width: double.maxFinite,
            height: double.maxFinite,
          ),
        ]),
      ),
    );
  },
).toList();

List homeSliderList = [
  "https://smartkit.wrteam.in/smartkit/music/slider1.jpg",
  "https://smartkit.wrteam.in/smartkit/music/slider2.jpg",
  "https://smartkit.wrteam.in/smartkit/music/slider3.jpg",
];
