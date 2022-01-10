import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/FullApp/Vpn/desktop/Screens/VpnHomeDesktop.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitHome.dart';

class VpnIntroDesktop extends StatefulWidget {
  VpnIntroDesktop({Key key}) : super(key: key);

  @override
  _VpnIntroStateDesktop createState() => _VpnIntroStateDesktop();
}

class _VpnIntroStateDesktop extends State<VpnIntroDesktop> {
  String intro1 = "What is Lorem Ipsum?";
  String intro2 = "Why do we use it?";
  String intro3 = "Where can I get some?";
  String introdesc1 = "Lorem Ipsum is simply dummy text of the printing and typesetting industry.";
  String introdesc2 = "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ";
  String introdesc3 = "There are many variations of passages of Lorem Ipsum available,";

  final _controller = PageController();
  double bottompadding;
  int currentpage = 0;

  final _images = [
    "https://smartkit.wrteam.in/smartkit/vpn/intro_image_one.svg",
    "https://smartkit.wrteam.in/smartkit/vpn/intro_image_two.svg",
    "https://smartkit.wrteam.in/smartkit/vpn/intro_image_three.svg",
  ];

  List<String> _introsubtext;
  List<String> _introtitle;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    _introtitle = [intro1, intro2, intro3];
    _introsubtext = [introdesc1, introdesc2, introdesc3];
  }

  void setIntroSlider() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => VpnHomeDesktop(),
      ),
    );
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

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      child: WillPopScope(
        onWillPop: () {
          return Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MyHomePage(),
            ),
          );
        },
        child: Scaffold(
          body: PageView(
            controller: _controller,
            onPageChanged: (int pageno) {
              setState(() {
                currentpage = pageno;
              });
            },
            children: List.generate(3, (index) {
              return Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 2,
                    decoration: new BoxDecoration(
                      // color: Colors.amber,
                      // gradient: vpntopgradient,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 30.0),
                      height: MediaQuery.of(context).size.height / 2,
                      child: Center(
                          child: SvgPicture.network(
                        _images[currentpage],
                      ))),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 25.0, left: 15, right: 15),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _introtitle[currentpage],
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: vpn33, letterSpacing: 0.8, decoration: TextDecoration.none, fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            _introsubtext[currentpage],
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: Colors.black, letterSpacing: 0.5, decoration: TextDecoration.none, fontWeight: FontWeight.w400, height: 1.5)),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                            setIconSymbol(0),
                            SizedBox(width: 5),
                            setIconSymbol(1),
                            SizedBox(width: 5),
                            setIconSymbol(2),
                          ]),
                          SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              print("==test--$currentpage");

                              if (currentpage < 2) {
                                _controller.jumpToPage(currentpage + 1);
                              } else {
                                setIntroSlider();
                              }
                            },
                            child: Container(
                              decoration: vpncirculargradient_box,
                              width: double.maxFinite,
                              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: Center(
                                  child: Text(
                                "Next",
                                style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Colors.white)),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget setIconSymbol(int index) {
    return CircleAvatar(
      radius: 7,
      backgroundColor: vpn33,
      child: CircleAvatar(
        radius: 6,
        backgroundColor: currentpage == index ? vpn33 : Colors.white,
      ),
    );
  }
}
