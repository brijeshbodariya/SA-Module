import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewTest extends StatefulWidget {
  @override
  _WebviewTestState createState() => new _WebviewTestState();
}

class _WebviewTestState extends State<WebviewTest> {
  bool isloading = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('WebView'),
        ),
        body: Stack(
          children: [
            Column(children: <Widget>[
              Expanded(
                child: WebView(
                  initialUrl: "https://flutter.dev/",
                  javascriptMode: JavascriptMode.unrestricted,
                  onPageFinished: (String url) {
                    if (isloading)
                      setState(() {
                        isloading = false;
                      });
                  },
                ),
              ),
            ]),
            if (isloading) Center(child: new CircularProgressIndicator())
          ],
        ),
      ),
    );
  }
}
