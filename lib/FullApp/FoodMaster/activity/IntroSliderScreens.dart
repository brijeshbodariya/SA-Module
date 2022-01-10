import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/FoodMaster/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/FoodMaster/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/FoodMaster/helper/StringsRes.dart';
import 'package:smartkit/FullApp/FoodMaster/activity/authentication/LoginHomePage.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitHome.dart';

class IntroSliderScreens extends StatefulWidget {
  @override
  IntroSliderState createState() => new IntroSliderState();
}

class IntroSliderState extends State<IntroSliderScreens> {
  final _controller = PageController();
  double toppading;
  int currentpage = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    toppading = kToolbarHeight;

    return WillPopScope(
      onWillPop: () {
        return Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(),
          ),
        );
      },
      child: Container(
        color: ColorsRes.bgcolor,
        child: Stack(
          children: <Widget>[
            PageView(
              controller: _controller,
              children: <Widget>[
                pageData("https://smartkit.wrteam.in/smartkit/foodmaster/onboarding_one.png", StringsRes.introtitle1, StringsRes.intro1, 0),
                pageData("https://smartkit.wrteam.in/smartkit/foodmaster/onboarding_two.png", StringsRes.introtitle2, StringsRes.intro2, 1),
                pageData("https://smartkit.wrteam.in/smartkit/foodmaster/onboarding_three.png", StringsRes.introtitle3, StringsRes.intro3, 2),
              ],
              onPageChanged: (int pageno) {
                setState(() {
                  currentpage = pageno;
                });
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30.0, left: 30, right: 30),
                child: GestureDetector(
                  onTap: () {
                    if (currentpage == 2) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginHomePage(
                                  from: "intro",
                                )),
                      );
                    } else {
                      _controller.jumpToPage(currentpage + 1);
                    }
                  },
                  child: CircleAvatar(
                    backgroundColor: ColorsRes.appcolor,
                    radius: 30,
                    child: Icon(
                      Icons.arrow_forward,
                      color: ColorsRes.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget pageData(String image, String title, String desc, int pageindex) {
    var width = MediaQuery.of(context).size.width;
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      CachedNetworkImage(
        width: width / 1.3,
        imageUrl: image,
      ),
      SizedBox(height: 5),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              3,
              (index) => pageindex == index
                  ? Container(
                      width: 20,
                      height: 5,
                      decoration: DesignConfig.boxDecorationContainer(ColorsRes.IconColor, 8),
                    )
                  : Material(
                      color: ColorsRes.IconColor.withOpacity(0.5),
                      type: MaterialType.circle,
                      child: new Container(
                        width: 7,
                        height: 7,
                        margin: EdgeInsets.only(left: 3, right: 3),
                      ),
                    ))),
      SizedBox(height: 20),
      title.trim().isEmpty ? Container() : Text(title, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline5.merge(TextStyle(color: ColorsRes.black, decoration: TextDecoration.none, fontFamily: 'appfont'))),
      Padding(
        padding: const EdgeInsetsDirectional.only(start: 40, end: 40, top: 10, bottom: 20),
        child: Text(
          desc,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.grey, decoration: TextDecoration.none, fontWeight: FontWeight.bold, fontFamily: 'appfont')),
        ),
      ),
    ]);
  }
}
