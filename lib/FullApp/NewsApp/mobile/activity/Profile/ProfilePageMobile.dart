import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/NewsApp/mobile/activity/Profile/BookmarkPostMobile.dart';
import 'package:smartkit/FullApp/NewsApp/mobile/activity/Profile/NewArticleMobile.dart';
import 'package:smartkit/FullApp/NewsApp/mobile/activity/Profile/TextPostMobile.dart';
import 'package:smartkit/FullApp/NewsApp/mobile/activity/Profile/VideoPostMobile.dart';
import 'package:smartkit/FullApp/NewsApp/mobile/helper/ButtonClickAnimation.dart';
import 'package:smartkit/FullApp/NewsApp/mobile/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/NewsApp/mobile/helper/StringsRes.dart';

import 'AudioPostMobile.dart';

class ProfilePageMobile extends StatefulWidget {
  @override
  _ProfilePageStateMobile createState() => _ProfilePageStateMobile();
}

class _ProfilePageStateMobile extends State<ProfilePageMobile> with SingleTickerProviderStateMixin {
  ScrollController scrollController;
  bool silverCollapsed = false;
  String myTitle = "WRTeam";
  double expandheight = 160;
  TabController _tabController;

  Widget _buildActions() {
    Widget profile = new GestureDetector(
      onTap: () {
        //profile setting
      },
      child: new Container(
        height: 30.0,
        width: 45.0,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey,
          image: new DecorationImage(
            image: new CachedNetworkImageProvider("https://smartkit.wrteam.in/smartkit/newsapp/defaultprofile.png"),
            fit: BoxFit.cover,
          ),
          border: Border.all(color: Colors.black, width: 2.0),
        ),
      ),
    );

    double scale;
    if (scrollController.hasClients) {
      scale = scrollController.offset / 300;
      scale = scale * 2;
      if (scale > 1) {
        scale = 1.0;
      }
    } else {
      scale = 0.0;
    }

    return new Transform(
      transform: new Matrix4.identity()..scale(scale, scale),
      alignment: Alignment.center,
      child: profile,
    );
  }

  @override
  void dispose() {
    scrollController.dispose();

    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController();
    _tabController = new TabController(vsync: this, length: 4);
    _tabController.addListener(_handleTabSelection);
    scrollController.addListener(() {
      if (scrollController.offset > expandheight && !scrollController.position.outOfRange) {
        if (!silverCollapsed) {
          // do what ever you want when silver is collapsing !

          myTitle = StringsRes.profile;
          silverCollapsed = true;
          setState(() {});
        }
      }
      if (scrollController.offset <= expandheight && !scrollController.position.outOfRange) {
        if (silverCollapsed) {
          // do what ever you want when silver is expanding !

          myTitle = "WRTeam";
          silverCollapsed = false;
          setState(() {});
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new DefaultTabController(
        length: 4,
        child: NestedScrollView(
          controller: scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: ColorsRes.appcolor,
                expandedHeight: expandheight,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    silverCollapsed ? myTitle : '',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
                  ),
                  /*  title: silverCollapsed
                      ? Text(
                          myTitle,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w400),
                        )
                      : Container(child: expandAppbarWidget()), */

                  background: expandAppbarWidget(),
                ),
                actions: <Widget>[
                  Opacity(
                    opacity: silverCollapsed ? 1 : 0,
                    child: new Padding(
                      padding: EdgeInsets.all(5.0),
                      child: _buildActions(),
                    ),
                  ),
                ],
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  silverCollapsed,
                  TabBar(
                    indicatorColor: ColorsRes.blue,
                    controller: _tabController,
                    labelColor: Colors.black87,
                    unselectedLabelColor: ColorsRes.grey,
                    tabs: [
                      Tab(
                          icon: CachedNetworkImage(
                        imageUrl: "https://smartkit.wrteam.in/smartkit/newsapp/text_post.png",
                        height: MediaQuery.of(context).size.width / 18,
                        width: MediaQuery.of(context).size.width / 18,
                        color: tabColor(0),
                      )),
                      Tab(
                          icon: CachedNetworkImage(
                        imageUrl: "https://smartkit.wrteam.in/smartkit/newsapp/video_post.png",
                        height: MediaQuery.of(context).size.width / 18,
                        width: MediaQuery.of(context).size.width / 18,
                        color: tabColor(1),
                      )),
                      Tab(
                          icon: CachedNetworkImage(
                        imageUrl: "https://smartkit.wrteam.in/smartkit/newsapp/audio_post.png",
                        height: MediaQuery.of(context).size.width / 18,
                        width: MediaQuery.of(context).size.width / 18,
                        color: tabColor(2),
                      )),
                      Tab(
                          icon: CachedNetworkImage(
                        imageUrl: "https://smartkit.wrteam.in/smartkit/newsapp/bookmark_post.png",
                        height: MediaQuery.of(context).size.width / 18,
                        width: MediaQuery.of(context).size.width / 18,
                        color: tabColor(3),
                      )),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: Container(
            margin: EdgeInsets.only(top: silverCollapsed ? kToolbarHeight : 0),
            child: new TabBarView(
              controller: _tabController,
              children: <Widget>[
                new TextPostMobile(),
                new VideoPostMobile(),
                new AudioPostMobile(),
                new BookmarkPostMobile(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  expandAppbarWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ButtonClickAnimation(
            onTap: () {
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) => NewArticleMobile()));
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 15, top: 10, bottom: 5),
              child: CachedNetworkImage(
                imageUrl: "https://smartkit.wrteam.in/smartkit/newsapp/upload.png",
                height: MediaQuery.of(context).size.width / 18,
                width: MediaQuery.of(context).size.width / 18,
              ),
            )),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Row(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: ColorsRes.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: CachedNetworkImage(
                        imageUrl: "https://smartkit.wrteam.in/smartkit/newsapp/defaultprofile.png",
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Icon(
                        Icons.add_circle,
                        color: ColorsRes.white,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(myTitle, style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.white, fontWeight: FontWeight.bold))),
                  Text("wrteam02@gmail.com",
                      style: TextStyle(
                        color: ColorsRes.white,
                      )),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: Theme.of(context).textTheme.button.merge(TextStyle(color: ColorsRes.white, fontWeight: FontWeight.bold)),
              text: "20k",
              children: <TextSpan>[
                TextSpan(text: "\nfollowers", style: TextStyle(fontWeight: FontWeight.normal)),
              ],
            ),
          ),
          SizedBox(width: 20),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: Theme.of(context).textTheme.button.merge(TextStyle(color: ColorsRes.white, fontWeight: FontWeight.bold)),
              text: "128",
              children: <TextSpan>[
                TextSpan(text: "\nfollowing", style: TextStyle(fontWeight: FontWeight.normal)),
              ],
            ),
          ),
          SizedBox(width: 20),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: Theme.of(context).textTheme.button.merge(TextStyle(color: ColorsRes.white, fontWeight: FontWeight.bold)),
              text: "10",
              children: <TextSpan>[
                TextSpan(text: "\nposts", style: TextStyle(fontWeight: FontWeight.normal)),
              ],
            ),
          ),
        ]),
        SizedBox(height: 5),
      ],
    );
  }

  tabColor(int i) {
    return _tabController.index == i
        ? ColorsRes.blue
        : silverCollapsed
            ? ColorsRes.grey.withOpacity(0.3)
            : ColorsRes.appcolor.withOpacity(0.5);
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;
  bool silverCollapsed;

  _SliverAppBarDelegate(this.silverCollapsed, this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: silverCollapsed ? ColorsRes.white : ColorsRes.appcolor.withOpacity(0.5),
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
