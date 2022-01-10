import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/Grobag/Helper/GrobagColor.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitHome.dart';
import 'GrobagSignupMain.dart';

class GrobagOnbording extends StatefulWidget {
  GrobagOnbording({Key key}) : super(key: key);

  @override
  _GrobagOnbordingState createState() => _GrobagOnbordingState();
}

class _GrobagOnbordingState extends State<GrobagOnbording> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  double height;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  final slideList = [
    Slide(
      imageUrl: 'https://smartkit.wrteam.in/smartkit/grobag/intro_a.png',
      title: "Exiting Offers",
      description: "Get new offers and great deals everyday every hours",
    ),
    Slide(
      imageUrl: 'https://smartkit.wrteam.in/smartkit/grobag/intro_b.png',
      title: "Shop Your Daily Needs",
      description: "You won't find it cheaper anywhere else then Grobag",
    ),
    Slide(
      imageUrl: 'https://smartkit.wrteam.in/smartkit/grobag/intro_c.png',
      title: '1000+ Products',
      description: "Shop and get delivery at your time and convience",
    ),
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  Widget _slider() {
    return Expanded(
      child: PageView.builder(
        itemCount: slideList.length,
        scrollDirection: Axis.horizontal,
        controller: _pageController,
        onPageChanged: _onPageChanged,
        itemBuilder: (BuildContext context, int index) {
          print('HIEGHT: $height');
          return Column(
            children: [
              Expanded(
                child: CachedNetworkImage(
                  imageUrl: slideList[index].imageUrl,
                  //'https://smartkit.wrteam.in/smartkit/grobag/back.png',
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height <= 640.0 ? 20.0 : 45.0),
                child: Text(slideList[currentIndex].title, style: Theme.of(context).textTheme.headline5.copyWith(color: fontColor)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  padding: EdgeInsets.only(top: height <= 640.0 ? 10.0 : 20.0, left: 10.0, right: 10.0),
                  child: Text(slideList[currentIndex].description, textAlign: TextAlign.center, style: Theme.of(context).textTheme.subtitle1.copyWith(color: fontLight, fontWeight: FontWeight.normal)),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: 6,
        width: isActive ? 25 : 7,
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: isActive ? primary : fontLight,
        ));
  }

  _btn() {
    var width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      padding: EdgeInsets.only(bottom: height <= 640.0 ? 20.0 : 50.0, left: 30.0, right: 30.0),
      child: CupertinoButton(
        color: primary,
        onPressed: () {
          if (currentIndex == 0) {
            setState(() {
              _pageController.jumpToPage(1);
            });
          } else if (currentIndex == 1) {
            setState(() {
              _pageController.jumpToPage(2);
            });
          } else if (currentIndex == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => GrobagSignupMain(),
              ),
            );
          }
        },
        child: Container(
          child: Text("Next", textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline6.copyWith(color: white, fontWeight: FontWeight.normal)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () {
        return Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(),
          ),
        );
      },
      child: Scaffold(
        body: Container(
          width: width,
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _slider(),
              Container(
                margin: EdgeInsets.only(bottom: height <= 640.0 ? 20.0 : 30, top: height <= 640.0 ? 20.0 : 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildIndicator(),
                ),
              ),
              _btn(),
            ],
          ),
        ),
      ),
    );
  }
}

class Slide {
  final String imageUrl;
  final String title;
  final String description;

  Slide({
    @required this.imageUrl,
    @required this.title,
    @required this.description,
  });
}
