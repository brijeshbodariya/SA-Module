import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:smartkit/FullApp/Grobag/Helper/GrobagColor.dart';
import 'package:smartkit/FullApp/Grobag/desktop/Screen/GrobagEmailLoginDesktop.dart';
import 'package:smartkit/FullApp/Grobag/desktop/Screen/GrobagHomeDesktop.dart';

import 'GrobagSignupDesktop.dart';

class GrobagLoginDesktop extends StatefulWidget {
  @override
  _GrobagLoginDesktopState createState() => _GrobagLoginDesktopState();
}

class _GrobagLoginDesktopState extends State<GrobagLoginDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: primary,
      body: Center(
        child: SizedBox(
          width: 700,
          height: 700,
          child: Card(
            color: primary,
            elevation: 10,
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                  child: SvgPicture.network(
                    'https://smartkit.wrteam.in/smartkit/grobag/splashlogo.svg',
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(color: white, borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, bottom: 10),
                        child: Text(
                          "Welcome",
                          style: Theme.of(context).textTheme.headline6.copyWith(color: fontColor),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, bottom: 10, right: 20),
                        child: Text(
                          "If you are already have Grobag account, then you can signin from below options",
                          style: Theme.of(context).textTheme.subtitle2.copyWith(color: fontLight),
                        ),
                      ),
                      signupbtn(),
                      applebtn(),
                      googlebtn(),
                      signup(),
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

  signup() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Don't have an account? ",
          ),
          InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => GrobagSignupDesktop(),
                ));
              },
              child: Text(
                'Signup Here',
                style: Theme.of(context).textTheme.caption.copyWith(color: primary, decoration: TextDecoration.underline, fontWeight: FontWeight.normal),
              ))
        ],
      ),
    );
  }

  signupbtn() {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: new Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: 48,
        decoration: new BoxDecoration(
          color: primary,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [BoxShadow(color: Color(0x29000000), offset: Offset(0, 0), blurRadius: 3, spreadRadius: 0)],
        ),
        child: Center(
          child: Text("Continue with email",
              style: TextStyle(
                color: white,
              )),
        ),
      ),
      onPressed: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => GrobagEmailLoginDesktop()));
      },
    );
  }

  googlebtn() {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: new Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20),
        height: 48,
        decoration: new BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [BoxShadow(color: Color(0x29000000), offset: Offset(0, 0), blurRadius: 3, spreadRadius: 0)],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.network('https://smartkit.wrteam.in/smartkit/grobag/google.svg'),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text("Sign in with Google",
                  style: TextStyle(
                    color: fontColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  )),
            ),
          ],
        ),
      ),
      onPressed: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => GrobagHomeDesktop()));
      },
    );
  }

  Widget applebtn() {
    return CupertinoButton(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: new Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20),
        height: 48,
        decoration: new BoxDecoration(
          color: fontColor,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [BoxShadow(color: Color(0x29000000), offset: Offset(0, 0), blurRadius: 3, spreadRadius: 0)],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.network('https://smartkit.wrteam.in/smartkit/grobag/apple.svg'),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text("Sign in with apple",
                  style: TextStyle(
                    color: Color(0xfff8f9fb),
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  )),
            ),
          ],
        ),
      ),
      onPressed: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => GrobagHomeDesktop()));
      },
    );
  }
}
