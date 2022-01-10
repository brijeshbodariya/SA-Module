import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/NewsApp/mobile/helper/ButtonClickAnimation.dart';
import 'package:smartkit/FullApp/NewsApp/mobile/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/NewsApp/mobile/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/NewsApp/mobile/helper/StringsRes.dart';
import 'package:flutter/cupertino.dart';
import 'package:smartkit/FullApp/NewsApp/mobile/activity/CommentListMobile.dart';
import 'package:smartkit/FullApp/NewsApp/mobile/activity/FullScreenImageMobile.dart';
import 'package:smartkit/FullApp/NewsApp/mobile/activity/MainActivityMobile.dart';

class NewsDetailMobile extends StatefulWidget {
  @override
  _NewsDetailStateMobile createState() => _NewsDetailStateMobile();
}

class _NewsDetailStateMobile extends State<NewsDetailMobile> {
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
        title: Text(StringsRes.lblnews, style: TextStyle(color: ColorsRes.white, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(
              Icons.bookmark,
              color: ColorsRes.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8), children: [
        titleWidget(),
        SizedBox(height: 5),
        authorDateInfoWidget(),
        Divider(),
        SizedBox(height: 15),
        shortdescWidget(),
        SizedBox(height: 20),
        socialmediaWidget(),
        imageWidget(),
        SizedBox(height: 15),
        descWidget(),
      ]),
    );
  }

  Widget socialmediaWidget() {
    return Row(children: [
      SizedBox(width: 5),
      ButtonClickAnimation(
          onTap: () {},
          child: CachedNetworkImage(
            imageUrl: "https://smartkit.wrteam.in/smartkit/newsapp/FB.png",
            height: MediaQuery.of(context).size.width / 18,
            width: MediaQuery.of(context).size.width / 18,
          )),
      SizedBox(width: 15),
      ButtonClickAnimation(
          onTap: () {},
          child: CachedNetworkImage(
            imageUrl: "https://smartkit.wrteam.in/smartkit/newsapp/WP.png",
            height: MediaQuery.of(context).size.width / 18,
            width: MediaQuery.of(context).size.width / 18,
          )),
      SizedBox(width: 15),
      ButtonClickAnimation(
          onTap: () {},
          child: CachedNetworkImage(
            imageUrl: "https://smartkit.wrteam.in/smartkit/newsapp/Twitter.png",
            height: MediaQuery.of(context).size.width / 18,
            width: MediaQuery.of(context).size.width / 18,
          )),
      Spacer(),
      ButtonClickAnimation(
          onTap: () {},
          child: CachedNetworkImage(
            imageUrl: "https://smartkit.wrteam.in/smartkit/newsapp/like.png",
            height: MediaQuery.of(context).size.width / 18,
            width: MediaQuery.of(context).size.width / 18,
          )),
      SizedBox(width: 15),
      ButtonClickAnimation(
          onTap: () {
            Navigator.of(context).push(CupertinoPageRoute(builder: (context) => CommentListMobile()));
          },
          child: CachedNetworkImage(
            imageUrl: "https://smartkit.wrteam.in/smartkit/newsapp/comment.png",
            height: MediaQuery.of(context).size.width / 18,
            width: MediaQuery.of(context).size.width / 18,
          )),
      SizedBox(width: 5),
    ]);
  }

  Widget imageWidget() {
    return ButtonClickAnimation(
        onTap: () {
          Navigator.of(context).push(CupertinoPageRoute(builder: (context) => FullScreenImageMobile(selectednews.image)));
        },
        child: Card(
          shape: DesignConfig.setRoundedBorder(Colors.transparent, 15, false),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: CachedNetworkImage(
              imageUrl: selectednews.image,
              height: 250,
              fit: BoxFit.cover,
              placeholder: (context, url) => CachedNetworkImage(imageUrl: "https://smartkit.wrteam.in/smartkit/images/placeholder.png"),
              errorWidget: (context, url, error) => CachedNetworkImage(imageUrl: "https://smartkit.wrteam.in/smartkit/images/placeholder.png")),
        ));
  }

  Widget titleWidget() {
    return Text(selectednews.title, style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold)));
  }

  Widget descWidget() {
    return Text(selectednews.description, style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.grey, letterSpacing: 0.5, height: 1.3)));
  }

  Widget shortdescWidget() {
    return Text(selectednews.shortdesc, style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.grey, letterSpacing: 0.5, height: 1.3)));
  }

  Widget authorDateInfoWidget() {
    return Text("${selectednews.author}, PublishedOn: ${selectednews.publshedAt}", style: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: ColorsRes.grey)));
  }
}
