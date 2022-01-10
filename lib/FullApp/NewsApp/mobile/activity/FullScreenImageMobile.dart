import 'package:flutter/material.dart';

import 'package:smartkit/FullApp/NewsApp/mobile/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/NewsApp/mobile/helper/ZoomImage/photo_view.dart';

class FullScreenImageMobile extends StatelessWidget {
  final String url;
  FullScreenImageMobile(this.url);

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
          child: PhotoView(
              imageProvider: NetworkImage(
        url,
      ))),
      Container(
        margin: EdgeInsetsDirectional.only(top: MediaQuery.of(context).padding.top, start: 10),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Icon(
              Icons.keyboard_backspace,
              color: ColorsRes.white,
            ),
          ),
        ),
      ),
    ]);
  }
}
