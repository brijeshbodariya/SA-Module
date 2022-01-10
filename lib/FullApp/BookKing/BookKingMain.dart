import 'package:flutter/material.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/FullApp/BookKing/Screen/BookKingSplash.dart';

class BookKingMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Happy Shop",
      theme: ThemeData(
          fontFamily: 'Open sans',
          textTheme: TextTheme(
              headline6: TextStyle(
            color: bookKing2,
            fontWeight: FontWeight.w600,
          ))),
      debugShowCheckedModeBanner: false,
      home: BookKingSplash(),
    );
  }
}
