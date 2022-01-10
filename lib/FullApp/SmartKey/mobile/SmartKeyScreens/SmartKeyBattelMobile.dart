import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/FullApp/SmartKey/Widget/SmartKeyBtn.dart';
import 'package:smartkit/FullApp/SmartKey/mobile/SmartKeyScreens/SmartKeyPlayMobile.dart';

class SamrtKeyBattleMobile extends StatefulWidget {
  SamrtKeyBattleMobile({Key key}) : super(key: key);

  @override
  _SamrtKeyBattleMobileState createState() => _SamrtKeyBattleMobileState();
}

class _SamrtKeyBattleMobileState extends State<SamrtKeyBattleMobile> {
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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 30.0),
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
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 1.2,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 20.0),
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.width / 2,
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
                            style: TextStyle(color: smartkey2, fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Rank: ",
                                  style: TextStyle(color: smartkey3, fontSize: 16, fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "3",
                                  style: TextStyle(color: smartkey3, fontSize: 16, fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Text(
                      "VS",
                      style: TextStyle(color: smartkey2, fontSize: 26, fontWeight: FontWeight.w900),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20.0),
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.width / 2,
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
                            style: TextStyle(color: smartkey2, fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Rank: ",
                                  style: TextStyle(color: smartkey3, fontSize: 16, fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "5",
                                  style: TextStyle(color: smartkey3, fontSize: 16, fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 6,
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
                    builder: (context) => SmartKeyPlayMobile(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
