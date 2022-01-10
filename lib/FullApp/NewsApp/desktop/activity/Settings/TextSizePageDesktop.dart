import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/NewsApp/desktop/helper/ButtonClickAnimation.dart';
import 'package:smartkit/FullApp/NewsApp/desktop/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/NewsApp/desktop/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/NewsApp/desktop/helper/StringsRes.dart';

class TextSizePageDesktop extends StatefulWidget {
  @override
  _TextSizePageStateDesktop createState() => _TextSizePageStateDesktop();
}

class _TextSizePageStateDesktop extends State<TextSizePageDesktop> {
  String image = "med_text.png";
  String selectedsize = StringsRes.medium;
  TextStyle settingtextstyle;

  @override
  Widget build(BuildContext context) {
    settingtextstyle = Theme.of(context).textTheme.subtitle1.merge(TextStyle(fontWeight: FontWeight.bold, color: ColorsRes.black.withOpacity(0.5)));
    return Scaffold(
      appBar: DesignConfig.setAppbar(StringsRes.textsize),
      bottomNavigationBar: IntrinsicHeight(
          child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 15),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: DesignConfig.boxDecorationContainerColor(ColorsRes.appcolor, 10),
        child: Text(
          StringsRes.lblsave,
          style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.white, fontWeight: FontWeight.bold)),
        ),
      )),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(children: [
          ButtonClickAnimation(
            onTap: () {
              setState(() {
                selectedsize = StringsRes.big;
                image = "Big_text.png";
              });
            },
            child: Row(children: [
              Expanded(
                  child: Text(
                StringsRes.big,
                style: settingtextstyle,
              )),
              if (selectedsize == StringsRes.big)
                Icon(
                  Icons.check,
                  color: ColorsRes.blue,
                )
            ]),
          ),
          Divider(
            color: ColorsRes.grey,
            height: 30,
          ),
          ButtonClickAnimation(
            onTap: () {
              setState(() {
                selectedsize = StringsRes.medium;
                image = "med_text.png";
              });
            },
            child: Row(children: [
              Expanded(
                  child: Text(
                StringsRes.medium,
                style: settingtextstyle,
              )),
              if (selectedsize == StringsRes.medium)
                Icon(
                  Icons.check,
                  color: ColorsRes.blue,
                )
            ]),
          ),
          Divider(
            color: ColorsRes.grey,
            height: 30,
          ),
          ButtonClickAnimation(
            onTap: () {
              setState(() {
                selectedsize = StringsRes.small;
                image = "Small_text.png";
              });
            },
            child: Row(children: [
              Expanded(
                  child: Text(
                StringsRes.small,
                style: settingtextstyle,
              )),
              if (selectedsize == StringsRes.small)
                Icon(
                  Icons.check,
                  color: ColorsRes.blue,
                )
            ]),
          ),
          Expanded(
              child: CachedNetworkImage(
            imageUrl: "https://smartkit.wrteam.in/smartkit/newsapp/$image",
          ))
        ]),
      ),
    );
  }
}
