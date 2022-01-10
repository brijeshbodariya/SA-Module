import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:smartkit/integration/PaymentGateway/Flutterwave/overlay_loader.dart';
import 'package:smartkit/integration/helper/Constant.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GhanaPaymentWebview extends StatefulWidget {
  String authUrl, txid;
  Function callback;

  GhanaPaymentWebview(this.authUrl, this.callback, this.txid);
  //GhanaPaymentWebview({@required this.authUrl, @required this.callbackUrl});

  @override
  _WebViewWidgetState createState() => _WebViewWidgetState(this.authUrl, this.callback, this.txid);
}

class _WebViewWidgetState extends State<GhanaPaymentWebview> {
  bool loaded = false;
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool webhookSuccess = false;
  String authUrl, txid;
  Function callback;

  Map<String, dynamic> responseResult;
  RaveInAppLocalhostServer localhostServer;

  _WebViewWidgetState(this.authUrl, this.callback, this.txid);

  @override
  void initState() {
    super.initState();

    _startServer();
  }

  _startServer() async {
    localhostServer = RaveInAppLocalhostServer(
      onResponse: this.onRaveFeedback,
    );
    await localhostServer.start();
  }

  onRaveFeedback(Map<String, dynamic> feedback) {
    print("===webhookres-***-${feedback.toString()}");

    if (feedback != null && feedback.containsKey("response")) {
      this.responseResult = json.decode(feedback["response"]);
      //   this.canContinue = true;
      this.webhookSuccess = true;

      print("===webhookres--${responseResult.toString()}");

      /*  if (verificationRoute != null && verificationRouteContext != null) {
        Navigator.of(verificationRouteContext).pop(this.responseResult);
      }*/

      setState(() {});
    }
  }

  @override
  void dispose() {
    widget.callback();
    localhostServer.close();
    super.dispose();
  }

  Future<bool> onBackPress() {
    //widget.callback();
    return Future.value(false);
  }

  VerifyTransaction(String refid) async {
    setState(() {
      loaded = false;
    });
    Map vdata = {'txref': "${widget.txid}", 'SECKEY': Constant.flutterwaveSecKey};
    //var vbody = json.encode(vdata);
    var vbody = utf8.encode(json.encode(vdata));

    Response vresponse = await post(
      Uri.parse(Constant.flutterwaveVerifyUrl),
      body: vbody,
      headers: {
        "content-type": "application/json"
        //"Authorization": "Bearer " + Constant.FlutterwaveSecKey
      },
    );

    final vres = json.decode(vresponse.body);
    if (vresponse.statusCode == 200) {
      print("ghana--verify-${vresponse.body.toString()}");

      String vstatus = vres['status'];
      if (vstatus.trim().toLowerCase() == "success" || vstatus.trim().toLowerCase() == "successful") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(vres['message'] ?? "Transaction success")));
        String transId = "${widget.txid}|$refid";
        // SetTransactionData(transId);

        Navigator.of(context).pop();
      } else {
        setState(() {
          loaded = true;
        });

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(vres['message'] ?? "Transaction Failed")));
      }
    } else {
      setState(() {
        loaded = true;
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(vres['message'] ?? "Transaction Failed")));
    }
  }

  String decodeUrlFull(String uri) {
    return Uri.decodeFull(uri);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPress,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: BlankBar(),
        body: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsetsDirectional.only(top: 12, start: 10),
                    child: GestureDetector(
                      onTap: () {
                        widget.callback();
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Icon(
                          Icons.keyboard_backspace,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: WebView(
                        initialUrl: widget.authUrl,
                        javascriptMode: JavascriptMode.unrestricted,
                        onWebViewCreated: (WebViewController webViewController) {
                          print("=====complete");
                          webViewController.currentUrl().then((value) {
                            print("=====complete***$value==${value.toString()}");
                          });

                          _controller.complete(webViewController);
                        },
                        // ignore: missing_return
                        navigationDelegate: (NavigationRequest request) {
                          print("===url------******${request.url}");
                          if (request.url.startsWith(Constant.localhosturl)) {
                            String responseurl = decodeUrlFull(request.url);
                            String responsedata = responseurl.split("=")[1];
                            print("===url------******response--$responsedata");
                            final res = json.decode(responsedata);
                            String status = res['status'].toString().trim().toLowerCase();
                            /* if(status  == "success" || status == "successful"){
                              VerifyTransaction(res['data']['flwRef']);
                            }*/
                            Navigator.of(context).pop();

                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res['message'])));
                          }
                        },
                        javascriptChannels: <JavascriptChannel>[
                          _toasterJavascriptChannel(context),
                        ].toSet(),
                        onPageFinished: (String url) {
                          if (!loaded) setState(() => loaded = true);

                          print("===url----$url");
                          //if (url.startsWith(widget.callbackUrl)) {
                          // Navigator.of(context).pop();
                          //}
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (!loaded)
              Positioned.fill(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    OverlayLoaderWidget(),
                    SizedBox(height: 20),
                    Text(
                      "Please, do not close this page.",
                      style: TextStyle(
                        color: Colors.redAccent,
                      ),
                    )
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message.message)));
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

class RaveInAppLocalhostServer {
  HttpServer _server;
  int _port = 8184;
  Function(Map<String, dynamic>) _onResponse;

  RaveInAppLocalhostServer({int port = 8184, Function(Map<String, dynamic>) onResponse}) {
    this._port = port;
    this._onResponse = onResponse;
  }

  Future<void> start() async {
    if (this._server != null) {
      throw Exception('Server already started on http://127.0.0.1:$_port');
    }
    var completer = new Completer();
    runZoned(
      () {
        HttpServer.bind('127.0.0.1', _port).then((server) {
          this._server = server;
          server.listen((HttpRequest request) async {
            var qParams = request.requestedUri.queryParameters;
            if (this._onResponse != null) {
              this._onResponse(qParams);
            }
            request.response.close();
          });

          completer.complete();
        });
      },
    );

    return completer.future;
  }

  ///Closes the server.
  Future<void> close() async {
    if (this._server != null) {
      await this._server.close(force: true);

      this._server = null;
    }
  }
}
