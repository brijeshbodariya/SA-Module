import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ListTileUI extends StatelessWidget {
  const ListTileUI({
    Key key,
    this.iconTitle,
    this.title,
    this.color,
    this.iconbg,
    this.textcolor,
    this.ontap,
  }) : super(key: key);

  final String iconTitle;
  final String title;
  final Color color;
  final Color iconbg;
  final Color textcolor;
  final Widget ontap;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      child: ScreenTypeLayout(
        mobile: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ontap));
          },
          child: Container(
            width: width / 1,
            height: width / 4.2,
            decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10.0)),
            child: Center(
              child: ListTile(
                leading: Container(
                  child: Center(
                    child: Text(
                      "$iconTitle",
                      style: TextStyle(
                        fontSize: width / 18,
                        color: textcolor,
                      ),
                    ),
                  ),
                  width: width / 6.5,
                  height: width / 1,
                  decoration: BoxDecoration(
                    color: iconbg,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                title: Text(
                  "$title",
                  style: TextStyle(
                    fontSize: width / 18,
                    color: textcolor,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: width / 20, color: textcolor),
              ),
            ),
          ),
        ),
        tablet: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ontap));
          },
          child: Container(
            width: width / 1,
            height: width / 4.2,
            padding: EdgeInsets.all(width / 40),
            decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10.0)),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Center(
                      child: Text(
                        "$iconTitle",
                        style: TextStyle(
                          fontSize: width / 18,
                          color: textcolor,
                        ),
                      ),
                    ),
                    width: width / 8,
                    height: width / 8,
                    decoration: BoxDecoration(
                      color: iconbg,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  Container(
                    width: width / 1.4,
                    child: Text(
                      "$title",
                      style: TextStyle(
                        fontSize: width / 18,
                        color: textcolor,
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, size: width / 20, color: textcolor),
                ],
              ),
            ),
          ),
        ),
        desktop: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ontap));
          },
          child: Container(
            width: width / 1,
            height: width / 4.2,
            padding: EdgeInsets.all(width / 40),
            decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10.0)),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Center(
                      child: Text(
                        "$iconTitle",
                        style: TextStyle(
                          fontSize: width / 18,
                          color: textcolor,
                        ),
                      ),
                    ),
                    width: width / 8,
                    height: width / 8,
                    decoration: BoxDecoration(
                      color: iconbg,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  Container(
                    width: width / 1.4,
                    child: Text(
                      "$title",
                      style: TextStyle(
                        fontSize: width / 18,
                        color: textcolor,
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, size: width / 20, color: textcolor),
                ],
              ),

              // ListTile(
              //   leading:
              //   title:
              //   trailing:
              // ),
            ),
          ),
        ),
      ),
    );
  }
}
