import 'package:flutter/material.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';

class SmartKeyBtn extends StatelessWidget {
  final Function route;
  final String title;
  final Color bg, titlecolor;
  final double btnwidth;
  final bool shadow;
  const SmartKeyBtn({
    Key key,
    this.route,
    this.title,
    this.bg,
    this.titlecolor,
    this.btnwidth,
    this.shadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: btnwidth,
        child: Material(
          borderRadius: BorderRadius.circular(100.0),
          color: bg,
          child: InkWell(
            highlightColor: smartkey6.withOpacity(0.1),
            splashColor: smartkey6.withOpacity(0.5),
            onTap: route,
            borderRadius: BorderRadius.circular(100.0),
            child: Container(
              alignment: Alignment.center,
              height: 50.00,
              decoration: bg == null
                  ? BoxDecoration(
                      gradient: smartkeygradient,
                      borderRadius: BorderRadius.circular(100.0),
                    )
                  : BoxDecoration(
                      color: bg,

                      // gradient: smartkeygradient,

                      boxShadow: [shadow == true ? boxShadow : transboxShadow],
                      borderRadius: BorderRadius.circular(100.0),
                    ),
              child: Text(
                title,
                style: TextStyle(fontSize: 16, color: titlecolor),
              ),
            ),
          ),
        ));
  }
}
