import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:smartkit/SmartkitScreen/Screen/SmartKitAppbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webview_Route extends StatefulWidget {
  @override
  _Webview_DemoState createState() => _Webview_DemoState();
}

class _Webview_DemoState extends State<Webview_Route> {
  Completer<WebViewController> _controller = Completer<WebViewController>();
  @override
  void initState() {
    // if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: SmartKitAppbar(
            title: "Flutter UI Component",
          )),
      body: WebView(
        onWebResourceError: (_) {},
        //enter your url here
        initialUrl: 'https://google.com/',

        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
    );
  }
}
