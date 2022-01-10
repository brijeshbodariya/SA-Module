import 'package:flutter/material.dart';

class BgTile extends StatefulWidget {
  const BgTile({
    Key key,
    this.height,
    this.widgetname,
  }) : super(key: key);

  // final String iconTitle;
  // final String title;
  final double height;
  // final Color iconbg;
  // final Color textcolor;
  final Widget widgetname;

  @override
  _BgTileState createState() => _BgTileState();
}

class _BgTileState extends State<BgTile> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
        margin: EdgeInsets.only(bottom: 10.0),
        width: width / 1,
        height: width / widget.height,
        decoration: BoxDecoration(
            // color: widget.color,
            borderRadius: BorderRadius.circular(10.0)),
        child: widget.widgetname
        // child: Center(
        //   child: ListTile(
        //     leading: Container(
        //       // child: Center(
        //       //   child:
        //       //    Text(
        //       //     "$iconTitle",
        //       //     style: TextStyle(
        //       //       fontSize: width / 18,
        //       //       color: textcolor,
        //       //     ),
        //       //   ),
        //       // ),
        //       width: width / 6.5,
        //       height: width / 1,
        //       decoration: BoxDecoration(
        //         color: iconbg,
        //         borderRadius: BorderRadius.circular(10.0),
        //       ),
        //     ),
        //     title: Text(
        //       "$title",
        //       style: TextStyle(
        //         fontSize: width / 18,
        //         color: textcolor,
        //       ),
        //     ),
        //     trailing: Icon(Icons.arrow_forward_ios, size: width / 20, color: textcolor),
        //   ),
        // ),
        );
  }
}
