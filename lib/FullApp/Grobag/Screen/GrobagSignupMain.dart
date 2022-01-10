import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit/FullApp/Grobag/Helper/GrobagColor.dart';
import 'package:smartkit/FullApp/Grobag/Screen/GrobagLogin.dart';
import 'package:smartkit/FullApp/Grobag/Screen/GrobagSignup.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitHome.dart';

import 'GrobagHome.dart';

class GrobagSignupMain extends StatefulWidget {
  @override
  _GrobagSignupMainState createState() => _GrobagSignupMainState();
}

class _GrobagSignupMainState extends State<GrobagSignupMain> {
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
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider("https://smartkit.wrteam.in/smartkit/grobag/back.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                applebtn(),
                googlebtn(),
                signupbtn(),
                login(),
              ],
            ),
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
                  builder: (context) => GrobagLogin(),
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
            builder: (context) => GrobagSignup(),
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
            builder: (context) => GrobagHome(),
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
            builder: (context) => GrobagHome(),
          ),
        );
      },
    );
  }
}
