import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/FullApp/SmartKey/Widget/SmartKeyBtn.dart';
import 'package:smartkit/FullApp/SmartKey/desktop/SmartKeyScreens/SmartKeyPlayDesktop.dart';

class SamrtKeyBattleDesktop extends StatefulWidget {
  SamrtKeyBattleDesktop({Key key}) : super(key: key);

  @override
  _SamrtKeyBattleDesktopState createState() => _SamrtKeyBattleDesktopState();
}

class _SamrtKeyBattleDesktopState extends State<SamrtKeyBattleDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: smartkeygradient),
        ),
        title: Text("Battle"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(margin: EdgeInsets.all(50),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 2.0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Container(
                    // width: MediaQuery.of(context).size.width / 3,
                    //height: MediaQuery.of(context).size.width / 2,

                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 60),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 2.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: smartkey3,
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: smartkey2,
                              child: SvgPicture.asset(
                                "assets/smartkey.svg",
                                width: 20,
                                height: 20,
                                fit: BoxFit.cover,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          "Mac",
                          style: TextStyle(
                              color: smartkey2,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Rank: ",
                                style: TextStyle(
                                    color: smartkey3,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "3",
                                style: TextStyle(
                                    color: smartkey3,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
                  SizedBox(width: 25),
                  Text(
                    "VS",
                    style: TextStyle(
                        color: smartkey2,
                        fontSize: 26,
                        fontWeight: FontWeight.w900),
                  ),
                  SizedBox(width: 25),
                  Expanded(
                      child: Container(
                    //width: MediaQuery.of(context).size.width / 3,
                    // height: MediaQuery.of(context).size.width / 2,
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 60),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 2.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: smartkey3,
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: smartkey2,
                              child: SvgPicture.asset(
                                "assets/smartkey.svg",
                                width: 20,
                                height: 20,
                                fit: BoxFit.cover,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          "Jac",
                          style: TextStyle(
                              color: smartkey2,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Rank: ",
                                style: TextStyle(
                                    color: smartkey3,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "5",
                                style: TextStyle(
                                    color: smartkey3,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
            // height: MediaQuery.of(context).size.width / 6,
          ),
          SmartKeyBtn(
            bg: smartkey2,
            title: "Let's Play",
            titlecolor: Colors.white,
            btnwidth: 200.0,
            route: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SmartKeyPlayDesktop(),
                ),
              );
            },
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
