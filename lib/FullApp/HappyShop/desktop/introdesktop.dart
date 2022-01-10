import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroDesktop extends StatelessWidget {
  const IntroDesktop({Key key, this.imgurl, this.animationController, this.titletext, this.subtext, this.color1}) : super(key: key);

  final String imgurl;
  final AnimationController animationController;
  final String titletext;
  final String subtext;
  final Color color1;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  // child: SvgPicture.network(imgurl),
                  child: SvgPicture.asset(
                    imgurl,
                    height: width / 2.5,
                  ),
                ),
                SizedBox(
                  height: width / 18,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FadeTransition(
                  opacity: animationController,
                  child: Padding(
                    padding: EdgeInsets.only(left: 0),
                    child: Text(
                      titletext,
                      style: TextStyle(color: Color(0xFF656565), fontSize: width / 20, fontWeight: FontWeight.bold),
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
                      subtext,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: color1,
                        fontSize: width / 60,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
