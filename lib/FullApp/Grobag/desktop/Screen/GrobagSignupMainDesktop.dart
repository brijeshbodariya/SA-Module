import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit/FullApp/Grobag/Helper/GrobagColor.dart';
import 'package:smartkit/FullApp/Grobag/desktop/Screen/GrobagLoginDesktop.dart';
import 'package:smartkit/FullApp/Grobag/desktop/Screen/GrobagSignupDesktop.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitHome.dart';

import 'GrobagHomeDesktop.dart';

class GrobagSignupMainDesktop extends StatefulWidget {
  @override
  _GrobagSignupMainDesktopState createState() => _GrobagSignupMainDesktopState();
}

class _GrobagSignupMainDesktopState extends State<GrobagSignupMainDesktop> {
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
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            title: Text('Grobag'),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
              Row(
                children: [
                  Expanded(child: CachedNetworkImage(imageUrl: "https://smartkit.wrteam.in/smartkit/grobag/back.png", fit: BoxFit.fill, height: MediaQuery.of(context).size.height)),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        applebtn(),
                        googlebtn(),
                        signupbtn(),
                        login(),
                      ],
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ));
  }

  login() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Already have an Account? ',
          ),
          InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => GrobagLoginDesktop(),
                ));
              },
              child: Text(
                'Login Here',
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
          color: Color(0xff00b65f),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [BoxShadow(color: Color(0x29000000), offset: Offset(0, 0), blurRadius: 3, spreadRadius: 0)],
        ),
        child: Center(
          child: Text("Sign Up",
              style: TextStyle(
                color: white,
              )),
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GrobagSignupDesktop(),
          ),
        );
      },
    );
  }

  googlebtn() {
    return CupertinoButton(
      padding: EdgeInsets.symmetric(vertical: 15),
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
              child: Text("Sign up with Google",
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
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => GrobagHomeDesktop(),
          ),
        );
      },
    );
  }

  applebtn() {
    return CupertinoButton(
      padding: EdgeInsets.zero,
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
              child: Text("Sign up with apple",
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
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => GrobagHomeDesktop(),
          ),
        );
      },
    );
  }
}
