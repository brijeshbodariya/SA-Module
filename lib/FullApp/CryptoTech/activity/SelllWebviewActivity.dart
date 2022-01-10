import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/Constant.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SellWebviewActivity extends StatefulWidget {
  String mainurl, type;

  SellWebviewActivity(this.mainurl, this.type);

  @override
  State<StatefulWidget> createState() {
    return SellWebview(this.mainurl, this.type);
  }
}

class SellWebview extends State<SellWebviewActivity> {
  String mainurl, type;
  String message = "";
  SellWebview(this.mainurl, this.type);
  bool isloading = true;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  void initState() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return new Scaffold(
        appBar: BlankBar(),
        body: Stack(
          children: <Widget>[
            WebView(
              initialUrl: mainurl,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
              javascriptChannels: <JavascriptChannel>[
                _toasterJavascriptChannel(context),
              ].toSet(),
              navigationDelegate: (NavigationRequest request) async {
                return NavigationDecision.navigate;
              },
              onPageFinished: (finish) {
                setState(() {
                  isloading = false;
                });
              },
            ),
            isloading
                ? Center(
                    child: new CircularProgressIndicator(),
                  )
                : Container(),
            message.trim().isEmpty
                ? Container()
                : Center(
                    child: Container(
                        color: ColorsRes.appcolor,
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(5),
                        child: Text(
                          message,
                          style: TextStyle(color: ColorsRes.white),
                        )))
          ],
        ));
  }

  void GoToTradePage() {
    Timer(Duration(seconds: 1), () {
      Navigator.pop(context);

      Constant.GoToMainPage("trade", context);
    });
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }
}

class BlankBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  Size get preferredSize => Size(0.0, 0.0);
}
