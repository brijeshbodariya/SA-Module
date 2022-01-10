import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitHome.dart';

import 'WebView.dart';

class WebAppIntro extends StatefulWidget {
  @override
  _WebAppIntroState createState() => _WebAppIntroState();
}

class _WebAppIntroState extends State<WebAppIntro> {
  List pageInfos = [
    {
      "title": "Searching",
      "body": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
      "img": "assets/webapp/intro-1.svg",
    },
    {
      "title": "Live Meeting",
      "body": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
      "img": "assets/webapp/intro-2.svg",
    },
    {
      "title": "Learn",
      "body": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
      "img": "assets/webapp/intro-3.svg",
    },
  ];
  @override
  Widget build(BuildContext context) {
    List<PageViewModel> pages = [for (int i = 0; i < pageInfos.length; i++) _buildPageModel(pageInfos[i])];

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
        backgroundColor: Theme.of(context).primaryColor,
        body: IntroductionScreen(
          pages: pages,
          dotsDecorator: DotsDecorator(
            activeColor: webApp2,
          ),
          onDone: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => MyAppWeb(),
              ),
            );
          },
          onSkip: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => MyAppWeb(),
              ),
            );
          },
          showSkipButton: true,
          skip: Text(
            "Skip",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.grey,
            ),
          ),
          next: Text(
            "Next",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: webApp2,
            ),
          ),
          done: Container(
            padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0, bottom: 10.0),
            decoration: BoxDecoration(
              color: webApp3,
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Text(
              "Done",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildPageModel(Map item) {
    return PageViewModel(
      titleWidget: Text(item['title'],
          style: TextStyle(
            color: webApp3,
            fontSize: 28.0,
            fontWeight: FontWeight.w600,
          )),
      body: item['body'],
      image: Padding(
        padding: const EdgeInsets.only(top: 50.0, left: 15.0, right: 15.0, bottom: 15.0),
        child: SvgPicture.asset(
          item['img'],
        ),
      ),
      decoration: PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).accentColor,
        ),
        bodyTextStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
//        ),
        pageColor: Colors.white,
      ),
    );
  }
}
