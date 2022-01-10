import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/NewsApp/tablet/helper/ButtonClickAnimation.dart';
import 'package:smartkit/FullApp/NewsApp/tablet/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/NewsApp/tablet/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/NewsApp/tablet/helper/StringsRes.dart';
import 'package:smartkit/FullApp/NewsApp/model/Category.dart';
import 'package:smartkit/FullApp/NewsApp/model/Article.dart';
import 'package:smartkit/FullApp/NewsApp/tablet/activity/Home/NewsDetailTablet.dart';
import 'package:smartkit/FullApp/NewsApp/tablet/activity/NotificationListTablet.dart';
import 'package:smartkit/FullApp/NewsApp/tablet/activity/Profile/NewArticleTablet.dart';
import 'package:smartkit/FullApp/NewsApp/tablet/activity/SearchPageTablet.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitHome.dart';

import '../MainActivityTablet.dart';

class HomePageTablet extends StatefulWidget {
  @override
  _HomePageStateTablet createState() => _HomePageStateTablet();
}

class _HomePageStateTablet extends State<HomePageTablet> with TickerProviderStateMixin {
  List<Category> categorylist;

  TabController tabController;
  int pageno = 0;
  Category selectedcategory;

  final controller = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    categorylist = [];

    setData();
  }

  setData() async {
    categorylist = setCategoryList();

    selectedcategory = categorylist[0];

    tabController = new TabController(vsync: this, length: categorylist.length);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(),
          ),
        );
      },
      child: Scaffold(
          body: DefaultTabController(
              length: categorylist.length,
              child: NestedScrollView(
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      backgroundColor: ColorsRes.white,
                      leading: IconButton(
                        icon: Icon(Icons.add_box_outlined),
                        onPressed: () {
                          Navigator.of(context).push(CupertinoPageRoute(builder: (context) => NewArticleTablet()));
                        },
                      ),
                      title: Text(StringsRes.mainappname, style: new TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold)),
                      iconTheme: IconThemeData(
                        color: ColorsRes.appcolor,
                      ),
                      actions: <Widget>[
                        IconButton(
                            icon: Icon(
                              Icons.search,
                              color: ColorsRes.appcolor,
                            ),
                            onPressed: () {
                              Navigator.of(context).push(CupertinoPageRoute(builder: (context) => SearchPageTablet()));
                            }),
                        IconButton(
                            icon: Icon(Icons.notifications_none_outlined, color: ColorsRes.appcolor),
                            onPressed: () {
                              Navigator.of(context).push(CupertinoPageRoute(builder: (context) => NotificationListTablet()));
                            }),
                      ],
                      floating: true,
                      pinned: true,
                      snap: false,
                      primary: true,
                      forceElevated: innerBoxIsScrolled,
                      bottom: TabBar(
                        indicatorColor: ColorsRes.blue,
                        labelColor: ColorsRes.blue,
                        unselectedLabelColor: ColorsRes.grey,
                        isScrollable: true,
                        labelStyle: Theme.of(context).textTheme.subtitle1.merge(TextStyle(fontWeight: FontWeight.bold)),
                        unselectedLabelStyle: Theme.of(context).textTheme.button.merge(TextStyle(fontWeight: FontWeight.w400)),
                        controller: tabController,
                        onTap: (int tabno) {
                          pageno = tabno;
                          controller.jumpToPage(tabno);
                          selectedcategory = categorylist[tabno];
                        },
                        tabs: categorylist.map((Category category) => Tab(text: category.name)).toList(),
                      ),
                    ),
                  ];
                },
                body: categorylist.length == 0
                    ? Container()
                    : PageView(
                        controller: controller,
                        onPageChanged: (int pno) {
                          pageno = pno;
                          tabController.index = pno;
                          selectedcategory = categorylist[pno];
                        },
                        children: categorylist.map((item) {
                          return setDetailPageContent(item);
                        }).toList(),
                      ),
              ))),
    );
  }

  Widget setDetailPageContent(Category category) {
    List<Article> toplist = setNewsList(category.id);
    List<Article> bottomlist = setNewsList(category.id);
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        toplistWidget(toplist),
        bottomlistWidget(bottomlist),
      ]),
    );
  }

  Widget toplistWidget(List<Article> toplist) {
    return Container(
      height: 220,
      margin: EdgeInsets.only(left: 8),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: toplist.length,
          itemBuilder: (BuildContext context, int index) {
            Article item = toplist[index];
            return ButtonClickAnimation(
              onTap: () {
                selectednews = item;
                Navigator.of(context).push(CupertinoPageRoute(builder: (context) => NewsDetailTablet()));
              },
              child: Container(
                width: 230,
                height: 220,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Stack(children: <Widget>[
                  Card(
                    shape: DesignConfig.setRoundedBorder(Colors.transparent, 20, false),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: CachedNetworkImage(
                        imageUrl: item.image,
                        width: double.maxFinite,
                        height: double.maxFinite,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => CachedNetworkImage(imageUrl: "https://smartkit.wrteam.in/smartkit/newsapp/placeholder.png"),
                        errorWidget: (context, url, error) => CachedNetworkImage(imageUrl: "https://smartkit.wrteam.in/smartkit/newsapp/placeholder.png")),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: IntrinsicHeight(
                      child: Container(
                        width: double.maxFinite,
                        decoration: DesignConfig.boxDecorationContainerColor(Colors.white, 10),
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${item.title}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.caption.merge(TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold)),
                            ),
                            Text(
                              "${item.publshedAt}",
                              style: Theme.of(context).textTheme.caption.merge(TextStyle(
                                    color: ColorsRes.grey,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        ),
                        color: ColorsRes.black.withOpacity(0.4)),
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      GestureDetector(onTap: () {}, child: Icon(Icons.bookmark)),
                      SizedBox(width: 5),
                      GestureDetector(onTap: () {}, child: Icon(Icons.share)),
                    ]),
                  ),
                ]),
              ),
            );
          }),
    );
  }

  Widget bottomlistWidget(List<Article> bottomlist) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: bottomlist.length,
        itemBuilder: (BuildContext context, int index) {
          Article item = bottomlist[index];
          return ButtonClickAnimation(
            onTap: () {
              selectednews = item;
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) => NewsDetailTablet()));
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                Card(
                  shape: DesignConfig.setRoundedBorder(Colors.transparent, 15, false),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: CachedNetworkImage(
                      imageUrl: item.image,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => CachedNetworkImage(imageUrl: "https://smartkit.wrteam.in/smartkit/images/placeholder.png"),
                      errorWidget: (context, url, error) => CachedNetworkImage(imageUrl: "https://smartkit.wrteam.in/smartkit/images/placeholder.png")),
                ),
                SizedBox(width: 10),
                Expanded(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${item.title}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold)),
                    ),
                    Text("${item.shortdesc}", maxLines: 2, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodyText1),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(2),
                          decoration: DesignConfig.boxDecorationContainerColor(ColorsRes.red.withOpacity(0.5), 5),
                          child: Text(
                            item.newstype,
                            style: Theme.of(context).textTheme.caption.merge(TextStyle(color: ColorsRes.red)),
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(child: Text("${item.author}", maxLines: 2, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodyText1.merge(TextStyle(color: ColorsRes.blue)))),
                      ],
                    ),
                    Text(
                      "${item.publshedAt}",
                      style: Theme.of(context).textTheme.caption.merge(TextStyle(
                            color: ColorsRes.grey,
                          )),
                    ),
                  ],
                )),
                GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.bookmark_border,
                      color: ColorsRes.appcolor,
                    )),
              ]),
            ),
          );
        });
  }

  List<Category> setCategoryList() {
    List<Category> categorylist = [];
    categorylist.add(new Category(id: 1, name: "Sports"));
    categorylist.add(new Category(id: 2, name: "Entertainment"));
    categorylist.add(new Category(id: 3, name: "Politics"));
    categorylist.add(new Category(id: 4, name: "Technology"));
    categorylist.add(new Category(id: 5, name: "Education"));
    categorylist.add(new Category(id: 6, name: "Health"));
    categorylist.add(new Category(id: 7, name: "Science"));
    categorylist.add(new Category(id: 8, name: "Economy"));
    return categorylist;
  }

  List<Article> setNewsList(int categoryid) {
//filter list by categoryid

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
