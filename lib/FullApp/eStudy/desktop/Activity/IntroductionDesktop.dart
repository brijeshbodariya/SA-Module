import 'package:smartkit/FullApp/eStudy/desktop/Login/LoginActivityDesktop.dart';
import 'package:smartkit/FullApp/eStudy/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/eStudy/Model/Content_Model.dart';
import 'package:smartkit/FullApp/eStudy/helper/StringsRes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitHome.dart';

class IntroductionDesktop extends StatefulWidget {
  @override
  _IntroductionDesktopState createState() => _IntroductionDesktopState();
}

class _IntroductionDesktopState extends State<IntroductionDesktop> {
  int currentIndex = 0;
  PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            SizedBox(height: 78),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Padding(
                    padding: const EdgeInsets.all(1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                          Expanded(
                              child: SvgPicture.network(
                            contents[i].image,
                            height: MediaQuery.of(context).size.width * 0.45,
                            fit: BoxFit.fill,
                          )),
                          Expanded(
                            child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                              Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(
                                    contents[i].title,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: ColorsRes.introTitlecolor,
                                      fontSize: 28,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  )),
                              SizedBox(height: 20),
                              Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(
                                    contents[i].discription,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: ColorsRes.introMessagecolor,
                                    ),
                                  )),
                              SizedBox(height: 30),
                              Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 48,
                                    margin: EdgeInsets.only(left: 20),
                                    width: 176,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                        ColorsRes.secondgradientcolor,
                                        ColorsRes.firstgradientcolor,
                                      ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: TextButton(
                                          onPressed: () {
                                            if (currentIndex == contents.length - 1) {
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (_) => LoginActivityDesktop(),
                                                ),
                                              );
                                            }
                                            _controller.nextPage(
                                              duration: Duration(milliseconds: 100),
                                              curve: Curves.bounceIn,
                                            );
                                          },
                                          child: Center(
                                            child: Text(
                                              currentIndex == contents.length - 1 ? StringsRes.Get_Started_lb : StringsRes.Next_Button_lb,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 18, color: ColorsRes.white),
                                            ),
                                          )),
                                    ),
                                  )),
                              SizedBox(height: 30),
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    contents.length,
                                    (index) => buildDot(index, context),
                                  ),
                                ),
                              )
                            ]),
                          ),
                        ]),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(colors: [
          ColorsRes.secondgradientcolor,
          ColorsRes.firstgradientcolor,
        ], begin: Alignment.centerLeft, end: Alignment.centerRight),
      ),
    );
  }
}
