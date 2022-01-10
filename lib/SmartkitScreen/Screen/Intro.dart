import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit/Constant/Slideanimation.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitHome.dart';

class IntroSlider extends StatefulWidget {
  @override
  _IntroSliderState createState() => _IntroSliderState();
}

class _IntroSliderState extends State<IntroSlider> with SingleTickerProviderStateMixin {
  String svg1;
  PageController _pageController;
  AnimationController _animationController;
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();

  // Will print error messages to the console.
  final String assetName = 'https://smartkit.wrteam.in/smartkit/images/intro1.svg';
  Widget svg;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);

    // _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 2000));
    super.initState();
    // svg1 = 'https://smartkit.wrteam.in/smartkit/images/1intro.svg';
    svg = SvgPicture.network(
      assetName,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<Widget> indicators = [];
  void onAddButtonTapped(int index) {
    // use this to animate to the page
    _pageController.animateToPage(index, duration: Duration(milliseconds: 1000), curve: Curves.elasticInOut);

    // or this to jump to it without animating
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20, top: 20),
            child: InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                width: 50.0,
                height: 50.0,
                child: GestureDetector(
                  onTap: () {
                    // _animationController.dispose();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => MyHomePage(),
                      ),
                    );
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(color: color1, fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: <Widget>[
              IntroPage1(
                svg1: svg,
              ),
              IntroPage2(),
              IntroPage3(),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 80, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: _buildIndicator(),
            ),
          ),
          InkWell(
            onTap: () {
              if (currentIndex == 0) {
                setState(() {
                  indicators.add(_indicator(true));

                  currentIndex = 1;
                  onAddButtonTapped(currentIndex);
                });
              } else if (currentIndex == 1) {
                setState(() {
                  indicators.add(_indicator(true));
                  currentIndex = 2;
                  onAddButtonTapped(currentIndex);
                });
              } else if (currentIndex == 2) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => MyHomePage(),
                  ),
                );
              }
            },
            child: Container(
              height: 50.0,
              width: double.infinity,
              child: Center(
                child: Text(
                  currentIndex == 0
                      ? "Next"
                      : currentIndex == 1
                          ? "Next"
                          : "Start Now",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [color1, color2])),
            ),
          )
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: 6,
        width: isActive ? 15 : 5,
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          // gradient:
          // LinearGradient(begin: Alignment.centerLeft,
          // end: Alignment.centerRight, colors: [color1, color1]),
          color: isActive ? color1 : color2,
        ));
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
}

class IntroPage1 extends StatefulWidget {
  final Widget svg1;

  const IntroPage1({
    Key key,
    this.svg1,
  }) : super(key: key);

  @override
  _IntroPage1State createState() => _IntroPage1State();
}

class _IntroPage1State extends State<IntroPage1> with TickerProviderStateMixin {
  AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SlideAnimation(slideDirection: SlideDirection.fromRight, itemCount: 2, animationController: _animationController, position: 1, child: widget.svg1),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
          SlideAnimation(
            slideDirection: SlideDirection.fromRight,
            itemCount: 3,
            animationController: _animationController,
            position: 2,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        width: 4.0,
                        color: color3,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "We are Your \nBest Digital Solution",
                      style: TextStyle(color: color3, fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SlideAnimation(
            slideDirection: SlideDirection.fromRight,
            itemCount: 4,
            animationController: _animationController,
            position: 3,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Lorem Ipsum is simply dummy \ntext of the printing ",
                style: TextStyle(
                  color: color1,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IntroPage2 extends StatefulWidget {
  const IntroPage2({
    Key key,
  }) : super(key: key);

  @override
  _IntroPage2State createState() => _IntroPage2State();
}

class _IntroPage2State extends State<IntroPage2> with TickerProviderStateMixin {
  AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String intro2 = 'https://smartkit.wrteam.in/smartkit/images/intro2.svg';

    return Container(
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SlideAnimation(slideDirection: SlideDirection.fromRight, itemCount: 2, animationController: _animationController, position: 1, child: SvgPicture.network(intro2)),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
          SlideAnimation(
            slideDirection: SlideDirection.fromRight,
            itemCount: 3,
            animationController: _animationController,
            position: 2,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        width: 4.0,
                        color: color3,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "We are Here \nfor Achieve Your Goal",
                      style: TextStyle(color: color3, fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SlideAnimation(
            slideDirection: SlideDirection.fromRight,
            itemCount: 4,
            animationController: _animationController,
            position: 3,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Lorem Ipsum is simply dummy \ntext of the printing ",
                style: TextStyle(
                  color: color1,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IntroPage3 extends StatefulWidget {
  const IntroPage3({
    Key key,
  }) : super(key: key);

  @override
  _IntroPage3State createState() => _IntroPage3State();
}

class _IntroPage3State extends State<IntroPage3> with TickerProviderStateMixin {
  AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SlideAnimation(slideDirection: SlideDirection.fromRight, itemCount: 2, animationController: _animationController, position: 1, child: SvgPicture.network('https://smartkit.wrteam.in/smartkit/images/intro3.svg')),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
          SlideAnimation(
            slideDirection: SlideDirection.fromRight,
            itemCount: 3,
            animationController: _animationController,
            position: 2,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        width: 4.0,
                        color: color3,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Start with US & \nIncrease Your Business",
                      style: TextStyle(color: color3, fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SlideAnimation(
            slideDirection: SlideDirection.fromRight,
            itemCount: 4,
            animationController: _animationController,
            position: 3,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Lorem Ipsum is simply dummy \ntext of the printing ",
                style: TextStyle(
                  color: color1,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
