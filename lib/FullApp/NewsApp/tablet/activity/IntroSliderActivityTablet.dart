import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartkit/FullApp/NewsApp/tablet/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/NewsApp/tablet/helper/StringsRes.dart';
import 'package:smartkit/FullApp/NewsApp/tablet/helper/new_dialog.dart';
import 'package:smartkit/FullApp/NewsApp/tablet/activity/Login/LoginPageTablet.dart';

class IntroSliderActivityTablet extends StatefulWidget {
  @override
  IntroSliderStateTablet createState() => new IntroSliderStateTablet();
}

class IntroSliderStateTablet extends State<IntroSliderActivityTablet> {
  final _controller = PageController();
  double bottompadding;
  int currentpage = 0;
  bool isdialogshown = false;

  final _images = [
    "https://smartkit.wrteam.in/smartkit/newsapp/world_news.png",
    "https://smartkit.wrteam.in/smartkit/newsapp/exactly.png",
    "https://smartkit.wrteam.in/smartkit/newsapp/timely.png",
  ];
  final _introsubtext = [
    StringsRes.intro1,
    StringsRes.intro2,
    StringsRes.intro3,
  ];
  final _introtitle = [
    StringsRes.introtitle1,
    StringsRes.introtitle2,
    StringsRes.introtitle3,
  ];

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
    setState(() {
      bottompadding = (MediaQuery.of(context).size.height / 2) - 50;
    });

    return Container(
      //constraints: BoxConstraints.expand(),
      //color: ColorsRes.bgcolor,
      decoration: BoxDecoration(
        gradient: new RadialGradient(
          colors: [
            ColorsRes.secondgradientcolor,
            ColorsRes.firstgradientcolor,
            ColorsRes.thirdgradientcolor,
          ],
        ),
      ),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          PageView(
            physics: ClampingScrollPhysics(),
            controller: _controller,
            onPageChanged: (int pageno) {
              setState(() {
                currentpage = pageno;
              });

              if (currentpage == 2 && !isdialogshown) {
                openNotificationDialog();
                setState(() {
                  isdialogshown = true;
                });
              }
            },
            children: List.generate(3, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 25.0, left: 15, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _introtitle[currentpage],
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline5.merge(TextStyle(color: ColorsRes.white, decoration: TextDecoration.none, fontWeight: FontWeight.bold, fontFamily: 'MyFont')),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                      child: CachedNetworkImage(
                        imageUrl: _images[currentpage],
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      _introsubtext[currentpage],
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.white, decoration: TextDecoration.none, height: 1.3, fontFamily: 'MyFont')),
                    ),
                  ],
                ),
              );
            }),
          ),
          Stack(
            alignment: AlignmentDirectional.topStart,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 35),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    for (int i = 0; i < 3; i++)
                      if (i == currentpage) ...[circleBar(true)] else circleBar(false),
                  ],
                ),
              ),
            ],
          ),
          Visibility(
            visible: currentpage == 2 ? true : false,
            child: Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Container(
                margin: EdgeInsets.only(right: 16, bottom: 16),
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => LoginPageTablet()));
                  },
                  shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(26))),
                  child: Icon(Icons.arrow_forward),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget circleBar(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: isActive ? 12 : 10,
      width: isActive ? 12 : 10,
      decoration: BoxDecoration(color: isActive ? ColorsRes.white : ColorsRes.white.withOpacity(0.5), borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }

  openNotificationDialog() {
    showNewDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Notification"),
          content: Text(StringsRes.introdialogmsg),
          actions: [
            TextButton(
              child: Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Yes"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
