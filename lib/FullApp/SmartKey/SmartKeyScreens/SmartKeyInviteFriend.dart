import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/FullApp/SmartKey/Widget/SmartKeyBtn.dart';

class SmartKeyInviteFriend extends StatefulWidget {
  SmartKeyInviteFriend({Key key}) : super(key: key);

  @override
  _SmartKeyInviteFriendState createState() => _SmartKeyInviteFriendState();
}

class _SmartKeyInviteFriendState extends State<SmartKeyInviteFriend> {
  getSnackbar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        msg,
        textAlign: TextAlign.center,
      ),
      backgroundColor: smartkey2,
      behavior: SnackBarBehavior.floating,
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      duration: const Duration(milliseconds: 1000),
    ));
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: smartkeygradient),
        ),
        title: Text("Invite Friend"),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: "https://smartkit.wrteam.in/smartkit/images/refer.png",
              width: 180,
              height: 200,
            ),
            Text(
              "Refer a friend and get 50 coins for each person that register with your code",
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CachedNetworkImage(
                imageUrl: "https://smartkit.wrteam.in/smartkit/images/steps.png",
                height: 70,
              ),
            ),
            Text("Your Referral Code"),
            MySeparator(color: Colors.grey),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "XdecA75M",
              ),
            ),
            CupertinoButton(
              child: Text(
                "Tap to Copy",
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Clipboard.setData(new ClipboardData(text: "referCode"));
                getSnackbar("Refer code copied to clipboard");
              },
            ),
            SmartKeyBtn(
              btnwidth: MediaQuery.of(context).size.width / 2.2,
              // bg: Colors.white,
              title: "Refer Nows",
              titlecolor: Colors.white,
              route: () {},
            ),
          ],
        ),
      )),
    );
  }
}

class MySeparator extends StatelessWidget {
  final double height;
  final Color color;

  const MySeparator({this.height = 1, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = 5.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}
