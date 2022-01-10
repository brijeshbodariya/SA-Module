import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/NewsApp/helper/ButtonClickAnimation.dart';
import 'package:smartkit/FullApp/NewsApp/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/NewsApp/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/NewsApp/model/Article.dart';

import '../CommentList.dart';

class AudioPost extends StatefulWidget {
  @override
  _AudioPostState createState() => _AudioPostState();
}

class _AudioPostState extends State<AudioPost> {
  List<Article> mypost;

  @override
  void initState() {
    super.initState();
    // mypost = new List<Article>();
    mypost = [];
    getMyPost();
  }

  getMyPost() {
    mypost = setNewsList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: mypost.length,
        itemBuilder: (BuildContext context, int index) {
          Article item = mypost[index];
          return ButtonClickAnimation(
            onTap: () {},
            child: Container(
              decoration: DesignConfig.boxDecorationContainerColor(ColorsRes.appcolor.withOpacity(0.05), 15),
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
              padding: EdgeInsets.symmetric(horizontal: 1, vertical: 3),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                Card(
                  shape: DesignConfig.setRoundedBorder(Colors.transparent, 15, false),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: CachedNetworkImage(
                      imageUrl: item.image,
                      width: 100,
                      height: 110,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => CachedNetworkImage(imageUrl: "https://smartkit.wrteam.in/smartkit/newsapp/placeholder.png"),
                      errorWidget: (context, url, error) => CachedNetworkImage(imageUrl: "https://smartkit.wrteam.in/smartkit/newsapp/placeholder.png")),
                ),
                SizedBox(width: 10),
                Expanded(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "${item.publshedAt}",
                          style: Theme.of(context).textTheme.caption.merge(TextStyle(
                                color: ColorsRes.grey.withOpacity(0.5),
                              )),
                        ),
                        Text(
                          "\t,1 hour ago\t",
                          style: Theme.of(context).textTheme.caption.merge(TextStyle(
                                color: ColorsRes.grey.withOpacity(0.5),
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      "${item.title}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(height: 5),
                    Row(children: [
                      ButtonClickAnimation(
                          child: Icon(
                            Icons.play_circle_outline,
                            color: ColorsRes.blue,
                          ),
                          onTap: () {}),
                      SizedBox(width: 8),
                      Expanded(child: CachedNetworkImage(imageUrl: "https://smartkit.wrteam.in/smartkit/newsapp/audio.png"))
                    ]),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        Row(
                          children: [
                            CachedNetworkImage(
                              imageUrl: "https://smartkit.wrteam.in/smartkit/newsapp/like.png",
                              width: MediaQuery.of(context).size.width / 20,
                            ),
                            Text(
                              "\t15.5k",
                              style: Theme.of(context).textTheme.caption,
                            )
                          ],
                        ),
                        ButtonClickAnimation(
                          onTap: () {
                            Navigator.of(context).push(CupertinoPageRoute(builder: (context) => CommentList()));
                          },
                          child: Row(
                            children: [
                              CachedNetworkImage(
                                imageUrl: "https://smartkit.wrteam.in/smartkit/newsapp/comment.png",
                                width: MediaQuery.of(context).size.width / 20,
                              ),
                              Text(
                                "\t5.5k",
                                style: Theme.of(context).textTheme.caption,
                              )
                            ],
                          ),
                        ),
                      ]),
                    ),
                    SizedBox(height: 5),
                  ],
                )),
              ]),
            ),
          );
        });
  }

  List<Article> setNewsList() {
    List<Article> newslist = [];

    newslist.add(new Article(
        title: "Hurricane Hanna makes landfall around 5 p.m. on Saturday.",
        author: "Dan Peck",
        description: "Hurricane Hanna battered southern Texas with sustained winds of 75 mph and continued to deliver heavy rain and flash flooding as it moved inland late Saturday.",
        shortdesc: "Hurricane Hanna battered southern Texas with sustained winds of 75 mph and continued to deliver heavy rain and flash flooding",
        image: "https://s.abcnews.com/images/US/hanna-swimmer-mo_hpMain_20200725-163152_2_4x3t_384.jpg",
        publshedAt: "Feb 10,2021",
        newstype: "Hot"));

    newslist.add(new Article(
        title: "Nicki Minaj's Husband Gets Permission To Be There For Baby's Birth",
        author: "TMZ Staff",
        description:
            "Kenneth can be in the room when Nicki gives birth ... a judge just granted his request to tweak his pre-trial release conditions so he can travel with Nicki. With the court's order in place, KP can travel with Nicki periodically on biz…",
        shortdesc: "Kenneth can be in the room when Nicki gives birth ... a judge just granted his request to tweak his pre-trial ",
        image: "https://imagez.tmz.com/image/c1/4by3/2020/07/30/c115ad2dc849438a97a0ad3097b416df_md.jpg",
        publshedAt: "Jun 12,2020",
        newstype: "Hot"));

    newslist.add(new Article(
        title: "New Lions safety Jayron Kearse suspended three games",
        author: "Michael Rothstein",
        description: "Kearse, 26, signed with the Lions in March after four seasons in Minnesota, where he played in 62 games with five starts, making 79 tackles and defending eight passes.",
        shortdesc: "Kearse, 26, signed with the Lions in March after four seasons in Minnesota, where he played in 62 games with five starts",
        image: "https://a4.espncdn.com/combiner/i?img=%2Fphoto%2F2020%2F0111%2Fr651071_1296x729_16%2D9.jpg",
        publshedAt: "Dec 12,2020",
        newstype: "Hot"));

    newslist.add(new Article(
        title: "Tesla stock falls further after Elon Musk loses \$15B in single day",
        author: "Noah Manskar",
        description:
            "Tesla’s stock price fell for the fourth straight day Tuesday after its massive Monday plunge wiped \$15 billion off CEO Elon Musk’s net worth. The electric-car maker’s shares slipped 4.9 percent to \$679.40 in premarket trading as of 8:03 a.m., putting it on tr…",
        shortdesc:
            "Tesla’s stock price fell for the fourth straight day Tuesday after its massive Monday plunge wiped \$15 billion off CEO Elon Musk’s net worth. The electric-car maker’s shares slipped 4.9 percent to \$679.40 in premarket trading as of 8:03 a.m.",
        image: "https://nypost.com/wp-content/uploads/sites/2/2021/02/CRYPTO-CURRENCY_TESLA-CLIMATE.jpg?quality=90&strip=all&w=1200",
        publshedAt: "Dec 15,2020",
        newstype: "Hot"));

    return newslist;
  }
}
