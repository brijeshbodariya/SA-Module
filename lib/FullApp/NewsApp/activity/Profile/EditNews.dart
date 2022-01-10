import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/NewsApp/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/NewsApp/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/NewsApp/helper/StringsRes.dart';

import '../MainActivity.dart';

class EditNews extends StatefulWidget {
  @override
  _EditNewsState createState() => _EditNewsState();
}

class _EditNewsState extends State<EditNews> {
  TextEditingController edttitle = new TextEditingController(text: selectednews.title);
  TextEditingController edtshortdesc = new TextEditingController(text: selectednews.shortdesc);
  TextEditingController edtdesc = new TextEditingController(text: selectednews.description);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: ColorsRes.white,
        ),
        elevation: 3,
        backgroundColor: ColorsRes.appcolor,
        centerTitle: true,
        title: Text(StringsRes.editarticle, style: TextStyle(color: ColorsRes.white, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(
              Icons.check,
              color: ColorsRes.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8), children: [
        titleWidget(),
        Divider(),
        SizedBox(height: 15),
        shortdescWidget(),
        SizedBox(height: 20),
        imageWidget(),
        SizedBox(height: 15),
        descWidget(),
      ]),
    );
  }

  Widget imageWidget() {
    return Stack(
      children: [
        Card(
          margin: EdgeInsets.only(bottom: 15),
          shape: DesignConfig.setRoundedBorder(Colors.transparent, 15, false),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: CachedNetworkImage(
              imageUrl: selectednews.image,
              height: 250,
              fit: BoxFit.cover,
              placeholder: (context, url) => CachedNetworkImage(imageUrl: "https://smartkit.wrteam.in/smartkit/newsapp/placeholder.png"),
              errorWidget: (context, url, error) => CachedNetworkImage(imageUrl: "https://smartkit.wrteam.in/smartkit/newsapp/placeholder.png")),
        ),
        Positioned.fill(
            child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: CircleAvatar(child: Icon(Icons.edit)),
                )))
      ],
    );
  }

  Widget titleWidget() {
    return TextFormField(
      style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold)),
      cursorColor: ColorsRes.black,
      decoration: InputDecoration(
        hintText: StringsRes.title,
        hintStyle: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: ColorsRes.grey)),
        //border: InputBorder.none,
      ),
      keyboardType: TextInputType.multiline,
      maxLines: null,
      controller: edttitle,
    );
  }

  Widget descWidget() {
    return TextFormField(
      style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.grey, letterSpacing: 0.5, height: 1.3)),
      cursorColor: ColorsRes.black,
      decoration: InputDecoration(
        hintText: StringsRes.description,
        hintStyle: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: ColorsRes.grey)),
        //border: InputBorder.none,
      ),
      keyboardType: TextInputType.multiline,
      maxLines: null,
      controller: edtdesc,
    );
  }

  Widget shortdescWidget() {
    return TextFormField(
      style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.grey, letterSpacing: 0.5, height: 1.3)),
      cursorColor: ColorsRes.black,
      decoration: InputDecoration(
        hintText: StringsRes.shortdescription,
        hintStyle: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: ColorsRes.grey)),
        //border: InputBorder.none,
      ),
      keyboardType: TextInputType.multiline,
      maxLines: null,
      controller: edtshortdesc,
    );
  }
}
