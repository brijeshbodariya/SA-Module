import 'dart:async';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitHome.dart';
import 'package:smartkit/integration/helper/DesignConfig.dart';
import 'package:smartkit/integration/helper/ColorsRes.dart';


class FirebaseDynamicLinking extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FirebaseDynamicLinkingState();
}

class FirebaseDynamicLinkingState extends State<FirebaseDynamicLinking> {
  String dynamicLink;
  bool createLink = false;

  @override
  void initState() {
    super.initState();
    firebaseDynamicLinks();
    generateDynamicLink(true);
  }

  Future<void> firebaseDynamicLinks() async {
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLink) async {
          final Uri deepLink = dynamicLink?.link;
          if (deepLink != null) {
            Navigator.pushNamed(context, deepLink.path);
          }
        }, onError: (OnLinkErrorException e) async {
      print('onLinkError');
      print(e.message);
    });

    final PendingDynamicLinkData data =
    await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri deepLink = data?.link;

    if (deepLink != null) {
      Navigator.pushNamed(context, deepLink.path);
    }
  }

  Future<void> generateDynamicLink(bool short) async {
    setState(() {
      createLink = true;
    });

    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://smartkit.page.link',
      link: Uri.parse('https://smartkit.com/smartkit'),
      androidParameters: AndroidParameters(
        packageName: 'com.example.SA_module',
        minimumVersion: 0,
      ),
      dynamicLinkParametersOptions: DynamicLinkParametersOptions(
        shortDynamicLinkPathLength: ShortDynamicLinkPathLength.short,
      ),
      iosParameters: IosParameters(
        bundleId: 'com.example.SA_module',
        minimumVersion: '0',
      ),
    );

    Uri url;
    if (short) {
      final ShortDynamicLink shortLink = await parameters.buildShortLink();
      url = shortLink.shortUrl;
    } else {
      url = await parameters.buildUrl();
    }
    setState(() {
      dynamicLink = url.toString();
      createLink = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(title: const Text('Firebase Dynamic Linking',style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,leading: BackButton(
            color: Colors.black
        ),),
        body: Builder(builder: (BuildContext context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(onPressed: () async {Share.share(dynamicLink);},
                 child:  Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: DesignConfig.boxDecorationContainerColor(ColorsRes.appcolor, 10),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.share, color: ColorsRes.white),
                      SizedBox(width: 20),
                      Text("Share With Friends", style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.white, fontWeight: FontWeight.bold)),),
                    ],
                  ),
                )),
              ],
            ),
          );
        }),
      ),
    );
  }
}