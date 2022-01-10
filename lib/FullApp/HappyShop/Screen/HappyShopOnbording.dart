import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/FullApp/HappyShop/Helper/HappyShopColor.dart';
import 'package:smartkit/FullApp/HappyShop/desktop/introdesktop.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitHome.dart';

import 'HappyShopLogin.dart';

class HappyShopOnbording extends StatefulWidget {
  HappyShopOnbording({Key key}) : super(key: key);

  @override
  _HappyShopOnbordingState createState() => _HappyShopOnbordingState();
}

class _HappyShopOnbordingState extends State<HappyShopOnbording> {
  PageController _pageController;
  int currentIndex = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
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

  @override
  Widget build(BuildContext context) {
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
          body: Stack(
        children: [
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: <Widget>[
              IntroPage(
                // imgurl: "https://smartkit.wrteam.in/smartkit/happyshop/intro-1.svg",
                imgurl: "https://smartkit.wrteam.in/smartkit/happyshop/intro-1.svg",
                titletext: "Choose \nYour Products",
                subtext: "Discover New Spring Collection \nEveryday with Happyshop",
              ),
              IntroPage(
                // imgurl: "https://smartkit.wrteam.in/smartkit/happyshop/intro-2.svg",
                imgurl: "https://smartkit.wrteam.in/smartkit/happyshop/intro-2.svg",
                titletext: "Easy Payment \nMethod",
                subtext: "We connect you to your favourite online brands \nso let's browse it with Happyshop",
              ),
              IntroPage(
                // imgurl: "https://smartkit.wrteam.in/smartkit/happyshop/intro-3.svg",
                imgurl: "https://smartkit.wrteam.in/smartkit/happyshop/intro-3.svg",
                titletext: "Get Your Delivery \nat Home",
                subtext: "We offers best comfort product \nfor you and your family",
              ),
            ],
          ),
          Positioned(
            bottom: 15.0,
            left: MediaQuery.of(context).size.width / 8,
            right: MediaQuery.of(context).size.width / 8,
            child: InkWell(
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
                      builder: (BuildContext context) => HappyShopLogin(),
                    ),
                  );
                }
              },
              child: Container(
                height: 50.0,
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
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0), gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [happyshopcolor3, happyshopcolor2])),
              ),
            ),
          )
        ],
      )),
    );
  }
}

class IntroPage extends StatefulWidget {
  const IntroPage({
    Key key,
    @required this.imgurl,
    @required this.titletext,
    @required this.subtext,
  }) : super(key: key);

  final String imgurl, titletext, subtext;
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> with TickerProviderStateMixin {
  AnimationController _animationController, animationController;
  bool dragFromLeft = false;

  double opacityLevel = 0.0;
  Animation animation;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn));
    animationController.forward();
    setState(() {});
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ScreenTypeLayout(
      mobile: Center(
        child: Container(
          padding: EdgeInsets.only(left: 50, right: 50, bottom: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: SvgPicture.network(widget.imgurl),
                  ),
                  SizedBox(
                    height: width / 18,
                  ),
                ],
              ),
              FadeTransition(
                opacity: animationController.drive(CurveTween(curve: Curves.easeIn)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    widget.titletext,
                    style: TextStyle(color: Color(0xFF656565), fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              FadeTransition(
                opacity: animationController.drive(CurveTween(curve: Curves.easeIn)),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    widget.subtext,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: color1,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      desktop: IntroDesktop(
        imgurl: widget.imgurl,
        animationController: animationController,
        titletext: widget.titletext,
        subtext: widget.subtext,
        color1: color1,
      ),
    );
  }
}
