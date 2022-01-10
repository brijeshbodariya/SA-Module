import 'package:flutter/material.dart';

import 'WebAppSpalsh.dart';

class WebAppMain extends StatelessWidget {
  const WebAppMain({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Web app",
        theme: ThemeData(
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Colors.white,
          ),
        ),
        home: WepAppSpalsh());
  }
}
