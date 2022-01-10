import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitHome.dart';

class WebViewHome extends StatefulWidget {
  WebViewState createState() => WebViewState();
}

class WebViewState extends State<WebViewHome> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();
  ScrollController _scrollController = ScrollController();

  bool _isConnected = false;
  InAppWebViewController webView;
  String url = "";
  double progress = 0;
  String urls;

  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    checkNet();

    _scrollController.addListener(() {
      setState(() {
        _isVisible = _scrollController.position.userScrollDirection ==
            ScrollDirection.forward;
      });
    });
  }

  Future<bool> isNetworkAvailable() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  //Trigger method after pull to down.
  Future<void> _refresh() async {
    //Holding pull to refresh loader widget for 2 sec.
    //You can fetch data from server.
    Future.delayed(Duration(seconds: 2)).then((_) async {
      setState(() {});
    });
    return webView.reload();
  }

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
            appBar: AppBar(
              elevation: 0.1,
              backgroundColor: Colors.white,
              brightness: Brightness.light,
              title: Text('Web App'),
              toolbarHeight: 0,
            ),
            body: _isConnected
                ? RefreshIndicator(
                    key: _refreshIndicatorKey,
                    onRefresh: _refresh,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        children: [
                          Container(
                              child: progress < 1.0
                                  ? LinearProgressIndicator(
                                      value: progress,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Color(0xff006580)),
                                      backgroundColor: Color(0xFFB4B4B4))
                                  : Container(
                                      child: Offstage(
                                        offstage: _isVisible,
                                        child: RefreshIndicator(
                                          onRefresh: _refresh,
                                          child: SingleChildScrollView(
                                            controller: _scrollController,
                                            physics:
                                                AlwaysScrollableScrollPhysics(),
                                            child: Container(
                                              height: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )),
                          Expanded(child: webViewUrl()),
                        ],
                      ),
                    ),
                  )
                : Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topCenter,
                        child: Text('Pleass Check Your Internet Connection..!!',
                            style: TextStyle(
                              color: Color(0xff006580),
                              fontSize: 20.0,
                            ),
                            textAlign: TextAlign.center),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            primary: Color(0xff006580),
                            padding: EdgeInsets.all(20.0),
                          ),
                          onPressed: () async {
                            _isConnected = await isNetworkAvailable();
                            setState(() {});
                          },
                          child: Text(
                            'Try Again',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ))));
  }

  void checkNet() async {
    _isConnected = await isNetworkAvailable();
    setState(() {});
  }

  webViewUrl() {
    return InAppWebView(
      initialUrlRequest: URLRequest(url: Uri.parse("https://flutter.dev/")),
      initialOptions: InAppWebViewGroupOptions(
        android: AndroidInAppWebViewOptions(
            allowContentAccess: true,
            builtInZoomControls: true,
            thirdPartyCookiesEnabled: true,
            allowFileAccess: true,
            supportMultipleWindows: true),
        crossPlatform: InAppWebViewOptions(
            verticalScrollBarEnabled: true,
            clearCache: true,
            disableContextMenu: false,
            cacheEnabled: true,
            javaScriptEnabled: true,
            javaScriptCanOpenWindowsAutomatically: true,
            // debuggingEnabled: true,
            transparentBackground: true,
            userAgent:
                "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:61.0) Gecko/20100101 Firefox/61.0"),
      ),
      onWebViewCreated: (InAppWebViewController controller) {
        webView = controller;
      },
      onCreateWindow: (controller, createWindowRequest) async {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: InAppWebView(
                  // Setting the windowId property is important here!
                  windowId: createWindowRequest.windowId,
                  initialOptions: InAppWebViewGroupOptions(
                    android: AndroidInAppWebViewOptions(
                      builtInZoomControls: true,
                      thirdPartyCookiesEnabled: true,
                    ),
                    crossPlatform: InAppWebViewOptions(
                        cacheEnabled: true,
                        javaScriptEnabled: true,
                        //  debuggingEnabled: true,
                        userAgent:
                            "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:61.0) Gecko/20100101 Firefox/61.0"),
                  ),
                  onWebViewCreated: (InAppWebViewController controller) {},
                  // onLoadStart: (InAppWebViewController controller, String url) {
                  //   print("onLoadStart popup $url");
                  // },
                  // onLoadStop: (InAppWebViewController controller, String url) async {
                  //   print("onLoadStop popup $url");
                  // },
                  onCloseWindow: (controller) {
                    // On Facebook Login, this event is called twice,
                    // so here we check if we already popped the alert dialog context
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
            );
          },
        );

        return true;
      },
      // onLoadStart: (InAppWebViewController controller, String url) {
      //   setState(() {
      //     this.url = url;
      //   });
      // },
      // onLoadStop: (InAppWebViewController controller, String url) async {
      //   setState(() {
      //     this.url = url;
      //   });
      // },
      onProgressChanged: (InAppWebViewController controller, int progress) {
        setState(() {
          this.progress = progress / 100;
        });
      },
    );
  }
}
