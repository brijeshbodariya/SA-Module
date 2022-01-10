import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/FullApp/SmartKey/desktop/SmartKeyScreens/SmartKeyCategoryDesktop.dart';
import 'package:smartkit/FullApp/SmartKey/Widget/SmartKeyBtn.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitHome.dart';

import 'SmartKeyBattelDesktop.dart';

class SmartKeyHomeDateDesktop extends StatefulWidget {
  SmartKeyHomeDateDesktop({Key key}) : super(key: key);

  @override
  _SmartKeyHomeDateDesktopState createState() =>
      _SmartKeyHomeDateDesktopState();
}

class _SmartKeyHomeDateDesktopState extends State<SmartKeyHomeDateDesktop>
    with TickerProviderStateMixin {
  double xoffSet = 0;
  double yoffSet = 0;
  double angle = 0;

  bool isOpen = false;
  bool isPlaying = false;

  Widget appBar() {
    return AppBar(
      leading: null,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Text("SmartKey"),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.translate),
            onPressed: () {
              // showDialog(
              //     context: context,
              //     builder: (_) {
              //       return ShowLanguageDialog();
              //     });
            })
      ],
    );
  }

  Widget playQuiz() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SmartKeyBtn(
          btnwidth: MediaQuery.of(context).size.width / 1.2,
          title: 'Play Quiz',
          bg: smartkey3,
          titlecolor: Colors.white,
          route: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SmartKeyCategoryDesktop(),
              ),
            );
          },
        ));
  }

  Widget playBattle() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SmartKeyBtn(
          btnwidth: MediaQuery.of(context).size.width / 1.2,
          title: 'Play Battle',
          bg: smartkey3,
          titlecolor: Colors.white,
          route: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SamrtKeyBattleDesktop(),
              ),
            );
          },
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
      child: AnimatedContainer(
        transform: Matrix4Transform()
            .translate(x: xoffSet, y: yoffSet)
            .rotate(angle)
            .matrix4,
        duration: Duration(milliseconds: 350),
        child: GestureDetector(
          onPanUpdate: (details) {
            if (details.delta.dx > 0) {
              setState(() {
                xoffSet = 150;
                yoffSet = 150;
                angle = -0.2;
                isOpen = true;
              });
            } else {
              setState(() {
                xoffSet = 0;
                yoffSet = 0;
                angle = 0;
                isOpen = false;
              });
            }
          },
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [smartkey3, smartkey2],
                    stops: [0.1, 0.8]),
                borderRadius: isOpen
                    ? BorderRadius.circular(20)
                    : BorderRadius.circular(0)),
            child: Column(
              children: <Widget>[
                appBar(),
                Container(
                  alignment: Alignment.center,
                  //width: MediaQuery.of(context).size.width,
                  //height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  width: MediaQuery.of(context).size.width / 2.5,
                  margin: EdgeInsets.only(top: 30),

                  //height: MediaQuery.of(context).size.width / 2.5,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        "assets/smartkey.svg",
                        width: 200,
                        height: 200,
                        color: smartkey3,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'SmartKey',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 85.0,
                      ),
                      playQuiz(),
                      playBattle(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
