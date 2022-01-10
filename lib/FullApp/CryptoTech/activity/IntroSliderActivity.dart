import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:smartkit/FullApp/CryptoTech/activity/LoginActivity.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/StringsRes.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/ease_in_widget.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitHome.dart';

class IntroSliderActivity extends StatefulWidget {
  @override
  IntroSliderState createState() => new IntroSliderState();
}

class IntroSliderState extends State<IntroSliderActivity> {
  final _controller = PageController();
  double toppading;
  int currentpage = 0;

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    toppading = 2 * kToolbarHeight;

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
        backgroundColor: ColorsRes.bgcolor,
        bottomNavigationBar: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30.0, left: 30, right: 30),
            child: EaseInWidget(
              onTap: () {
                if (currentpage == 3) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginActivity()),
                  );
                } else {
                  _controller.jumpToPage(currentpage + 1);
                }
              },
              child: DesignConfig.ButtonWithShadowNew(currentpage == 3 ? StringsRes.getstarted : StringsRes.next, context),
            ),
          ),
        ),
        body: PageView(
          controller: _controller,
          children: <Widget>[
            PageData("https://smartkit.wrteam.in/smartkit/cryptotech/image_a.png", StringsRes.introtitle1, StringsRes.intro1, 0),
            PageData("https://smartkit.wrteam.in/smartkit/cryptotech/image_b.png", StringsRes.introtitle2, StringsRes.intro2, 1),
            PageData("https://smartkit.wrteam.in/smartkit/cryptotech/image_c.png", StringsRes.introtitle3, StringsRes.intro3, 2),
            PageData("https://smartkit.wrteam.in/smartkit/cryptotech/image_d.png", '', StringsRes.intro4, 3),
          ],
          onPageChanged: (int pageno) {
            setState(() {
              currentpage = pageno;
            });
          },
        ),
      ),
    );
  }

  Widget PageData(String image, String title, String desc, int pageindex) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
        bottom: toppading - 80,
      ),
      child: ScreenTypeLayout(
        mobile: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: image,
              // width: width - 40,
              height: width - 60,
            ),
            // Image.asset(
            //   image,
            //   // width: width - 40,
            //   height: width / 4,
            // ),
            SizedBox(
              height: title.trim().isEmpty ? 0 : 10,
            ),
            title.trim().isEmpty
                ? Container()
                : Text(title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline4.merge(TextStyle(
                          color: ColorsRes.appcolor,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'MyFont',
                        ))),
            SizedBox(
              height: width / 10,
            ),
            Padding(
              padding: EdgeInsets.all(0.0),
              // EdgeInsetsDirectional.only(start: 40, end: 40, top: 40, bottom: 30),
              child: Text(
                desc,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.button.merge(TextStyle(color: ColorsRes.txtlightcolor, decoration: TextDecoration.none, fontWeight: FontWeight.bold, fontFamily: 'MyFont')),
              ),
            ),
            SizedBox(
              height: width / 10,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    4,
                    (index) => Material(
                          color: pageindex == index ? ColorsRes.appcolor : ColorsRes.appcolor.withOpacity(0.3),
                          type: MaterialType.circle,
                          child: new Container(
                            width: 10,
                            height: 10,
                            margin: EdgeInsets.only(left: 3, right: 3),
                          ),
                        ))),
          ],
        ),
        desktop: Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          // CachedNetworkImage(
          //   imageUrl: image,
          //   // width: width - 40,
          //   height: width - 60,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Image.asset(
                  image,
                  // width: width - 40,
                  height: width / 2.5,
                ),
              ),
              SizedBox(
                width: width / 40,
              ),
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: title.trim().isEmpty ? 0 : 10,
                    ),
                    title.trim().isEmpty
                        ? Container()
                        : Text(title,
                            textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline4.merge(TextStyle(color: ColorsRes.appcolor, decoration: TextDecoration.none, fontWeight: FontWeight.bold, fontFamily: 'MyFont', fontSize: width / 20))),
                    SizedBox(
                      height: width / 30,
                    ),
                    Padding(
                      padding: EdgeInsets.all(0.0),
                      // EdgeInsetsDirectional.only(start: 40, end: 40, top: 40, bottom: 30),
                      child: Text(
                        desc,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.button.merge(TextStyle(color: ColorsRes.txtlightcolor, decoration: TextDecoration.none, fontWeight: FontWeight.bold, fontFamily: 'MyFont', fontSize: width / 60)),
                      ),
                    ),
                    SizedBox(
                      height: width / 10,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            4,
                            (index) => Material(
                                  color: pageindex == index ? ColorsRes.appcolor : ColorsRes.appcolor.withOpacity(0.3),
                                  type: MaterialType.circle,
                                  child: new Container(
                                    width: 10,
                                    height: 10,
                                    margin: EdgeInsets.only(left: 3, right: 3),
                                  ),
                                ))),
                  ],
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
